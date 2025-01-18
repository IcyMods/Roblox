local id = 18408308077

if game.PlaceId == id then

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("[⭐NEW] Ultimate Resort Tycoon | made by vortex 🌴☀️", "BloodTheme")


local player = game.Players.LocalPlayer
local userID = player.UserId

-- leaderstats to dsiplay on menu
local Cash = player.leaderstats.Cash
local StatsTab = Window:NewTab("Stats")

local Section = StatsTab:NewSection("You're leaderstats")

Section:NewLabel("Cash: " .. Cash.Value)

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


-- free auto purchase gamepass
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RF"):WaitForChild("UpdateSetting"):InvokeServer("AutoPurchase")


-- money hack
-- while true do
--     game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
--     wait(0.0001)
-- end


end
