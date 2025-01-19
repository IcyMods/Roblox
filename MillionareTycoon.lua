
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
            game:GetService("ReplicatedStorage"):WaitForChild("fewjnfejwb3"):FireServer(1000000000)
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

        local buttons = game.Workspace.Tycoons["Tycoon 1"].ButtonsFolder
        local player = game.Players.LocalPlayer
        local character = player.Character.HumanoidRootPart

        for _, button in ipairs(buttons:GetChildren()) do
            if button.Name == "💸 Insane Upgrader - Super fast cash!" and button.Name == "💸 Insane Upgrader - Super fast cash!" and button.Name == "Millionaire Maker - $1M/SECOND!" then
            -- do nothing
            button:Destroy()
        else
            while _G.buybuttons do
                button.PrimaryPart.CFrame = character.CFrame
                task.wait(1)
            end
        end
    end
end
) -- Text, Flag, Enabled, Callback, Flag Location (Optional)

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
    100
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
