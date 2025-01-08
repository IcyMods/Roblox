-- Word list with SoundId and corresponding word
local wordlist = {
    ["rbxassetid://12345678"] = "Apple",
    ["rbxassetid://87654321"] = "Banana"
}

-- Variables to track the last sound played and last word displayed
local lastSound = nil
local lastword = "None"

-- Rayfield library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Spelling Bee",
    Icon = 0,
    LoadingTitle = "Made by Vortex Services - @Avexy",
    LoadingSubtitle = "by Sirius",
    Theme = "Dark Blue",
    ConfigurationSaving = {
        Enabled = true,
        FileName = "Big Hub"
    },
    KeySystem = true,
    KeySettings = {
        Title = "Key System",
        Key = {"Hello"}
    }
})

local MainTab = Window:CreateTab("Main", 4483362458) -- Title, Image

-- Create a label to display the current word
local Label = MainTab:CreateLabel("Current word: None", 4483362458, Color3.fromRGB(255, 255, 255), false)

-- Function to update the label when a sound is played
local function updateLabel(soundId)
    local word = wordlist[soundId]
    if word then
        lastSound = soundId
        lastword = word
        Label:Set("Current word: " .. word) -- Update the label text
    end
end

-- Detect when a sound is played
game.Workspace.ChildAdded:Connect(function(child)
    if child:IsA("Sound") and wordlist[child.SoundId] then
        updateLabel(child.SoundId)
    end
end)

