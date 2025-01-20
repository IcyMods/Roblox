id = 6677985923

if game.PlaceId == id then

local library = loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/0x"))()

-- PREMIUM OWNERS THAT BOUGHT PREMIUM 👑
local Ownership = {
    -- 👑 --
    "oxyzpz",
    "RobloxMikey46",
}

-- The list of players who are considered premium (can be based on usernames or other criteria)

local player = game.Players.LocalPlayer
local isPremium = table.find(Ownership, player.Name) ~= nil

local w1

if isPremium then
    w1 = library:Window("💸Millionare Empire Tycoon | Premium") -- Text 
else
    w1 = library:Window("💸Millionare Empire Tycoon | Non-Premium") -- Text 
end

-- Check if w1 was successfully created
if not w1 then
    warn("Failed to create window: w1 is nil")
    return
end

print("Window created successfully:", w1)

-- INF Money Toggle
w1:Toggle(
    "INF Money",
    "frz",
    false,
    function(toggled)
        _G.moneyhack = toggled
        
        while _G.moneyhack do
            -- Check if the player is premium or not
            local amountToGive
            if isPremium then
                amountToGive = 10000000000000000
            else
                amountToGive = 100000000000000  -- Non-premium user gets 100T
            end

            -- Fire the server with the appropriate amount of money
            game:GetService("ReplicatedStorage"):WaitForChild("fewjnfejwb3"):FireServer(amountToGive)

            if isPremium then
                task.wait(0.0001)
            else
                task.wait(0.35)
            end
        end
    end
)

w1:Toggle(
    "Buy all buttons",
    "buttons",
    false,
    function(toggled)      
        _G.buybuttons = toggled
        print("Toggle activated. Buy buttons:", _G.buybuttons)

        local player = game.Players.LocalPlayer
        local character = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        local reference = player:FindFirstChild("TycoonReference") and player.TycoonReference.Value

        if not reference then
            warn("[ERROR] Player has no TycoonReference set!")
            return
        end

        local tycoonName = reference.Name -- Gets "Tycoon 1", "Tycoon 2", etc.
        local tycoon = game.Workspace.Tycoons:FindFirstChild(tycoonName)

        if not tycoon then
            warn("[ERROR] Tycoon not found in workspace!")
            return
        end

        local buttons = tycoon:FindFirstChild("ButtonsFolder")
        local purchases = tycoon:FindFirstChild("PurchasesFolder") and tycoon.PurchasesFolder:FindFirstChild("Rebirth6")

        if #buttons:GetChildren() == 0 then
            -- Ensure PlayerGui is valid
            local gui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
            
            -- Create a new ScreenGui
            local screenGui = Instance.new("ScreenGui", gui)
        
            -- Create a new TextLabel
            local textlabel = Instance.new("TextLabel", screenGui)
            textlabel.BackgroundTransparency = 1
            textlabel.Position = UDim2.new(0.530, 0, 0.800, 0)  -- Position on screen
            textlabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
            textlabel.Text = "You can now rebirth! Re-enable (Buy all buttons) to get a rebirth pop"
            textlabel.TextSize = 24  -- Size of the text
            textlabel.Font = Enum.Font.FredokaOne  -- Set the font to FredokaOne
            
            -- Create UIStroke for the TextLabel
            local uiStroke = Instance.new("UIStroke", textlabel)
            uiStroke.Thickness = 3  -- Set stroke thickness
            uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual  -- Contextual stroke (with bevel effect)
            uiStroke.Color = Color3.fromRGB(0, 0, 0)  -- Black stroke color
            
            -- Wait for 5 seconds before destroying the TextLabel
            task.wait(5)
            textlabel:Destroy()
        end
            

        if not buttons then
            warn("[ERROR] Buttons folder is missing in:", tycoonName)
            return
        end
        
        if not character then
            warn("[ERROR] Player's HumanoidRootPart is missing!")
            return
        end

        -- print("Found ButtonsFolder:", buttons, "for", tycoonName)
        -- print("Found Player's Character Root:", character)

        -- List of buttons to ignore
        local ignoreList = {
            ["💸 Insane Upgrader - Super fast cash!"] = true,
            ["Millionaire Maker - $1M/SECOND!"] = true,
            ["Super OP Gear [Destroy Enemies]"] = true,
            ["😲 TIP BANKER - HUGE CASH!"] = true,
            ["Double Floors Income [INSANE VALUE]"] = true,
            ["⚡Boost Workers! [Fast Cash]"] = true,
            ["Upgrade Bitcoin Miner [X5 Cash]"] = true,
            ["Golden Server [BOOSTS ALL MINERS]"] = true,
            ["Golden DOGE [TRIPLES ALL DOGE MINERS]"] = true,
            ["Double Doge Income"] = true, -- Removed extra space
            ["Golden Crystal (INSANE WORKERS BOOST)"] = true,
            ["Tip Godly Banker (DOUBLES DROPPERS)"] = true,
            ["X2 Upgrader"] = true,
            [""] = true, -- Ignore empty-named parts
            [" "] = true -- Ignore parts with just a space
        }

        -- Function to clean button names
        local function cleanName(name)
            return string.gsub(name, "^%s*(.-)%s*$", "%1") -- Trim spaces
        end

        -- Continuously check the ButtonsFolder while the toggle is active
        task.spawn(function()
            while _G.buybuttons do
                if not buttons then
                    warn("[ERROR] ButtonsFolder is missing!")
                    return
                end

                -- If folder is empty, teleport instantly without waiting
                if #buttons:GetChildren() == 0 then
                    if purchases then
                        
                        purchases.CFrame = character.CFrame
                    else
                      
                    end
                else
                    -- Loop through buttons and teleport parts
                    for _, button in ipairs(buttons:GetChildren()) do
                        local cleanedName = cleanName(button.Name) -- Trim spaces
                        
                        if ignoreList[cleanedName] then
                            --print("Ignoring and destroying:", cleanedName)
                            button:Destroy()
                        else
                            -- Move all parts inside the model
                            for _, part in ipairs(button:GetChildren()) do
                                if part:IsA("BasePart") then

                                    part.Transparency = 1
                                    part.Head.BillboardGui.Enabled = false -- new

                                    part.CFrame = character.CFrame
                                end
                            end
                        end
                    end
                end

                if isPremium then
                    task.wait(0.001)
                else
                    task.wait(0.5)
                end
               
            end
        end)
    end
)

w1:Toggle(
    "Auto Collect Money",
    "",
    false,
    function(toggled)
        _G.autoCollect = toggled
        print("AutoCollect toggled:", _G.autoCollect)

        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        --print("Character and HumanoidRootPart found")

        local reference = player:FindFirstChild("TycoonReference")
        if not reference or not reference.Value then
            warn("TycoonReference not found!")
            return
        end
        -- print("TycoonReference found:", reference.Value.Name)

        local tycoon = game.Workspace.Tycoons:FindFirstChild(reference.Value.Name)
        if not tycoon then
            warn("Tycoon not found!")
            return
        end

        -- print("Tycoon found:", tycoon.Name)

        local giver = tycoon:FindFirstChild("StarterParts") and tycoon.StarterParts.Collector.Givers:FindFirstChild("Giver")
        if not giver then
            warn("Giver not found!")
            return
        end

        giver.Transparency = 1
        giver.CanCollide = false
        
        -- print("Giver found:", giver.Name)

        -- Auto collect loop
        task.spawn(function()
            while _G.autoCollect do
                giver.CFrame = humanoidRootPart.CFrame

                if isPremium then
                    task.wait(0.001)
                else
                    task.wait(0.4)
                end
            end
            -- print("Auto collect stopped.")
        end)
    end
)


w1:Toggle(
    "Disable Button Collisions",
    "frz",
    false,
    function(toggled)
        _G.noclip = toggled
        -- print("NoClip:", _G.noclip)

        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local reference = player:FindFirstChild("TycoonReference") and player.TycoonReference.Value
        
        if not reference then
            warn("[ERROR] Player has no TycoonReference set!")
            return
        end
        
        local tycoonName = reference.Name -- Gets "Tycoon 1", "Tycoon 2", etc.
        local tycoon = game.Workspace.Tycoons:FindFirstChild(tycoonName)
        
        if not tycoon then
            warn("[ERROR] Tycoon not found in workspace!")
            return
        end
        
        -- Check if ButtonsFolder exists, create it if it doesn't
        local buttonsFolder = tycoon:FindFirstChild("ButtonsFolder")
        if not buttonsFolder then
            warn("[ERROR] ButtonsFolder not found! Creating ButtonsFolder...")
            buttonsFolder = Instance.new("Folder")
            buttonsFolder.Name = "ButtonsFolder"
            buttonsFolder.Parent = tycoon
        end

        -- Function to update collision state for both buttons and character parts
        local function updateCollisions(state)
            for _, button in ipairs(buttonsFolder:GetChildren()) do
                if button:IsA("Model") then
                    -- If it's a model, check for PrimaryPart and update all parts inside
                    if button.PrimaryPart then
                        button.PrimaryPart.CanCollide = state
                    end
                    for _, part in ipairs(button:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = state
                        end
                    end
                elseif button:IsA("BasePart") then
                    -- If it's a direct BasePart, update it
                    button.CanCollide = state
                end
            end

            -- Update character parts to disable/enable collision
            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = state
                    end
                end
            end

            -- print("Collision set to:", state)
        end

        -- Infinite yield loop for NoClip mode
        task.spawn(function()
            while _G.noclip do
                updateCollisions(false) -- Disable collisions for all parts
                task.wait(0.1) -- Adjust the frequency of collision updates if needed
            end
            updateCollisions(true) -- Re-enable collisions when toggled off
        end)
    end
)

if isPremium then
    w1:Toggle(
        "Kill Players",
        "kill",
        false,
        function(toggled)
            local player = game.Players.LocalPlayer
            local character = player.Character
            local humanoid = character:FindFirstChild("Humanoid")
            local hrp = character:FindFirstChild("HumanoidRootPart")
            local glideDistance = 3  -- Distance behind target
            local glideHeight = 5  -- Y Offset for smoother positioning
            local glideSpeed = 8200  -- 🔥 SUPER FAST speed

            local targetPlayer = nil
            local targetHRP = nil
            local glideRunning = false
            local originalPosition = hrp.Position  -- Store original position
            local originalCFrame = hrp.CFrame  -- Store original CFrame
            local velocityBody = nil  -- For smooth movement

            -- Function to reset player position when toggled off
            local function resetPlayer()
                glideRunning = false
                if velocityBody then
                    velocityBody:Destroy()
                    velocityBody = nil
                end
                -- Reset to original position and rotation
                hrp.CFrame = originalCFrame
            end

            -- Function to update movement
            local function updateMovement()
                if not hrp then return end

                -- Create BodyVelocity if not already created
                if not velocityBody then
                    velocityBody = Instance.new("BodyVelocity")
                    velocityBody.MaxForce = Vector3.new(100000, 100000, 100000) -- Allow smooth movement
                    velocityBody.Parent = hrp
                end

                while glideRunning and targetPlayer and targetHRP and toggled do
                    -- Stop if target is dead or missing
                    if not targetHRP.Parent or not targetHRP.Parent:FindFirstChild("Humanoid") then
                        resetPlayer()
                        break
                    end

                    -- Get target position and movement
                    local targetPosition = targetHRP.Position
                    local targetLookVector = targetHRP.CFrame.LookVector

                    -- Calculate instant snap position behind target
                    local behindPosition = targetPosition - targetLookVector * glideDistance
                    behindPosition = Vector3.new(behindPosition.X, behindPosition.Y + glideHeight, behindPosition.Z)

                    -- Instantly teleport behind the target at sonic speed
                    hrp.CFrame = CFrame.new(behindPosition, targetPosition)

                    task.wait(0.01) -- Ultra-fast updates
                end

                resetPlayer()
            end

            -- Start following a random player
            local function followRandomPlayer()
                local players = {}
                for _, p in ipairs(game.Players:GetPlayers()) do
                    if p ~= player then
                        table.insert(players, p)
                    end
                end

                -- Pick a random player
                if #players > 0 then
                    targetPlayer = players[math.random(1, #players)]
                    if targetPlayer and targetPlayer.Character then
                        targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if targetHRP then
                            glideRunning = true
                            updateMovement()
                        end
                    end
                end
            end

            -- Toggle on: Start following
            if toggled then
                followRandomPlayer()
            else
                resetPlayer()  -- ✅ Ensures turning it off works properly
            end
        end
    )
else
    -- Non-premium users do nothing
end

local function generateUUID()
    local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
    local function replaceChars(c)
        local random = math.random(0, 15)
        if c == "x" then
            return string.format("%x", random)
        elseif c == "y" then
            return string.format("%x", random & 0x3 | 0x8)  -- RFC4122 version 4
        end
    end
    return template:gsub("[xy]", replaceChars)
end


if isPremium then
    w1:Button("Get Best Sword", function()
        local grey = Color3.fromRGB(102, 102, 102)
        local darkgrey = Color3.fromRGB(72, 72, 72)

        local darkRed = Color3.fromRGB(102, 0, 2)
        local reallyDarkRed = Color3.fromRGB(0, 0, 0)

        local colorSequence = ColorSequence.new{
            ColorSequenceKeypoint.new(0, grey),
            ColorSequenceKeypoint.new(1, darkgrey)
        }

        local buttonColor = ColorSequence.new{
            ColorSequenceKeypoint.new(0, darkRed),
            ColorSequenceKeypoint.new(1, reallyDarkRed)
        }

        local gui = game.CoreGui
        local screenGui = Instance.new("ScreenGui", gui)
        screenGui.Enabled = true
        screenGui.Name = generateUUID()

        local frame = Instance.new("Frame", screenGui)
        frame.AnchorPoint = Vector2.new(0.5, 0.5)
        frame.Size = UDim2.new(0, 271, 0, 168)
        frame.Position = UDim2.new(0.278, 0, 0.782, 0)
        frame.Visible = true
        frame.BorderSizePixel = 0
        frame.Name = "SwordFrame"

        local uicorner = Instance.new("UICorner", frame)
        uicorner.CornerRadius = UDim.new(0, 4)

        local uigradient = Instance.new("UIGradient", frame)
        uigradient.Color = colorSequence
        uigradient.Rotation = 60

        local scrollingFrame = Instance.new("ScrollingFrame", frame)
        scrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        scrollingFrame.Size = UDim2.new(0, 269, 0, 111)
        scrollingFrame.Position = UDim2.new(0.496, 0, 0.668, 0)
        scrollingFrame.BackgroundTransparency = 1
        scrollingFrame.Visible = true
        scrollingFrame.ClipsDescendants = true
        scrollingFrame.ScrollingEnabled = true
        scrollingFrame.ScrollBarThickness = 7
        scrollingFrame.BorderSizePixel = 0

        local uilistlayout = Instance.new("UIListLayout", scrollingFrame)
        uilistlayout.Padding = UDim.new(0, 5)
        uilistlayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        uilistlayout.VerticalAlignment = Enum.VerticalAlignment.Top
        uilistlayout.SortOrder = Enum.SortOrder.LayoutOrder

        local swordNames = {"Spartan sword", "Spider sword"}

        for _, swordName in ipairs(swordNames) do
            local button = Instance.new("TextButton")
            button.Parent = scrollingFrame
            button.Visible = true
            button.AnchorPoint = Vector2.new(0.5, 0.5)
            button.Font = Enum.Font.FredokaOne
            button.TextScaled = true
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Size = UDim2.new(0, 261, 0, 28)
            button.Name = swordName
            button.Visible = false
            button.Text = ""
            button.BorderSizePixel = 0

            local TextLabel = Instance.new("TextLabel")
            TextLabel.Parent = button
            TextLabel.BackgroundTransparency = 1
            TextLabel.Size = UDim2.new(1, 0, 1, 0)
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.TextScaled = true
            TextLabel.Text = swordName
            TextLabel.Font = Enum.Font.FredokaOne

            local buttonGradient = Instance.new("UIGradient", button)
            buttonGradient.Color = buttonColor
            buttonGradient.Rotation = 60

            button.MouseButton1Click:Connect(function()
                local player = game.Players.LocalPlayer
                local character = player.Character
                local rootPart = character and character:FindFirstChild("HumanoidRootPart")
            
                if not rootPart then
                    warn("[ERROR] HumanoidRootPart not found!")
                    return
                end
            
                local reference = player:FindFirstChild("TycoonReference") and player.TycoonReference.Value
                if not reference then
                    warn("[ERROR] Player has no TycoonReference set!")
                    return
                end
            
                local tycoonName = reference.Name
                local tycoon = game.Workspace.Tycoons:FindFirstChild(tycoonName)
            
                if not tycoon then
                    warn("[ERROR] Tycoon not found in workspace!")
                    return
                end
            
                local purchasesFolder = tycoon:FindFirstChild("PurchasesFolder")
                if not purchasesFolder then
                    warn("[ERROR] PurchasesFolder not found in tycoon!")
                    return
                end

            
                if button.Name == swordNames[1] then
                    local Giver4 = purchasesFolder:FindFirstChild("Giver4")
                    local LastPositionGiver4 = Vector3.new(-132.233642578125, 22.850358963012695, 128.23822021484375)

                    if Giver4 and Giver4:FindFirstChild("Hit") then
                        Giver4.Hit.CFrame = rootPart.CFrame
                        Giver4.Hit.Transparency = 1
                        task.wait(1)
                        Giver4.Hit.Transparency = 0.7
                        Giver4.Hit.CFrame = Giver4.Hit.CFrame * CFrame.Angles(0, 0, math.rad(90))
                        Giver4.Hit.CFrame = CFrame.new(LastPositionGiver4)
                    else
                        warn("[ERROR] Giver4 or Hit part not found!")
                    end
            
                elseif button.Name == swordNames[2] then
                    local Giver5 = purchasesFolder:FindFirstChild("Giver5")
                    local LastPositionGiver5 = Vector3.new(-132.44277954101562, 22.873027801513672, 136.40228271484375)

                    if Giver5 and Giver5:FindFirstChild("Hit") then
                        Giver5.Hit.CFrame = rootPart.CFrame
                        Giver5.Hit.Transparency = 1
                        task.wait(1)
                        Giver5.Hit.Transparency = 0.7
                        Giver5.Hit.CFrame = Giver5.Hit.CFrame * CFrame.Angles(0, 0, math.rad(90))
                        Giver5.Hit.CFrame = CFrame.new(LastPositionGiver5)
                    else
                        warn("[ERROR] Giver5 or Hit part not found!")
                    end
                end
            end)            
        end

        local dropdownButton = Instance.new("TextButton", frame)
        dropdownButton.AnchorPoint = Vector2.new(0.5, 0.5)
        dropdownButton.AutoButtonColor = true
        dropdownButton.BackgroundTransparency = 0
        dropdownButton.TextScaled = true
        dropdownButton.Text = "Dropdown - Get Best Sword"
        dropdownButton.Size = UDim2.new(0, 269, 0, 28)
        dropdownButton.Position = UDim2.new(0.496, 0, 0.253, 0)
        dropdownButton.Font = Enum.Font.FredokaOne
        dropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        dropdownButton.BorderSizePixel = 0

        dropdownButton.MouseButton1Click:Connect(function()
            for _, button in ipairs(scrollingFrame:GetChildren()) do
                if button:IsA("TextButton") then
                    button.Visible = not button.Visible
                end
            end
        end)

        local dropdownGradient = Instance.new("UIGradient", dropdownButton)
        dropdownGradient.Color = colorSequence
        dropdownGradient.Rotation = 60

        local currentSword = player.Character and player.Character:FindFirstChildWhichIsA("Tool")

        local TextLabel = Instance.new("TextLabel", frame)
        TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Size = UDim2.new(0, 271, 0, 21)
        TextLabel.Position = UDim2.new(0.498, 0, 0.102, 0)
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextScaled = true
        TextLabel.Text = "Current Sword: " .. currentSword.Name
        TextLabel.Font = Enum.Font.FredokaOne

        -- Function to update the sword text
        local function updateSwordText()
            -- Check if there's a current sword
            if currentSword then
                TextLabel.Text = "Current Sword: " .. currentSword.Name
            else
                TextLabel.Text = "Current Sword: None"
            end
        end

                -- Listen for when the character's tool changes
        player.CharacterAdded:Connect(function(character)
            character:WaitForChild("Humanoid") -- Wait until the humanoid is available
            currentSword = character:FindFirstChildWhichIsA("Tool")  -- Get the new tool
            updateSwordText()  -- Update text when the sword changes
        end)

        -- Listen for when the sword changes during gameplay
        player.Character.Humanoid:GetPropertyChangedSignal("EquippedTool"):Connect(function()
            currentSword = player.Character:FindFirstChildWhichIsA("Tool")
            updateSwordText()  -- Update the text when the sword is equipped or unequipped
        end)

        updateSwordText()
        
        -- Make frame draggable
        local dragging = false
        local dragStart = nil
        local startPos = nil

        frame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                dragStart = input.Position
                startPos = frame.Position
            end
        end)

        frame.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local delta = input.Position - dragStart
                frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)

        frame.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)

        -- Keybind to toggle UI (Press "G" to Show/Hide)
        local UserInputService = game:GetService("UserInputService")

        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if not gameProcessed and input.KeyCode == Enum.KeyCode.G then
                frame.Visible = not frame.Visible
            end
        end)
    end)
end

w1:Button(
    "Disable UI offer popups",
    function()
        game.Players.LocalPlayer.PlayerGui.Screen.Floor12Offer:Destroy()
        game.Players.LocalPlayer.PlayerGui.Screen.Floor3Offer:Destroy()
        game.Players.LocalPlayer.PlayerGui.Screen.Floor6Offer:Destroy()
        game.Players.LocalPlayer.PlayerGui.Screen.Floor9Offer:Destroy()
        game.Players.LocalPlayer.PlayerGui.Screen.NewShop:Destroy()
    end
)

w1:Slider(
    "WalkSpeed",
    "WS",
    16,
    100,
    function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
) -- Text, Flag, Minimum, Maximum, Callback, Default (Optional), Flag Location (Optional)

w1:Slider(
    "JumpPower",
    "JP",
    50,
    250,
    function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end,
    50
) -- Text, Flag, Minimum, Maximum, Callback, Default (Optional), Flag Location (Optional)

w1:Button(
    "Destroy GUI",
    function()
        -- Iterate over CoreGui children
        for i, v in pairs(game.CoreGui:GetChildren()) do
            if v:FindFirstChild("Top") then
            v:Destroy()
        end
    end
end
)


w1:Button(
    "Copy discord link",
    function()
    setclipboard("discord.gg/HVqTMP2UgX")
end
) -- Text, Callback

w1:Label("made by vortex services | @Avexy") -- Text

end
