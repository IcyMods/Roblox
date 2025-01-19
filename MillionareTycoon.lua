
local library = loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/0x"))()

local w1 = library:Window("💸Millionare Empire Tycoon") -- Text

-- w1:Button(
--     "Print Hi",
--     function()
--         print("Hi")
--     end
-- ) -- Text, Callback

w1:Toggle(
    "Money",
    "frz",
    false,
    function(toggled)      
        _G.moneyhack = toggled
        while _G.moneyhack do
            game:GetService("ReplicatedStorage"):WaitForChild("fewjnfejwb3"):FireServer(10000000000000)
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

        local buttons = game.Workspace.Tycoons["Tycoon 1"]:FindFirstChild("ButtonsFolder")
        local player = game.Players.LocalPlayer
        local character = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

        if not buttons then
            warn("[ERROR] Buttons folder is missing!")
            return
        end
        
        if not character then
            warn("[ERROR] Player's HumanoidRootPart is missing!")
            return
        end

        print("Found ButtonsFolder:", buttons)
        print("Found Player's Character Root:", character)

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
            ["Double Doge Income"] = true,
            ["Golden Crystal (INSANE WORKERS BOOST)"] = true,
            ["Tip Godly Banker (DOUBLES DROPPERS)"] = true,
            ["X2 Upgrader"] = true,
            [""] = true  -- Empty name as a safety check
        }

        -- Start a loop to teleport parts continuously while the toggle is on
        task.spawn(function()
            while _G.buybuttons do
                for _, button in ipairs(buttons:GetChildren()) do
                    print("Checking button:", button.Name)

                    -- Check if the button should be ignored
                    if ignoreList[button.Name] then
                        print("Ignoring and destroying:", button.Name)
                        button:Destroy()
                    else
                        -- Move all parts inside the model
                        for _, part in ipairs(button:GetChildren()) do
                            if part:IsA("BasePart") then
                                print("Teleporting:", part.Name, "to player")
                                part.CFrame = character.CFrame
                            end
                        end
                    end
                end
                task.wait(1) -- Avoid lag, update every second
            end
        end)
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

w1:Label("made by vortex") -- Text
