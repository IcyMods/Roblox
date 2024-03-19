# Roblox Exp Games

![GamesLua](https://github.com/IcyMods/Roblox/assets/163366867/85edae72-b9d7-4ed7-be32-3ae356bd6a80)


` code() `


```lua
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Speed Simulator", IntroText = "ICY MODS", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local MainTab = Window:MakeTab({
	Name = "Game",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local teleportOrbsEnabled = false
local teleportOrbsLoop

MainTab:AddToggle({
    Name = "Teleport orbs to you",
    Default = false,
    Callback = function(ToggleValue)
        teleportOrbsEnabled = ToggleValue
        if teleportOrbsEnabled then
            teleportOrbsLoop = game:GetService("RunService").Heartbeat:Connect(function()
                local player = game.Players.LocalPlayer
                local OrbsFolder = game.Workspace.orbFolder.Desert or game.Workspace.orbFolder.City

                for _, Orbs in ipairs(OrbsFolder:GetChildren()) do
                    Orbs:SetPrimaryPartCFrame(CFrame.new(player.Character.HumanoidRootPart.Position))
                end
            end)
        else
            if teleportOrbsLoop then
                teleportOrbsLoop:Disconnect()
            end
        end
    end
})

local teleportHoopEnabled = false
local teleportHoopLoop

MainTab:AddToggle({
    Name = "Teleport Hoops to you",
    Default = false,
    Callback = function(ToggleValue2)
        teleportHoopEnabled = ToggleValue2
        if teleportHoopEnabled then
            teleportHoopLoop = game:GetService("RunService").Heartbeat:Connect(function()
                local player = game.Players.LocalPlayer
                local HoopsFolder = game.Workspace.Hoops

                for _, Hoops in ipairs(HoopsFolder:GetChildren()) do
                    Hoops.Position = player.Character.HumanoidRootPart.Position
                end
            end)
        else
            if teleportHoopLoop then
                teleportHoopLoop:Disconnect()
            end
        end
    end
})
```
