
local library = loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/0x"))()

local w1 = library:Window("💸Millionare Empire Tycoon") -- Text

-- w1:Button(
--     "Print Hi",
--     function()
--         print("Hi")
--     end
-- ) -- Text, Callback

w1:Toggle(
    "INF Money",
    "frz",
    false,
    function(toggled)      
        _G.moneyhack = toggled
        while _G.moneyhack do
            game:GetService("ReplicatedStorage"):WaitForChild("fewjnfejwb3"):FireServer(10000000000000000)
            task.wait(0.0001)
        end
    end
) -- Text, Flag, Enabled, Callback, Flag Location (Optional)

w1:Toggle(
    "Buy all buttons",
    "frz",
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

        if not buttons then
            warn("[ERROR] Buttons folder is missing in:", tycoonName)
            return
        end
        
        if not character then
            warn("[ERROR] Player's HumanoidRootPart is missing!")
            return
        end

        print("Found ButtonsFolder:", buttons, "for", tycoonName)
        print("Found Player's Character Root:", character)

            -- Function to clean button names
        local function cleanName(name)
            return string.gsub(name, "^%s*(.-)%s*$", "%1") -- Trim spaces
        end

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

        -- Function to clean button names (removes leading/trailing spaces)
        local function cleanName(name)
            return string.gsub(name, "^%s*(.-)%s*$", "%1")
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
                            print("Ignoring and destroying:", cleanedName)
                            button:Destroy()
                        else
                            -- Move all parts inside the model
                            for _, part in ipairs(button:GetChildren()) do
                                if part:IsA("BasePart") then
                                    part.CFrame = character.CFrame
                                end
                            end
                        end
                    end
                end

                -- Wait a short time before checking again
                task.wait(0.02) 
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
        print("Character and HumanoidRootPart found")

        local reference = player:FindFirstChild("TycoonReference")
        if not reference or not reference.Value then
            warn("TycoonReference not found!")
            return
        end
        print("TycoonReference found:", reference.Value.Name)

        local tycoon = game.Workspace.Tycoons:FindFirstChild(reference.Value.Name)
        if not tycoon then
            warn("Tycoon not found!")
            return
        end
        print("Tycoon found:", tycoon.Name)

        local giver = tycoon:FindFirstChild("StarterParts") and tycoon.StarterParts.Collector.Givers:FindFirstChild("Giver")
        if not giver then
            warn("Giver not found!")
            return
        end
        print("Giver found:", giver.Name)

        -- Clone the Giver and modify properties
        local clonedGiver = giver:Clone()
        clonedGiver.Parent = tycoon.StarterParts.Collector.Givers
        clonedGiver.Transparency = 1
        clonedGiver.CanCollide = false
        print("Cloned Giver added to Givers folder with Transparency and CanCollide set")

        -- Auto collect loop
        task.spawn(function()
            while _G.autoCollect do
                clonedGiver.CFrame = humanoidRootPart.CFrame
                print("Moving clonedGiver to:", humanoidRootPart.CFrame) -- Print the position
                task.wait(0.3) -- Adjust timing if needed
            end
            print("Auto collect stopped.")
        end)
    end
)


w1:Toggle(
    "Disable Button Collisions",
    "frz",
    false,
    function(toggled)
        _G.noclip = toggled
        print("NoClip:", _G.noclip)

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
        
        -- Check if ButtonsFolder exists, create it if it doesn't
        local buttonsFolder = tycoon:FindFirstChild("ButtonsFolder")
        if not buttonsFolder then
            warn("[ERROR] ButtonsFolder not found! Creating ButtonsFolder...")
            buttonsFolder = Instance.new("Folder")
            buttonsFolder.Name = "ButtonsFolder"
            buttonsFolder.Parent = tycoon
            print("ButtonsFolder created in tycoon:", tycoonName)
        end      

        -- Function to update collision state
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
            print("Collision set to:", state)
        end

        -- Apply changes once when toggled
        if _G.noclip then
            updateCollisions(false) -- Disable collisions
        else
            updateCollisions(true) -- Re-enable collisions
        end
    end
)




w1:Button(
    "Disable UI offer popups",
    function()
    game.Players.LocalPlayer.PlayerGui.Screen.Floor12Offer:Destroy()
    game.Players.LocalPlayer.PlayerGui.Screen.Floor3Offer:Destroy()
    game.Players.LocalPlayer.PlayerGui.Screen.Floor6Offer:Destroy()
    game.Players.LocalPlayer.PlayerGui.Screen.Floor9Offer:Destroy()
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

-- w1:Toggle(
--     "Freeze",
--     "frz",
--     false,
--     function(toggled)
--         game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = toggled
--     end
-- ) -- Text, Flag, Enabled, Callback, Flag Location (Optional)

w1:Button(
    "Destroy GUI",
    function()
        for i, v in pairs(game.CoreGui:GetChildren()) do
            if v:FindFirstChild("Top") then
                v:Destroy()
            end
        end
    end
) -- Text, Callback

w1:Label("made by vortex services | @Avexy") -- Text
