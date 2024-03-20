local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "The Legends of the bone sword", IntroText = "ICY MODS", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local AutoFarm1 = Window:MakeTab({
	Name = "Auto Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = AutoFarm1:AddSection({
	Name = "OP"
})

AutoFarm1:AddButton({
	Name = "Get Secret Sword",
	Callback = function()
        local Secrets = game.Workspace.Secrets
        local Finish = Secrets.Obby.Spawns.Finish
        local player = game.Players.LocalPlayer
        Finish.Transparency = 1
        Finish.Position = player.Character.HumanoidRootPart.Position
        wait(.00000000000001)
        Finish.Position = player.Character.Torso.Position
  	end    
})

AutoFarm1:AddButton({
    Name = "TP Enemies to you (Based on level)",
    Callback = function()
        local Enemies = game.Workspace.Enemies
        local player = game.Players.LocalPlayer
        local character = player.Character
        local playerLevel = game.ReplicatedStorage.PlayerData.u63u37u35as90.Stats.Level -- set username here

        if playerLevel.Value < 5 then
            local enemiesToTeleport = {"Goblin", "Goblin Leader"}
            for _, enemyName in ipairs(enemiesToTeleport) do
                for _, Enemy in ipairs(Enemies:GetChildren()) do
                    if Enemy.Name == enemyName then
                        local teleportPosition = character.HumanoidRootPart.Position + character.HumanoidRootPart.CFrame.LookVector * 3
                        Enemy:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
                    end
                end
            end
        elseif playerLevel.Value < 10 then
            local enemiesToTeleport = {"Mummy", "Sandman"}
            for _, enemyName in ipairs(enemiesToTeleport) do
                for _, Enemy in ipairs(Enemies:GetChildren()) do
                    if Enemy.Name == enemyName then
                        local teleportPosition = character.HumanoidRootPart.Position + character.HumanoidRootPart.CFrame.LookVector * 3
                        Enemy:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
                    end
                end
            end
        elseif playerLevel.Value < 20 then
            local enemiesToTeleport = {"Ice Guardian", "Frostbite Ice Knight"}
            for _, enemyName in ipairs(enemiesToTeleport) do
                for _, Enemy in ipairs(Enemies:GetChildren()) do
                    if Enemy.Name == enemyName then
                        local teleportPosition = character.HumanoidRootPart.Position + character.HumanoidRootPart.CFrame.LookVector * 3
                        Enemy:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
                    end
                end
            end
        elseif playerLevel.Value < 30 then
            local enemiesToTeleport = {"Skeleton", "Skeleton King"}
            for _, enemyName in ipairs(enemiesToTeleport) do
                for _, Enemy in ipairs(Enemies:GetChildren()) do
                    if Enemy.Name == enemyName then
                        local teleportPosition = character.HumanoidRootPart.Position + character.HumanoidRootPart.CFrame.LookVector * 3
                        Enemy:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
                    end
                end
            end
        end
    end
})
