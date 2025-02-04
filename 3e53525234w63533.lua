

-- chat
--game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("vortex on top", "All")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

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
 
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {""} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

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
                        [5] = humanoidRootPart.Position, -- Start position (Soccer Ball position)
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
            [5] = character.Position,  -- Directly use the character's position (no need for Vector3.new)
            [6] = character.Position + Vector3.new(0, 18, 0),
            [7] = character.Position
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
            ball.CFrame = character.CFrame - Vector3.new(0, 13, 0)
        else
            warn("SoccerBall not found!")
            return
        end

        task.wait(0.1) -- Slight delay for ball repositioning

        local args = {
            [1] = "Kick",
            [2] = "Trickshot",
            [3] = ball,
            [4] = 1.0, -- Adjust power if needed
            [5] = character.Position,
            [6] = targetGoal + Vector3.new(0, 0, 6), -- Slightly above the goal to make it look like a shot
            [7] = targetGoal
        }

        game:GetService("ReplicatedStorage"):WaitForChild("MasterKey"):FireServer(unpack(args))
    end,
})


local Button = Tab:CreateButton({
    Name = "Pass ball to teammates",
    Callback = function()
    -- The function that takes place when the button is pressed
    end,
})
