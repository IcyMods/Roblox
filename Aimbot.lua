local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

_G.AimAssistEnabled = true
_G.Smoothness = 5
_G.FOV = 150
_G.Distance = 500
_G.AimPart = "Head" -- Change to "HumanoidRootPart" if needed

-- Function to get the closest player
local function GetClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = _G.Distance

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild(_G.AimPart) then
            local partPosition = player.Character[_G.AimPart].Position
            local screenPosition, onScreen = Camera:WorldToViewportPoint(partPosition)
            
            if onScreen then
                local mousePosition = UserInputService:GetMouseLocation()
                local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - mousePosition).Magnitude

                if distance < shortestDistance and distance < _G.FOV then
                    closestPlayer = player
                    shortestDistance = distance
                end
            end
        end
    end

    return closestPlayer
end

-- Smoothly aim at the target
local function AimAt(target)
    if target and target.Character and target.Character:FindFirstChild(_G.AimPart) then
        local aimPosition = target.Character[_G.AimPart].Position
        local direction = (aimPosition - Camera.CFrame.Position).unit
        local newCFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + direction)

        Camera.CFrame = Camera.CFrame:Lerp(newCFrame, _G.Smoothness / 100)
    end
end

-- AimAssist Activation (Right Mouse Button Hold)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) and _G.AimAssistEnabled do
            local target = GetClosestPlayer()
            if target then
                AimAt(target)
            end
            RunService.RenderStepped:Wait()
        end
    end
end)
