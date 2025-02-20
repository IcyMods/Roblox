-- works for most games not all... if FPS games have a customized character then it wont work. |  ROBLOX

-- Services
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

-- Variables
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Configuration
_G.AimAssistEnabled = true
_G.Smoothness = 1 -- Set to 1 for instant lock-on, lower values for smoother aiming
_G.FOV = 100 -- Field of View for aim assist
_G.Distance = 1200 -- Maximum distance to target
_G.AimPart = "Head" -- Change to "HumanoidRootPart" or "Torso" if needed

-- Function to get the closest player
local function GetClosestPlayer()
	local closestPlayer = nil
	local closestDistance = _G.Distance
	local mousePosition = UIS:GetMouseLocation()

	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Team ~= LocalPlayer.Team and player.Character and player.Character:FindFirstChild(_G.AimPart) then
			local partPosition = player.Character[_G.AimPart].Position
			local screenPosition, onScreen = Camera:WorldToViewportPoint(partPosition)

			if onScreen then
				local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - mousePosition).Magnitude

				if distance < closestDistance and distance < _G.FOV then
					closestPlayer = player
					closestDistance = distance
				end
			end
		end
	end

	return closestPlayer
end

-- Aim at the target
local function AimAt(target)
	if target and target.Character and target.Character:FindFirstChild(_G.AimPart) then
		local aimPosition = target.Character[_G.AimPart].Position
		local direction = (aimPosition - Camera.CFrame.Position).unit
		local newCFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + direction)

		-- Instant lock-on with optional smoothing
		Camera.CFrame = Camera.CFrame:Lerp(newCFrame, _G.Smoothness)
	end
end

-- AimAssist Activation (Right Mouse Button Hold)
UIS.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton2 then
		_G.aim = true

		-- Start the aim assist loop
		while _G.aim and _G.AimAssistEnabled do
			local target = GetClosestPlayer()
			if target then
				AimAt(target)
			end
			RunService.RenderStepped:Wait()
		end
	end
end)

-- End the aim assist loop
UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton2 then
		_G.aim = false
	end
end)
