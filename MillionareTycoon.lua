
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
            game:GetService("ReplicatedStorage"):WaitForChild("fewjnfejwb3"):FireServer(100000000000)
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
            "💸 Insane Upgrader - Super fast cash!",
            "Millionaire Maker - $1M/SECOND!",
            "Super OP Gear [Destroy Enemies]",
            "😲 TIP BANKER - HUGE CASH!",
            "Double Floors Income [INSANE VALUE]",
            "⚡Boost Workers! [Fast Cash]",
            "Upgrade Bitcoin Miner [X5 Cash]",
            "Golden Server [BOOSTS ALL MINERS]",
            "Golden DOGE [TRIPLES ALL DOGE MINERS]",
            "Double Doge Income",
            "Golden Crystal (INSANE WORKERS BOOST)",
            "Tip Godly Banker (DOUBLES DROPPERS)",
            "X2 Upgrader",
            ""
        }

        for _, button in ipairs(buttons:GetChildren()) do
            print("Checking button:", button.Name)

            -- Check if button should be ignored
            if table.find(ignoreList, button.Name) then
                print("Ignoring and destroying:", button.Name)
                button:Destroy()
            else
                -- Ensure button has a PrimaryPart before moving it
                if button:IsA("Model") and button.PrimaryPart then
                    print("Moving button:", button.Name)
                    
                    task.spawn(function()
                        while _G.buybuttons do
                            if button.Parent == nil then 
                                print("Button was removed. Stopping movement:", button.Name)
                                break 
                            end
                            
                            button.PrimaryPart.CFrame = character.CFrame
                            print("Moved", button.Name, "to character position.")

                            task.wait(1)
                        end
                    end)
                else
                    print("[WARNING] Button has no PrimaryPart:", button.Name)
                end
            end
        end
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
