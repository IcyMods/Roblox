local id = 18408308077

if game.PlaceId == id then
    
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/NiceBBMBThai12/NBTScript/main/Gui%20Th%20Edit%20free%2001"))()

local MainWindow =
    Material.Load(
    {
        Title = "[⭐NEW] Ultimate Resort Tycoon | made by vortex 🌴☀️",
        Style = 1,
        SizeX = 400,
        SizeY = 185,
        Theme = "Dark"
    }
)

local Main =
    MainWindow.New(
    {
        Title = "Main"
    }
)

local Credit =
    MainWindow.New(
    {
        Title = "Credit"
    }
)

-- player stuff
local player = game.Players.LocalPlayer
local userID = player.UserId

-- leaderstats to dsiplay on menu
local Cash = player.leaderstats.Cash


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


local text = Main.Text(
    {
        Text = "Cash: " .. abbreviateNumber(Cash.Value)
    }
)

local MoneyHack =
    Credit.Button(
    {
        Text = "Money HackE",
        Callback = function(Value)
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()   
        --setclipboard("https://discord.gg/4KqkXRDdGE")
        end,
        Enabled = false
    }
)

local Teleportation =
    Main.Toggle(
    {
        Text = "Teleport to buy buttons",
        Callback = function(Value)
            _G.AutoTeleport = Value

            while _G.AutoTeleport do

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
                end
            end
            task.wait(1)
        end,
        Enabled = false
    }
)

local Teleportation =
    Main.Toggle(
    {
        Text = "Free AutoPurchase Gamepass - TEMPORARY",
        Callback = function(Value)
            _G.AutoPurchase = Value

            while _G.AutoPurchase do    
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RF"):WaitForChild("UpdateSetting"):InvokeServer("AutoPurchase")
                task.wait(0.8)
            end
        end,
        Enabled = false
    }
)

-- money hack
-- while true do
--     game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
--     wait(0.0001)
-- end

end
