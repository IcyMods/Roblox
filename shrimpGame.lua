local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Shrimp Game",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "made by vortex services | avvexyy",
    LoadingSubtitle = "by vortex",
    Theme = "Serenity ", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
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
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

local FirstGameTab = Window:CreateTab("Red Light Green Light", 4483362458) -- Title, Image

local SecondGameTab = Window:CreateTab("Sugar Honeycombs", 4483362458) -- Title, Image

local ThirdGameTab = Window:CreateTab("Lights Out", 4483362458) -- Title, Image

local ForthGameTab = Window:CreateTab("Tug of War", 4483362458) -- Title, Image

local FifthGameTab = Window:CreateTab("Stepping Stones", 4483362458) -- Title, Image

local SixthGameTab = Window:CreateTab("Squid Game", 4483362458) -- Title, Image

local SeventhGameTab = Window:CreateTab("Mingle", 4483362458) -- Title, Image

local Button = FirstGameTab:CreateButton({
    Name = "TP to end",
    Callback = function()
    local endPart = game.Workspace
    local character = game.Players.LocalPlayer.Character

    character.CFrame = endPart.CFrame
    end,
 })

 local Slider = Tab:CreateSlider({
    Name = "Set Walkspeed",
    Range = {14, 250},
    Increment = 1,
    Suffix = "ws",
    CurrentValue = 14,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    -- The function that takes place when the slider changes
    -- The variable (Value) is a number which correlates to the value the slider is currently at
    end,
 })
