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

local Toggle = Tab:CreateToggle({
    Name = "INF Stamina",
    CurrentValue = false,
    Flag = "Toggle1", 
    Callback = function(Value)
        _G.stamina = Value
        print("INF Stamina toggled: " .. tostring(Value)) -- Debugging the toggle state

        -- Create Text Label
        local newTextLabel = Instance.new("TextLabel")
        newTextLabel.Parent = backScroll
        newTextLabel.BackgroundTransparency = 1
        newTextLabel.Font = Enum.Font.FredokaOne
        newTextLabel.Text = "Infinite Speed Activated!"
        newTextLabel.Size = UDim2.new(1, 0, 1, 0)
        newTextLabel.TextScaled = true
        newTextLabel.ZIndex = 10
        newTextLabel.Visible = _G.stamina -- Show only when toggled on
    
        -- Get Player
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")

        -- Ensure Humanoid Exists
        if humanoid then
            -- Get animation from PlayerGui
            local animation = player.PlayerGui:WaitForChild("StaminaGui"):WaitForChild("StaminaScript"):WaitForChild("Animation")
            print("Animation retrieved: " .. tostring(animation)) -- Debugging the animation object

            -- Ensure animation is valid
            if animation and animation:IsA("AnimationTrack") then
                -- Function to listen for animation playing
                local function onAnimationPlay()
                    print("Animation is now playing") -- Debugging when animation starts
                    humanoid.WalkSpeed = 22
                end

                local function onAnimationStop()
                    print("Animation stopped") -- Debugging when animation stops
                    humanoid.WalkSpeed = 17
                end

                -- Listen for animation state changes
                animation.Played:Connect(onAnimationPlay)
                animation.Stopped:Connect(onAnimationStop)

                -- Start Speed Loop
                task.spawn(function()
                    print("Speed loop started") -- Debugging when the speed loop begins
                    while _G.stamina do
                        -- Check if animation is playing
                        if animation.IsPlaying then
                            print("Animation is playing: Setting WalkSpeed to 22") -- Debugging when animation is playing
                            humanoid.WalkSpeed = 22
                        else
                            print("Animation is not playing: Setting WalkSpeed to 17") -- Debugging when animation is not playing
                            humanoid.WalkSpeed = 17
                        end
                        task.wait(0.01)
                    end
                    humanoid.WalkSpeed = 17 -- Reset on toggle off
                    print("Speed loop ended, WalkSpeed reset to 17") -- Debugging when speed loop ends
                end)
            else
                print("Animation is not valid or not an AnimationTrack") -- Debugging invalid animation
            end
        else
            print("Humanoid not found") -- Debugging when humanoid isn't found
        end
    end,
})
