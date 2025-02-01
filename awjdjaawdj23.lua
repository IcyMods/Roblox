local id = 18408308077

if game.PlaceId == id then
    
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua'))()

-- PREMIUM OWNERS THAT BOUGHT PREMIUM 👑
local Ownership = {
    -- 👑 --
    "oxyzpz",  -- Owner of the script
    "RobloxMikey46", -- Admin
    "", -- Admin


    -- regular players
    "",
}

-- premium features: 


local player = game.Players.LocalPlayer
local isPremium = table.find(Ownership, player.Name) ~= nil

local keys = {   

    -- basic keys
    { key = "6Z2WHxpLXv4Ur5bwYhmtNG3iz", expires = 1738461600 }, -- get current date x by 2 - FEB 1ST
    { key = "Y3NFD-8NJBH-ZW2X9-N693", expires = 1739671200 }, -- get current date x by 2 - FEB 15THui

}

local premiumKey = { key = "XNFBK-8WC79-YZ9BF-RH9NY", expires = 999999999999 } -- Insanely high expiration

-- Function to get a valid key
local function getValidKey()
    local currentTime = os.time()

    if isPremium then
        return premiumKey.key, premiumKey.expires -- Give premium users the "infinite" key
    else
        -- Find the first valid basic key
        for _, data in ipairs(keys) do
            if currentTime < data.expires then
                return data.key, data.expires
            end
        end
    end

    return nil, nil -- No valid key found
end

-- Get valid key and its expiration time
local validKey, expirationTime = getValidKey(keys)

if validKey then
     print("[KeySystem] Using valid key:", validKey)
     print("[KeySystem] Current time:", os.time())
     print("[KeySystem] Expiration time:", expirationTime)
else
    warn("[KeySystem] No valid key found!")
end

local Window

if isPremium then
    -- the cool kids, Please dont out run the gun!
    Window = Library:Create({
        Name = "[⭐NEW] Ultimate Resort Tycoon 🌴☀️ | 👑 ",
        Footer = "By @avvexxyy",
        ToggleKey = Enum.KeyCode.RightShift,
        LoadedCallback = function()
            Window:TaskBarOnly(true)
        end,
    
        KeySystem = true,
        Key = validKey, -- This will call the function to validate the key
        MaxAttempts = 5,
        DiscordLink = "https://discord.gg/HVqTMP2UgX",
        ToggledRelativeYOffset = 0
    })
else
    -- IMAGING OWNING BASIC LOL, you broke fuck
    Window = Library:Create({
        Name = "[⭐NEW] Ultimate Resort Tycoon 🌴☀️ | ⭐ ",
        Footer = "By @avvexxyy",
        ToggleKey = Enum.KeyCode.RightShift,
        LoadedCallback = function()
            Window:TaskBarOnly(true)
        end,
    
        KeySystem = true,
        Key = validKey, -- This will call the function to validate the key
        MaxAttempts = 5,
        DiscordLink = "https://discord.gg/HVqTMP2UgX",
        ToggledRelativeYOffset = 0
    })
end

local MainTab = Window:Tab({
	Name = "Main",
	Icon = "rbxassetid://11396131982",
	Color = Color3.new(1, 0, 0)
})

local CreditTab = Window:Tab({
	Name = "Credits",
	Icon = "rbxassetid://13805569043",
	Color = Color3.new(1, 0, 0)
})

local Section1 = MainTab:Section({
	Name = "Features"
})

local Section2 = CreditTab:Section({
	Name = "Credits"
})

-- player stuff
local player = game.Players.LocalPlayer
local userID = player.UserId

-- leaderstats to dsiplay on menu
local Cash = player.leaderstats.Cash

local function abbreviateNumber(num)
    local abbreviations = { "K", "M", "B", "T", "Qa", "Qi", "Sx", "Sp", "Oc", "No", "Dc", "Udc", "Ddc" }
    local index = 0

    while num >= 1000 and index < #abbreviations do
        num = num / 1000
        index = index + 1
    end

    -- Ensure numbers like 6.7B don’t round up to 7B incorrectly
    local formattedNum = math.floor(num * 10) / 10  -- Keeps one decimal place without rounding up

    -- Format with one decimal place (e.g., 5.5B, 6.7B)
    return string.format("%.1f%s", formattedNum, index > 0 and abbreviations[index] or "")
end


local WelcomeMessage = Section1:Label({
	Name = "Hello, " .. player.Name .. "!",
})

local cashLabel = Section1:Label({
	Name = "Cash: " .. abbreviateNumber(Cash.Value),
})


local systemsFolder = game.Workspace:WaitForChild("Systems")
local tycoonFolder = systemsFolder:WaitForChild("Tycoon"):WaitForChild("Tycoons")

-- Debug: print out all the children in the Tycoons folder to check the structure
print("Tycoon Folder Exists: ", tycoonFolder)
print("Contents of Tycoon Folder: ", tycoonFolder:GetChildren())

-- Now, check if the Tycoon folder for the user exists by using the userID
local userTycoon = tycoonFolder:FindFirstChild(tostring(userID))  -- Convert userID to string if necessary
if userTycoon then
    print("User Tycoon Found: ", userTycoon)
    local bankCash = userTycoon:WaitForChild("Unlockables"):WaitForChild("Bank"):WaitForChild("Display"):WaitForChild("BillboardGui"):WaitForChild("Counter"):WaitForChild("Value")

    -- Ensure bankCash is a ValueBase (IntValue, FloatValue, etc.)
    if bankCash and bankCash:IsA("IntValue") then
        -- Function to abbreviate large numbers
        local function abbreviateNumber(num)
            local abbreviations = { "K", "M", "B", "T", "Qa", "Qi", "Sx", "Sp", "Oc", "No", "Dc", "Udc", "Ddc" }
            local index = 0

            while num >= 1000 and index < #abbreviations do
                num = num / 1000
                index = index + 1
            end

            return string.format("%.1f%s", num, index > 0 and abbreviations[index] or "")
        end

        -- Update the label with the abbreviated bank cash value
        local BankLabel = Section1:Label({
            Name = "Bank: " .. abbreviateNumber(bankCash.Value),
        })

        -- Connect the ValueChanged event to update the label whenever the bankCash value changes
        bankCash.Changed:Connect(function()
            BankLabel:SetName("Bank: " .. abbreviateNumber(bankCash.Value))
        end)
    else
        warn("bankCash is not a valid IntValue object.")
    end
else
    warn("Tycoon for user " .. tostring(userID) .. " not found.")
end


local CreditMessage = Section2:Label({
	Name = "credits to @Avexy for programming these features",
})

local Keybind = Section2:Keybind({
	Name = "Visibility Keybind",
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

        ToggleKey = Enum.KeyCode[tostring(Key)]

        Window:ChangeTogglekey(Key)
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
    Name = "INF Money",
    Callback = function(bool)
        _G.autoGetMoney = bool

        while _G.autoGetMoney do

            if isPremium then
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
            else              
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RE"):WaitForChild("GivePlayerRewards"):FireServer()
            end

            if isPremium then
                task.wait(0.20)
            else
                task.wait(0.50)
            end
        end
    end
})


local Toggle = Section1:Toggle({
    Name = "Auto Collect Bank Money",
    Default = false,
    Callback = function(Bool)
        _G.autoCollect = Bool

        local tycoon = game.Workspace.Systems.Tycoon.Tycoons[tostring(userID)]
        if not tycoon then return end -- Ensure tycoon exists

        local TouchPart = tycoon.Unlockables.Bank.Circle:FindFirstChild("Touch")
        local character = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

        if not TouchPart or not character then return end -- Ensure parts exist

        while _G.autoCollect do
            TouchPart.CFrame = character.CFrame + Vector3.new(0, 2, 0) -- Move slightly above touch part
            
            task.wait(1)

            -- AFK Movement (small up/down motion)
            TouchPart.CFrame = character.CFrame * CFrame.new(0, 1, 0)
            task.wait(0.05)
            TouchPart.CFrame = character.CFrame * CFrame.new(0, -1, 0)
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

local delay = false

local Toggle = Section1:Toggle({
    Name = "Free AutoPurchase Gamepass - Temporary",
    Default = false,
    Callback = function(Bool) 
        _G.AutoPurchase = Bool

        -- Delay variable (adjust the delay time as needed)
        local delayTime = 5  -- Time in seconds between each auto-purchase
        local isRunning = false  -- Flag to track if the loop is running

        -- Use a coroutine to handle the loop independently
        if Bool then
            -- Start a coroutine to prevent the loop from being interrupted by toggle changes
            coroutine.wrap(function()
                while _G.AutoPurchase do
                    if not isRunning then
                        isRunning = true
                        -- Call the server function for auto-purchase
                        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PlayerService"):WaitForChild("RF"):WaitForChild("UpdateSetting"):InvokeServer("AutoPurchase")
                        isRunning = false
                    end
                    -- Wait for the delayTime before sending the next request
                    task.wait(delayTime)
                end
            end)()
        else
            -- If toggle is off, make sure the loop stops by setting AutoPurchase to false
            _G.AutoPurchase = false
        end
    end
})

-- Create the label (initially with placeholder text)
local timeLabel = Section2:Label({
    Name = "Loading..."
})

if validKey then
    -- Start a loop to update the label every second
    while true do
        local timeLeft = expirationTime - os.time()  -- Calculate time left
        local formattedTime = formatTime(timeLeft)  -- Format the time left

        -- Update the label text showing time left for the valid key
        timeLabel:SetName("Time Left: " .. formattedTime)
        
        -- Wait 1 second before updating again
        task.wait(1)

        -- Exit the loop if the key has expired
        if timeLeft <= 0 then
            --print("[KeySystem] Key expired! Destroying UI...")
            Library:Destroy()  -- Destroy the Rayfield window
            break
        end
    end
else
    warn("[KeySystem] No valid key found!")

    -- Update the label text showing that no valid key is available
    timeLabel:SetName("No valid key available")
end

while wait() do
    cashLabel:SetName("Cash: " .. abbreviateNumber(Cash.Value))
    task.wait(0.001)
end

end
