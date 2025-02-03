
local UILib = loadstring(game:HttpGet('https://raw.githubusercontent.com/inceldom/kinx/main/ui'))()

local win = UILib:Window("NBT HUB",Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

-- Sections

-- Main

local MainSection = win:Tab("Main")

-- chat
game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("vortex on top", "All")


-- args
function getNil(name,class) for _,v in next, getnilinstances() do if v.ClassName==class and v.Name==name then return v;end end end


-- works | NORMAL KICK
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

local Toggle = Tab:CreateToggle({
    Name = "INF Stamina",
    CurrentValue = false,
    Flag = "Toggle1", 
    Callback = function(Value)
        _G.stamina = Value
        print("INF Stamina toggled: " .. tostring(Value)) -- Debugging toggle state

        local backScroll = game.Players.LocalPlayer.PlayerGui.StaminaGui.BackScroll

        -- destroy
        local Scroll = game.Players.LocalPlayer.PlayerGui.StaminaGui.Scroll

        -- set the background for backscroll
        backScroll.BackgroundColor3 = Color3.fromRGB(1, 198, 239)

        Scroll:Destroy()

        -- Ensure backScroll is defined
        if not backScroll then
            print("backScroll not defined!")
            return
        end

        -- Create Text Label
        local newTextLabel = Instance.new("TextLabel")
        newTextLabel.Parent = backScroll
        newTextLabel.BackgroundTransparency = 1
        newTextLabel.Font = Enum.Font.FredokaOne
        newTextLabel.Text = "Infinite Speed Activated!"
        newTextLabel.Size = UDim2.new(1, 0, 1, 0)
        newTextLabel.TextScaled = true
        newTextLabel.ZIndex = 10

        -- Check if the stamina toggle is on, then show the label
        if _G.stamina then
            newTextLabel.Visible = true
            print("Text label shown") -- Debugging if the text label is shown
        else
            newTextLabel.Visible = false
            print("Text label hidden") -- Debugging if the text label is hidden
        end

        -- Get Player
        local player = game.Players.LocalPlayer
        local playerGui = player.PlayerGui
        local staminaGui = playerGui:WaitForChild("StaminaGui")
        local staminaScript = staminaGui:WaitForChild("StaminaScript")
        local animation = staminaScript:WaitForChild("Animation")

        -- Set the animation ID (if needed)
        animation.AnimationId = "rbxassetid://472916446"

        -- Ensure the character and humanoid exist
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        
        -- Debugging animation retrieval
        print("Animation retrieved: " .. tostring(animation))
        
        if animation and humanoid then
            -- Load and play the animation
            local animationTrack = humanoid:LoadAnimation(animation)
            print("Animation loaded successfully")

            -- Start playing the animation when the toggle is on
            if _G.stamina then
                if not animationTrack.IsPlaying then
                    animationTrack:Play()
                    print("Animation played successfully")
                else
                    print("Animation is already playing")
                end
            else
                if animationTrack.IsPlaying then
                    animationTrack:Stop() -- Stop the animation if the toggle is off
                    print("Animation stopped")
                end
            end

            -- Start Speed Loop based on toggle state
            task.spawn(function()
                print("Speed loop started") -- Debugging when the speed loop begins
                while _G.stamina do
                    -- Adjust speed based on the toggle
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 22
                    task.wait(0.01)
                end
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 17 -- Reset WalkSpeed when toggle is off
                print("Speed loop ended, WalkSpeed reset to 17") -- Debugging when speed loop ends
            end)
        else
            print("Animation or Humanoid not found") -- Debugging if animation or humanoid isn't found
        end
    end,
})
