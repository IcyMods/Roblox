

-- chat
--game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("vortex on top", "All")


-- works | TRICKSHOT
local args = {
    [1] = "Kick",
    [2] = "Trickshot",
    [3] = workspace:WaitForChild("SoccerBall"),
    [4] = 33.32201232910156,
    [5] = Vector3.new(45.43458557128906, 82.79999542236328, 54.29861068725586),
    [6] = Vector3.new(173.35629272460938, -97.66685485839844, -404.6978454589844),
    [7] = Vector3.new(206.15670776367188, -130.66685485839844, -365.4982604980469)
}

game:GetService("ReplicatedStorage"):WaitForChild("MasterKey"):FireServer(unpack(args))


-- here

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Rayfield Example Window",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Sirius",
    Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
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


-- destroy
local Scroll = game.Players.LocalPlayer.PlayerGui.StaminaGui:FindFirstChild("Scroll")

Scroll:Destroy()

local animationTrack -- Declare this outside of the callback to keep track of the animation

Toggle = Tab:CreateToggle({
    Name = "INF Stamina",
    CurrentValue = false,
    Flag = "Toggle1", 
    Callback = function(Value)
        _G.stamina = Value
        print("INF Stamina toggled: " .. tostring(Value))
        
        -- Get Player
        local player = game.Players.LocalPlayer
        local playerGui = player.PlayerGui
        local staminaGui = playerGui:WaitForChild("StaminaGui")
        local staminaScript = staminaGui:WaitForChild("StaminaScript")
        local animation = staminaScript:WaitForChild("Animation")

        -- Set the animation ID
        animation.AnimationId = "rbxassetid://472916446"
        
        -- Get the character and humanoid
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")

        -- Load the animation into the humanoid
        if animationTrack then
            animationTrack:Stop()  -- Stop the previous animation if it's playing
        end
        
        -- Load the animation into the humanoid and play it
        animationTrack = humanoid:LoadAnimation(animation)
        
        if _G.stamina then
            print("Animation loaded successfully")
            animationTrack:Play()
        else
            print("Animation stopped")
            animationTrack:Stop()  -- Stop the animation when toggled off
        end

        -- Create or hide text label based on the toggle state
        local newTextLabel = Instance.new("TextLabel")
        newTextLabel.Parent = backScroll
        newTextLabel.BackgroundTransparency = 1
        newTextLabel.Font = Enum.Font.FredokaOne
        newTextLabel.Text = "Infinite Speed Activated!"
        newTextLabel.Size = UDim2.new(1, 0, 1, 0)
        newTextLabel.TextScaled = true
        newTextLabel.ZIndex = 10
        newTextLabel.Visible = _G.stamina  -- Show only when toggled on

        -- Speed Loop
        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            task.spawn(function()
                while _G.stamina do
                    if animationTrack.IsPlaying then
                        humanoid.WalkSpeed = 22
                    else
                        humanoid.WalkSpeed = 17
                    end
                    task.wait(0.01)
                end
                humanoid.WalkSpeed = 17  -- Reset speed when toggled off
            end)
        end
    end,
})

local infTricks = Tab:CreateToggle({
    Name = "INF Trickshot",
    CurrentValue = false,
    Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _.G.infTricks = Value

        local UserInputService = game:GetService("UserInputService")
    
        while _.G.infTricks do
            UserInputService.InputBegan:Connect(function()
                if input.UserInputType == Enum.UserInputType.Q then
                    local args = {
                        [1] = "Kick",
                        [2] = "Trickshot",
                        [3] = workspace:WaitForChild("SoccerBall"),
                        [4] = 33.32201232910156,
                        [5] = Vector3.new(45.43458557128906, 82.79999542236328, 54.29861068725586),
                        [6] = Vector3.new(173.35629272460938, -97.66685485839844, -404.6978454589844),
                        [7] = Vector3.new(206.15670776367188, -130.66685485839844, -365.4982604980469)
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("MasterKey"):FireServer(unpack(args))
                end
                task.wait(0.01)
            end)
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
        [4] = 33.32201232910156,
        [5] = Vector3.new(45.43458557128906, 82.79999542236328, 54.29861068725586),
        [6] = Vector3.new(173.35629272460938, -97.66685485839844, -404.6978454589844),
        [7] = Vector3.new(206.15670776367188, -130.66685485839844, -365.4982604980469)
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("MasterKey"):FireServer(unpack(args))
    end,
})

local Button = Tab:CreateButton({
    Name = "Fling ball (Trickshot)",
    Callback = function()

    local args = {
        [1] = "Kick",
        [2] = "Normal",
        [3] = workspace:WaitForChild("SoccerBall"),
        [4] = 33.32201232910156,
        [5] = Vector3.new(45.43458557128906, 82.79999542236328, 54.29861068725586),
        [6] = Vector3.new(173.35629272460938, -97.66685485839844, -404.6978454589844),
        [7] = Vector3.new(206.15670776367188, -130.66685485839844, -365.4982604980469)
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("MasterKey"):FireServer(unpack(args))
    end,
})

local Button = Tab:CreateButton({
    Name = "TP Ball to you",
    Callback = function()
    -- The function that takes place when the button is pressed
    end,
})

local Button = Tab:CreateButton({
    Name = "TP to Ball",
    Callback = function()
    -- The function that takes place when the button is pressed
    end,
})

local Button = Tab:CreateButton({
    Name = "Goal",
    Callback = function()
    -- The function that takes place when the button is pressed
    end,
})

local Button = Tab:CreateButton({
    Name = "Pass ball to teammates",
    Callback = function()
    -- The function that takes place when the button is pressed
    end,
})
