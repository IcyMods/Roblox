local ID = 537413528

local GameName = "Build A Boat For Treasure"
local TeleportService = game:GetService("TeleportService")

if game.PlaceId == ID then

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character.HumanoidRootPart

local endChest = game.Workspace.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger
local stages = game.Workspace.BoatStages.NormalStages

local farmSpeed = 1000  -- Default speed
local noclipEnabled = false  -- Toggle for noclip mode
_G.autoCollectGold = false

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- when the first key is expired then replace the second key to the first row
local keys = {
    { key = "UT3EO-840R6-I73JD-8XST6", expires = 1555555 }, -- get current date x by 2 - FEB 8TH
    { key = "FFN6B-9JWTT-P79VX-98Q7T", expires = 1740276000 }, -- get current date x by 2 - FEB 22TH
}

-- Function to get a valid key
local function getValidKey(keys)
    if keys then
        local currentTime = os.time()

        for _, data in ipairs(keys) do
            -- If current time is less than the expiration time, the key is still valid
            if currentTime < data.expires then
                return data.key, data.expires
            end
        end
    end
    return nil, nil
end

-- Get valid key and its expiration time
local validKey, expirationTime = getValidKey(keys)

if validKey then
    --print("[KeySystem] Using valid key:", validKey)
else
    warn("[KeySystem] No valid key found!")
end

-- Now proceed with the rest of your Rayfield window code
local Window = Rayfield:CreateWindow({
    Name = "Build A Boat For Treasure | Made by @Avexy",
    Icon = 0,
    LoadingTitle = "Build A Boat For Treasure",
    LoadingSubtitle = "by @avexy",
    Theme = "DarkBlue",

    ConfigurationSaving = {
        Enabled = true,
        FileName = "Big Hub"
    },

    Discord = {
        Enabled = true,
        Invite = "HVqTMP2UgX",
        RememberJoins = true
    },

    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
        Title = "Key System",
        Subtitle = "",
        Note = "join the discord to get key: discord.gg/HVqTMP2UgX", -- Use this to tell the user how to get a key
        FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
        SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
        GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = { validKey } -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

if validKey and expirationTime then
    -- Only proceed if we have a valid key and expiration time
    task.spawn(function()
        while true do
            local currentTime = os.time()

            if currentTime >= expirationTime then
                --print("[KeySystem] First key expired! Destroying UI...")
                Window:Destroy() -- Destroy the Rayfield window
                break
            end

            task.wait(1) -- Check every second
        end
    end)
else
    warn("[KeySystem] No valid key found or expiration time is invalid!")
end

-- lua is most easiest programming language out their

local Tab = Window:CreateTab("Auto Farm", 17349147244)

local SettingsTab = Window:CreateTab("Settings", 18877957191) -- Title, Image

local allStagesProcessed = false

local ignoreZones = {
    workspace.Teams.BlackTeam,
    workspace.Teams.CamoTeam,
    workspace.Teams.MagentaTeam,
    workspace.Teams["New YellerTeam"],
    workspace.Teams["Really blueTeam"],
    workspace.Teams["Really redTeam"],
    workspace.Teams.WhiteTeam,
    workspace.BlackZone,
    workspace.CamoZone,
    workspace.MagentaZone,
    workspace["New YellerZone"],
    workspace["Really blueZone"],
    workspace["Really redZone"],
    workspace.Sand,
    workspace.Water,
    workspace.WhiteZone
}

local function toggleNoclip()
    noclipEnabled = not noclipEnabled

    -- Enable or disable noclip mode for all parts in the workspace
    if noclipEnabled then
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                -- Skip parts that are inside the ignore zones
                local skipPart = false
                for _, zone in pairs(ignoreZones) do
                    if zone:IsAncestorOf(part) then
                        skipPart = true
                        break
                    end
                end
                
                if not skipPart then
                    part.CanCollide = false
                end
            end
        end
        --print("Noclip enabled for the entire workspace except for the ignore zones.")
    else
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                -- Skip parts that are inside the ignore zones
                local skipPart = false
                for _, zone in pairs(ignoreZones) do
                    if zone:IsAncestorOf(part) then
                        skipPart = true
                        break
                    end
                end
                
                if not skipPart then
                    part.CanCollide = true
                end
            end
        end
        --print("Noclip disabled for the entire workspace except for the ignore zones.")
    end
end

local function destroyBodyVel()
    for _, char in ipairs(humanoidRootPart:GetChildren()) do
        while true do
            if char:FindFirstChild("BodyVelocity") then
                char.BodyVelocity:Destroy()
            end
            task.wait(0.3)
        end
    end
end

local function moveToTarget(targetCFrame, isChest)
    humanoidRootPart.Anchored = false
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(1000000, 1000000, 1000000)

    -- Use a different threshold depending on whether we're going to the chest or not
    local threshold = isChest and 5 or 60

    while (humanoidRootPart.Position - targetCFrame.Position).Magnitude > threshold do
        local direction = (targetCFrame.Position - humanoidRootPart.Position).unit
        bodyVelocity.Velocity = direction * farmSpeed  -- Use the speed set by the slider
        bodyVelocity.Parent = humanoidRootPart
        bodyVelocity.Name = "BodyVelocity"
        humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position, targetCFrame.Position)
        task.wait(0.1)
    end

    bodyVelocity:Destroy()
end

local function startAutoFarm()
    -- Main loop for Auto Farm
    while _G.autoFarm do
        if not _G.autoFarm then
            print("Auto farm stopped.")
            destroyBodyVel()
            allStagesProcessed = false
            humanoidRootPart.Anchored = false  -- Unanchor the character when stopping the farm
            return  -- Exit the function to stop the loop
        end

        -- Iterate through all the stages
        for _, stage in ipairs(stages:GetChildren()) do
            humanoidRootPart.Anchored = false  -- Ensure character can move

            local stageNumber = tonumber(stage.Name:match("CaveStage(%d+)"))
        
            if stageNumber and stageNumber >= 1 and stageNumber <= 10 then
                -- Fire Remote Event for each stage (except chest)
                if stage:FindFirstChild("DarknessPart") then
                    stage.DarknessPart.CanCollide = false
                    moveToTarget(stage.DarknessPart.CFrame)
                end

                -- // this needs to fixed because it only teleports to cavestage1 and 2 not all of them
                -- Skip chest logic if Auto Collect Gold is enabled
                if _G.autoCollectGold then
                    task.wait(0.2)
                    allStagesProcessed = false                 
                    break 
                end

                if stageNumber == 10 then
                    -- If Auto Collect Gold is NOT enabled, process chest logic
                    if not _G.autoCollectGold then
                        print("Final Stage Reached, moving to Chest...")

                        -- Move a little forward (modify the Z-axis by a small amount)
                        local currentPosition = humanoidRootPart.Position
                        local forwardPosition = currentPosition + Vector3.new(0, 0, 0.5)  -- Move forward by 0.5 units
                        humanoidRootPart.CFrame = CFrame.new(forwardPosition)  -- Update CFrame

                        task.wait(1)
                         
                        moveToTarget(endChest.CFrame, true)
                        humanoidRootPart.Anchored = true  -- Anchor to prevent any unintended movement

                        task.wait(14)  -- Wait for chest claiming duration

                        -- Mark all stages as processed after chest claim
                        allStagesProcessed = true
                        
                        print("Chest claimed, all stages processed.")

                        task.wait(1)
                        workspace:WaitForChild("ClaimRiverResultsGold"):FireServer()
                        allStagesProcessed = false  -- Reset the flag after chest claiming
                    end
                    break  -- Exit loop after processing final stage
                end
            end

            if allStagesProcessed then
                break  -- Exit loop if all stages are processed
            end
        end
    end
end


local Section = Tab:CreateSection("Auto Farm to get gold")

local Toggle = Tab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        _G.autoFarm = Value

        if _G.autoFarm then
            toggleNoclip()
            startAutoFarm()
        else
            -- Stop auto farm if toggle is turned off
            print("Stopping Auto Farm.")
            destroyBodyVel()
            humanoidRootPart.Anchored = false  -- Unanchor character when stopping
        end
    end,
})

local Section = Tab:CreateSection("Auto Collect gold in Auto Farm but you cannot go to chest.")

local Toggle = Tab:CreateToggle({
    Name = "Auto Collect Gold",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function (Value)
        _G.autoCollectGold = Value

        while _G.autoCollectGold do
            workspace:WaitForChild("ClaimRiverResultsGold"):FireServer()
            task.wait(0.2)
        end
    end
})

local Section = Tab:CreateSection("Set the speed for the Auto Farm to glide faster to the chest")

local Slider = Tab:CreateSlider({
    Name = "Set the speed to go to the chest faster (seconds)",
    Range = {0, 30},
    Increment = 0.5,
    Suffix = "Auto Farm Speed",
    CurrentValue = 0.5,
    Flag = "Slider1", -- A flag is the identifier for the configuration file
    Callback = function(Value)
        -- The slider value will control the speed
        farmSpeed = Value * 50  -- Adjust this formula to scale the speed to your liking
    end,
})

local amount = 1
local Chest = "Legendary Chest"

local Divider = Tab:CreateDivider()

local Button = Tab:CreateButton({
    Name = "Buy Best Chest (Legendary Chest)",
    Callback = function()
        workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer(Chest, amount)
    end,
})

local Slider = Tab:CreateSlider({
    Name = "Amount of chests",
    Range = {1, 1000},
    Increment = 1,
    Suffix = "set amount of chests",
    CurrentValue = 1,
    Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        amount = math.floor(Value) -- Ensure it is an integer value
    end,
})


--Restart auto farm if the player respawns
player.CharacterAdded:Connect(function()
    character = player.Character or player.CharacterAdded:Wait()
    
    -- Wait for the HumanoidRootPart to be available
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    allStagesProcessed = false  -- Reset processed stages on respawn

    while wait() do
        if _G.autoFarm == true then
            task.wait(1)
            toggleNoclip()
            startAutoFarm()
        end
        task.wait(1)
    end
end)


-- Function to format the time remaining
local function formatTime(seconds)
    local days = math.floor(seconds / 86400)
    local hours = math.floor((seconds % 86400) / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local secs = seconds % 60

    return string.format("%d days, %02d hours, %02d minutes, %02d seconds", days, hours, minutes, secs)
end

-- Create the label (initially with placeholder text)
local Label = SettingsTab:CreateLabel("Loading...", 4483362458, Color3.fromRGB(255, 255, 255), false)

-- Create or update the label based on key status
if validKey then
    local timeLeft = expirationTime - os.time()  -- Calculate time left
    local formattedTime = formatTime(timeLeft)

    -- Update the label text showing time left for the valid key
    Label:Set("Time Left: " .. formattedTime, 4483362458, Color3.fromRGB(255, 255, 255), false)
else
    warn("[KeySystem] No valid key found!")

    -- Update the label text showing that no valid key is available
    Label:Set("No valid key available", 4483362458, Color3.fromRGB(255, 255, 255), false)
end


else
    -- if the script was executed from a different game it will print to this
    print("Wrong game place teleporting to correct game place, ID: " .. ID .. " is named to: " .. GameName)

    local function generateUUID()
        local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
    
        -- Seed the random number generator
        math.randomseed(os.time() + math.random(1, 1000000))
    
        -- Function to replace "x" and "y" placeholders
        local function replaceChars(c)
            local random = math.random(0, 15) -- Random number between 0 and 15
            if c == "x" then
                return string.format("%x", random) -- Convert to hexadecimal
            elseif c == "y" then
                -- Replace bitwise operations with bit32 equivalents
                return string.format("%x", bit32.bor(bit32.band(random, 0x3), 0x8))
            else
                return c
            end
        end
    
        -- Replace "x" and "y" in the template
        return template:gsub("[xy]", replaceChars)
    end

    local ScreenGui = Instance.new("ScreenGui")
    local TextLabel = Instance.new("TextLabel")
    local Uistroke = Instance.new("UIStroke")

    --Properties:

    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Name = "{" .. generateUUID() .. "}"

    TextLabel.Parent = ScreenGui
    TextLabel.Name = "{" .. generateUUID() .. "}"
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.352886885, 0, 0.0620347373, 0)
    TextLabel.Size = UDim2.new(0.307989269, 0, 0.0516956151, 0)
    TextLabel.Font = Enum.Font.FredokaOne
    TextLabel.Text = "Teleporting to 537413528 which is Build A Boat For Treasure"
    TextLabel.TextColor3 = Color3.fromRGB(0, 68, 255)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 14
    TextLabel.TextWrapped = true

    Uistroke.Parent = TextLabel
    Uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    Uistroke.Thickness = 2
    Uistroke.Transparency = 0
    Uistroke.Color3 = Color3.fromRGB(0, 0, 0) -- white
    
    task.wait(3)

    if game.PlaceId ~= ID then
        TextLabel.Text = "Error: couldn't teleport, please join Build A Boat For Treasure. GameID: 537413528"
    end
end
