

-- chat
--game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("vortex on top", "All")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- when the first key is expired then replace the second key to the first row then repeat
local keys = {   
    { key = "VDB69-F3SNB-P3CDJ-CQWD4", expires = 1739800800 }, -- get current date x by 2 - FEB 8TH
    { key = "MPPRW-ZRZFW-AZY2A-E7WMD", expires = 1741010400 }, -- get current date x by 2 - FEB 22TH
}

-- Function to get a valid key
local function getValidKey(keys)
    if keys then
        local currentTime = os.time()

        -- Iterate through keys and find the first valid one
        for _, data in ipairs(keys) do
            -- If current time is less than the expiration time, the key is still valid
            if currentTime < data.expires then
                return data.key, data.expires
            end
        end
    end
    return nil, nil  -- No valid key found
end

-- Get valid key and its expiration time
local validKey, expirationTime = getValidKey(keys)

if validKey then
    -- print("[KeySystem] Using valid key:", validKey)
    -- print("[KeySystem] Current time:", os.time())
    -- print("[KeySystem] Expiration time:", expirationTime)
else
    warn("[KeySystem] No valid key found! - report this as bug")
end

local Window = Rayfield:CreateWindow({
    Name = "Kick Off",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "made by @avexy",
    LoadingSubtitle = "by @Avexy",
    Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
 
    Discord = {
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "Key System",
       Subtitle = "",
       Note = "get key in discord: ", -- Use this to tell the user how to get a key
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
            local currentTime = os.time() -- Get the current Unix time
            -- Debugging output to check if the current time and expiration time are correct
            --print("[KeySystem] Current time:", currentTime, "Expiration time:", expirationTime)

            if currentTime >= expirationTime then
                --print("[KeySystem] First key expired! Destroying UI...")
                task.wait(1)
                Rayfield:Destroy() -- Destroy the Rayfield window
                task.wait(1.5)
                game.Players.LocalPlayer:Kick("time limit reached please wait until the dev posts a updated key.")
                break
            end

            task.wait(1) -- Check every second
        end
    end)
else
    warn("[KeySystem] No valid key found or expiration time is invalid!")
end

local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

local animationTrack -- Declare this outside of the callback to keep track of the animation

local Scroll = game.Players.LocalPlayer.PlayerGui.StaminaGui:WaitForChild("Scroll")
local Holdspace = game.Players.LocalPlayer.PlayerGui.StaminaGui.BackScroll:WaitForChild("Space")
local staminaText = game.Players.LocalPlayer.PlayerGui.StaminaGui.BackScroll:WaitForChild("Stamina")

local Toggle = Tab:CreateToggle({
    Name = "INF Stamina",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(Value)
        _G.infStam = Value

        if staminaText then
            staminaText.Text = "INF Stamina Activated!"
        end
        
        -- Run the loop only when the toggle is on
        if _G.infStam then
            while _G.infStam do
                if Scroll then
                    Holdspace.Visible = false
                    Scroll.Size = UDim2.new(0.3, 0, 0.05, 0)
                end

                task.wait(0.001) -- Add a small delay to avoid freezing
            end
        else
            staminaText.Text = "Stamina"
            Scroll.Size = UDim2.new(0.3, 0, 0.05, 0) -- Set it to default when toggle is off
        end
    end,
})


local Toggle = Tab:CreateToggle({
    Name = "INF Trickshot",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(Value)
        _G.infTricks = Value

        local UserInputService = game:GetService("UserInputService")
        
        -- Only connect the InputBegan event once
        local inputConnection
        if _G.infTricks then
            inputConnection = UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Q then

                    local player = game.Players.LocalPlayer
                    local character = player.Character or player.CharacterAdded:Wait()
                    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                    local lookVector = humanoidRootPart.CFrame.LookVector -- This is the direction your character is facing
                    
                    -- Fire the soccer ball in the direction your character is looking
                    local distance = 100 -- You can set the distance or calculate it based on your preference
                    local targetPosition = humanoidRootPart.Position + (lookVector * distance) -- Position in the direction your character is looking
                    
                    local args = {
                        [1] = "Kick",
                        [2] = "Trickshot",
                        [3] = workspace:WaitForChild("SoccerBall"),
                        [4] = math.random(1, distance), -- The force or speed value
                        [5] = humanoidRootPart.CFrame, -- Start position (Soccer Ball position)
                        [6] = targetPosition, -- The target position in the direction the player is facing
                        [7] = targetPosition -- You can modify this as needed
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("MasterKey"):FireServer(unpack(args))                    
                end
            end)
        else
            -- Disconnect when toggled off
            if inputConnection then
                inputConnection:Disconnect()
            end
        end
    end,
})


local Button = Tab:CreateButton({
    Name = "Fling ball (Normal)",
    Callback = function()
        local args = {
            [1] = "Kick",
            [2] = "Normal",
            [3] = workspace:WaitForChild("SoccerBall"),
            [4] = 100.0,
            [5] = Vector3.new(math.random(1, 230), math.random(1, 230), math.random(1, 230)),
            [6] = Vector3.new(math.random(1, 230), math.random(1, 230), math.random(1, 230)),
            [7] = Vector3.new(math.random(1, 230), math.random(1, 230), math.random(1, 230))
        }

        game:GetService("ReplicatedStorage"):WaitForChild("MasterKey"):FireServer(unpack(args))
    end,
})

local Button = Tab:CreateButton({
    Name = "Fling ball (Trickshot)",
    Callback = function()
        local args = {
            [1] = "Kick",
            [2] = "Trickshot",
            [3] = workspace:WaitForChild("SoccerBall"),
            [4] = 100.0,
            [5] = Vector3.new(math.random(1, 230), math.random(1, 230), math.random(1, 230)),
            [6] = Vector3.new(math.random(1, 230), math.random(1, 230), math.random(1, 230)),
            [7] = Vector3.new(math.random(1, 230), math.random(1, 230), math.random(1, 230))
        }

        game:GetService("ReplicatedStorage"):WaitForChild("MasterKey"):FireServer(unpack(args))
    end,
})


local Button = Tab:CreateButton({
    Name = "Bring Ball to you (more legit)",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character.HumanoidRootPart
        
        local args = {
            [1] = "Kick",
            [2] = "Normal",
            [3] = workspace:WaitForChild("SoccerBall"),
            [4] = 20.0,
            [5] = character.CFrame,  -- Directly use the character's position (no need for Vector3.new)
            [6] = character.CFrame + Vector3.new(0, 18, 0),
            [7] = character.CFrame
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("MasterKey"):FireServer(unpack(args))
    end,
})

local Button = Tab:CreateButton({
    Name = "TP Ball to you",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character.HumanoidRootPart
        local ball = game.Workspace:WaitForChild("SoccerBall")

        if ball then
            ball.CFrame = character.CFrame
        end
    end,
})

local Button = Tab:CreateButton({
    Name = "TP to Ball",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character.HumanoidRootPart
        -- Set character's CFrame to soccer ball's CFrame
        character.CFrame = game.Workspace.SoccerBall.CFrame
    end,
})


local teams = {
    team1 = "Brazil",
    team2 = "USA"
}

local mapHolder = game.Workspace:WaitForChild("MapHolder")

-- Find the current active map
local currentMap
for _, map in ipairs(mapHolder:GetChildren()) do
    if map:IsA("Model") then
        currentMap = map
        break
    end
end

if not currentMap then
    warn("No map found!")
    return
end

-- Get goal positions
local goalBlue = currentMap:FindFirstChild("BlueGoal")
local goalRed = currentMap:FindFirstChild("RedGoal")

if not goalBlue or not goalRed then
    warn("Goals not found in the map!")
    return
end

local player = game.Players.LocalPlayer

local function getCharacter()
    local character = player.Character or player.CharacterAdded:Wait()
    return character and character:FindFirstChild("HumanoidRootPart")
end

local function getRandomTeammate()
    local teammates = {}

    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Team == player.Team and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(teammates, plr.Character.HumanoidRootPart)
        end
    end

    if #teammates > 0 then
        return teammates[math.random(1, #teammates)]
    else
        return nil
    end
end

local Button = Tab:CreateButton({
    Name = "Goal",
    Callback = function()
        local team = player.Team and player.Team.Name or nil
        if not team then
            warn("Player is not on a team!")
            return
        end

        local targetGoal

        if team == teams.team1 then
            -- If the player is on Brazil, aim for USA's goal (Blue Goal)
            targetGoal = goalBlue.Position
        elseif team == teams.team2 then
            -- If the player is on USA, aim for Brazil's goal (Red Goal)
            targetGoal = goalRed.Position
        else
            warn("Player is not on a valid team!")
            return
        end

        local character = getCharacter()
        if not character then
            warn("HumanoidRootPart not found!")
            return
        end

        local ball = game.Workspace:FindFirstChild("SoccerBall")

        if ball then
            ball.CFrame = character.CFrame - Vector3.new(0, 5, 0)
        else
            warn("SoccerBall not found!")
            return
        end

        task.wait(0.01) -- Slight delay for ball repositioning

        local args = {
            [1] = "Kick",
            [2] = "Trickshot",
            [3] = ball,
            [4] = 1, -- Adjust power if needed
            [5] = character.CFrame,
            [6] = targetGoal,
            [7] = targetGoal
        }

        game:GetService("ReplicatedStorage"):WaitForChild("MasterKey"):FireServer(unpack(args))
    end,
})

local Button = Tab:CreateButton({
    Name = "Pass ball to a random teammate", 
    Callback = function()
        local teammate = getRandomTeammate()

        if not teammate then
            warn("No teammates found to pass to!")
            return
        end

        local character = getCharacter()
        if not character then
            warn("HumanoidRootPart not found!")
            return
        end

        local ball = game.Workspace:FindFirstChild("SoccerBall")
        if not ball then
            warn("SoccerBall not found!")
            return
        end

        ball.CFrame = character.CFrame - Vector3.new(0, 5, 0) -- Move ball near player before passing
        task.wait(0.1) -- Delay for repositioning

        local args = {
            [1] = "Kick",
            [2] = "Normal", -- Adjust kick type if needed
            [3] = ball,
            [4] = 1, -- Adjust power if needed
            [5] = character.CFrame,
            [6] = teammate.CFrame + Vector3.new(0, 2, 0), -- Pass slightly above to avoid ground collision
            [7] = teammate.CFrame
        }

        game:GetService("ReplicatedStorage"):WaitForChild("MasterKey"):FireServer(unpack(args))
    end,
})
