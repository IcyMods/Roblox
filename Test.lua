-- LocalScript in StarterPlayerScripts
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

local isRightMouseDown = false
local targetPlayer = nil

-- Function to check if a player is a teammate
local function isTeammate(player)
    return player.Team == LocalPlayer.Team
end

-- Function to create a new ESP box with a health bar
local function createESP(player)
    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = Color3.new(1, 0, 0) -- Red color
    box.Thickness = 1
    box.Filled = false

    local healthBar = Drawing.new("Square")
    healthBar.Visible = false
    healthBar.Color = Color3.new(0, 1, 0) -- Green color
    healthBar.Thickness = 1
    healthBar.Filled = true

    local function updateESP()
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") then
            local rootPart = player.Character.HumanoidRootPart
            local humanoid = player.Character.Humanoid

            local screenPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
            if onScreen and not isTeammate(player) then
                -- Calculate the ESP box size and position
                local head = player.Character:FindFirstChild("Head")
                if head then
                    local headPos = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
                    local rootPos = Camera:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 3, 0))

                    box.Size = Vector2.new(math.abs(headPos.X - rootPos.X), math.abs(headPos.Y - rootPos.Y))
                    box.Position = Vector2.new(rootPos.X - box.Size.X / 2, rootPos.Y - box.Size.Y / 2)
                    box.Visible = true

                    -- Health bar
                    local healthPercentage = humanoid.Health / humanoid.MaxHealth
                    healthBar.Size = Vector2.new(4, box.Size.Y * healthPercentage)
                    healthBar.Position = Vector2.new(box.Position.X - 6, box.Position.Y + (box.Size.Y * (1 - healthPercentage)))
                    healthBar.Visible = true
                else
                    box.Visible = false
                    healthBar.Visible = false
                end
            else
                box.Visible = false
                healthBar.Visible = false
            end
        else
            box.Visible = false
            healthBar.Visible = false
        end
    end

    -- Update the ESP box and health bar on RenderStepped
    RunService.RenderStepped:Connect(updateESP)

    -- Remove the ESP box and health bar when the player leaves
    player.AncestryChanged:Connect(function()
        if not player:IsDescendantOf(Players) then
            box:Remove()
            healthBar:Remove()
        end
    end)
end

-- Function to get the closest player to the crosshair
local function getClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and not isTeammate(player) and player.Character and player.Character:FindFirstChild("Head") then
            local head = player.Character.Head
            local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)

            if onScreen then
                local mousePos = UserInputService:GetMouseLocation()
                local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude

                if distance < shortestDistance then
                    closestPlayer = player
                    shortestDistance = distance
                end
            end
        end
    end

    return closestPlayer
end

-- Function to aim at the target player's head
local function aimAtTarget()
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
        local head = targetPlayer.Character.Head
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, head.Position)
    end
end

-- Detect when the right mouse button is pressed
UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        isRightMouseDown = true
        targetPlayer = getClosestPlayer()
    end
end)

-- Detect when the right mouse button is released
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        isRightMouseDown = false
        targetPlayer = nil
    end
end)

-- Update the aim lock every frame
RunService.RenderStepped:Connect(function()
    if isRightMouseDown then
        aimAtTarget()
    end
end)

-- Create ESP boxes for all players, except the local player and teammates
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer and not isTeammate(player) then
        createESP(player)
    end
end

-- Create ESP boxes for new players who join
Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer and not isTeammate(player) then
        createESP(player)
    end
end)
