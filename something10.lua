ID = 537413528

if game.PlaceId == ID then

local speed = 10  -- Speed multiplier (increase this to go faster)

local ForestStage = game.Workspace.BoatStages.NormalStages.ForestStage -- stage 1
local stages = game.Workspace.BoatStages.NormalStages -- all stages
local endChest = game.Workspace.BoatStages.NormalStages.TheEnd.GoldenChest -- go to the chest at the end to claim the reward

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Variable to store the BodyVelocity
local bodyVelocity

-- Rayfield setup
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Build A Boat",
    Icon = 0,
    LoadingTitle = "build a boat for treasure",
    LoadingSubtitle = "by Avexy",
    Theme = "DarkBlue",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Big Hub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Key System",
        Note = "to get the key join: discord.gg/HVqTMP2UgX",
        FileName = "Key",
        SaveKey = true,
        Key = {"A1HUQ-OZOII-CEZ3J-U14AE-PR57N"}
    }
})

-- Glide Function to move to stages
local function glideToTarget(targetPart)
    if not _G.autoFarm then return end  -- Don't glide if auto-farm is off

    -- Ensure the HumanoidRootPart isn't anchored
    rootPart.Anchored = false

    -- Create BodyVelocity instance to apply constant velocity
    if not bodyVelocity then
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(100000, 4000, 100000)  -- High force for fast movement
        bodyVelocity.P = 80000  -- Powerful force for faster movement
        bodyVelocity.Parent = rootPart
    end

    -- Set velocity towards the target
    bodyVelocity.Velocity = (targetPart.Position - rootPart.Position).unit * 1000  -- Adjust speed (1000 for fast glide)
end

-- Function to stop gliding and remove BodyVelocity
local function stopGliding()
    if bodyVelocity then
        bodyVelocity:Destroy()  -- Remove BodyVelocity when gliding is off
        bodyVelocity = nil
    end
end

-- Function to go through all stages
local function glideThroughStages()
    -- Loop through the stages and look for matching stage names
    for i = 1, 10 do
        task.wait(0.1)  -- Short delay between stages to prevent overloading
        for _, stage in ipairs(stages:GetChildren()) do
            if stage.Name == "CaveStage" .. i then
                print("Found " .. stage.Name)
                if stage:FindFirstChild("DarknessPart") then
                    glideToTarget(stage.DarknessPart)  -- Start gliding to the target stage's DarknessPart
                    -- Wait until the character reaches the current stage
                    repeat
                        task.wait(0.1)
                    until (rootPart.Position - stage.DarknessPart.Position).Magnitude < 5  -- Check if near the target
                    print("Reached " .. stage.Name .. ", moving to next stage.")
                end
            end
        end
    end
end

-- Auto Farm Toggle
local Tab = Window:CreateTab("Auto Farm", 4483362458) -- Title, Image
local Toggle = Tab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        _G.autoFarm = Value
        if _G.autoFarm then
            glideThroughStages()  -- Start the gliding when toggle is on
        else
            stopGliding()  -- Stop the gliding when toggle is off
        end
    end,
})

    
end
