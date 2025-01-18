local id = 18408308077

if game.PlaceId == id then

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("[⭐NEW] Ultimate Resort Tycoon | made by vortex 🌴☀️", "BloodTheme")

-- player stuff
local player = game.Players.LocalPlayer
local userID = player.UserId

-- leaderstats to dsiplay on menu
local Cash = player.leaderstats.Cash

-- tabs
local StatsTab = Window:NewTab("Stats")
local MainTab = Window:NewTab("Main")

local Section = StatsTab:NewSection("Welcome, " .. player.Name .." here is you're leaderstats!")

-- Function to abbreviate large numbers
local function abbreviateNumber(num)
    local abbreviations = { "K", "M", "B", "T", "Qa", "Qi", "Sx", "Sp", "Oc", "No", "Dc", "Udc", "Ddc" }
    local index = 0

    while num >= 1000 and index < #abbreviations do
        num = num / 1000
        index = index + 1
    end

    return string.format("%.0f%s", num, index > 0 and abbreviations[index] or "")
end

Section:NewLabel("Cash: " .. abbreviateNumber(Cash.Value))

MainTab:NewToggle("Free AutoPurchase Gamepass", "Gives you the AutoPurchase gamepass for free - TEMPORARY", function(state)
    if state then
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RF"):WaitForChild("UpdateSetting"):InvokeServer("AutoPurchase")
    else
        print("Toggle Off")
    end
end)

MainTab:NewToggle("Teleport to buy buttons", "if AutoPurchase is not working properly then toggle this one", function(state)
    if state then
    local System = game.Workspace:WaitForChild("Systems")
    local buttonsFolder = System.Tycoon.Tycoons[userID].Buttons

    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

        -- if lazy then teleport the player to the buttons basically free auto purchase
        
            -- Teleport player to each button's PrimaryPart
        for _, button in ipairs(buttonsFolder:GetChildren()) do
            if button:IsA("Model") then
                local primaryPart = button.PrimaryPart
                if primaryPart then
                    humanoidRootPart.CFrame = primaryPart.CFrame
                    task.wait(2) -- Wait before moving to the next button
                else
                    warn("Button " .. button.Name .. " is missing a PrimaryPart!")
                end
            end
        end
    else
        print("Toggle Off")
    end
end)


MainTab:NewButton("Money Hack", "gives you a certain amount of money", function()
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
end)

-- money hack
-- while true do
--     game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
--     wait(0.0001)
-- end

end
