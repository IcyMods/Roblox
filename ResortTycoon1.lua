local id = 18408308077

if game.PlaceId == id then
    
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua'))()

Window = Library:Create({
	Name = "[⭐NEW] Ultimate Resort Tycoon | made by vortex 🌴☀️",
	Footer = "By @avvexxyy",
	ToggleKey = Enum.KeyCode.RightShift,
	LoadedCallback = function()
		Window:TaskBarOnly(true)
	end,

	KeySystem = true,
	Key = "6Z2WHxpLXv4Ur5bwYhmtNG3iz",
	MaxAttempts = 5,
	DiscordLink = "https://discord.gg/HVqTMP2UgX",
	ToggledRelativeYOffset = 0
})

local MainTab = Window:Tab({
	Name = "Main",
	Icon = "rbxassetid://11396131982",
	Color = Color3.new(1, 0, 0)
})

local CreditTab = Window:Tab({
	Name = "Credits",
	Icon = "rbxassetid://11396131982",
	Color = Color3.new(1, 0, 0)
})

local Section1 = MainTab:Section({
	Name = "Features"
})

local Section2 = CreditTab:Section({
	Name = "Credits Tab"
})

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

local Label = Section1:Label({
	Name = "Hello, " .. player.Name .. "!",
})

local Label = Section1:Label({
	Name = "Cash: " .. abbreviateNumber(Cash.Value),
})

local Label = Section2:Label({
	Name = "@Avexy for programming",
})

local Keybind = Section2:Keybind({
	Name = "Keybind",
	Default = Enum.KeyCode.RightShift,
	Callback = function()
		Library:Notify({
			Name = "Keybind pressed",
			Text = "",
			Icon = "rbxassetid://11401835376",
			Duration = 3,
		})
	end,
	UpdateKeyCallback = function(Key)
		Library:Notify({
			Name = "Keybind updated",
			Text = tostring(Key),
			Icon = "rbxassetid://11401835376",
			Duration = 3,
		})
	end
})


local Button = Section2:Button({
	Name = "Copy discord link",
	Callback = function()

        Library:Notify({
			Name = "discord link copied!",
			Text = Text,
			Icon = "rbxassetid://18810599545",
			Duration = 3,
		})

        setclipboard("discord.gg/HVqTMP2UgX")
	end
})

local Toggle = Section1:Toggle({
	Name = "Money Hack",
	Callback = function(Bool)
        _G.autoGetMoney = Bool

        while _G.autoGetMoney do
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
            task.wait(0.001)
        end
	end
})

-- Auto Teleport
local Toggle = Section1:Toggle({
    Name = "Teleport to buy buttons",
    Default = false,
    Callback = function(Bool)
        _G.AutoTeleport = Bool

        while _G.AutoTeleport do
            local System = game.Workspace:WaitForChild("Systems")
            local tycoons = System.Tycoon.Tycoons
            local tycoon = tycoons[tostring(userID)] -- Convert userID to string
            
            if tycoon then
                local buttonsFolder = tycoon:FindFirstChild("Buttons")
                if buttonsFolder then
                    local character = player.Character or player.CharacterAdded:Wait()
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    
                    if humanoidRootPart then
                        for _, button in ipairs(buttonsFolder:GetChildren()) do
                            if button:IsA("Model") and button.PrimaryPart then
                                humanoidRootPart.CFrame = button.PrimaryPart.CFrame
                                task.wait(2)
                            end
                        end
                    end
                end
            else
                warn("Tycoon not found for user ID: " .. userID)
            end

            task.wait(1)
        end
    end
})

local Toggle = Section1:Toggle({
	Name = "Free AutoPurchase gamepass - Temporary",
	Default = false,
	Callback = function(Bool) 
        _G.AutoPurchase = Bool

        while _G.AutoPurchase do    
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RF"):WaitForChild("UpdateSetting"):InvokeServer("AutoPurchase")
            task.wait(1)
        end
	end
})



end
