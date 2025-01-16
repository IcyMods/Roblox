
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "[🪖GUARD] Shrimp Game | v1.1.0",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "[🪖GUARD] Shrimp Game | v1.1.0",
    LoadingSubtitle = "by @avvexxy",
    Theme = "Dark Blue ", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
 
    Discord = {
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

local FirstGameTab = Window:CreateTab("Main", 4483362458) -- Title, Image

local Section = FirstGameTab:CreateSection("Red Light, Green Light 🚦")

-- Create a Label for displaying the current light color
local LightSwitch = FirstGameTab:CreateLabel("Current Color", 4483362458, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme

-- Function to check the light indicator's background color and update the label text
local function checkLight()
    local player = game.Players.LocalPlayer
    local lightIndicator = player.PlayerGui.Interface:FindFirstChild("LightIndicator")
    
    -- Ensure the lightIndicator exists
    if lightIndicator then
        -- Get the current background color of the lightIndicator
        local currentColor = lightIndicator.BackgroundColor3
        
        -- Determine the color based on BackgroundColor3 (only checking for Red and Green)
        local colorName
        if currentColor == Color3.fromRGB(31, 128, 29) then
            colorName = "Green"
        elseif currentColor == Color3.fromRGB(196, 40, 28) then
            colorName = "Red"
        else
            colorName = "None"
        end
        
        -- Update the label with the current color using Rayfield's Set method

        LightSwitch:Set("Current Light: " .. colorName, 4483362458, Color3.fromRGB(255, 255, 255), false)
    else
        warn("lightIndicator not found!")
    end
end

local Button = FirstGameTab:CreateButton({
    Name = "Complete",
    Callback = function()
    local endPart = game.Workspace.LightGameBlocker
    local character = game.Players.LocalPlayer.Character

    character.HumanoidRootPart.CFrame = endPart.CFrame
    end,
})

local Section = FirstGameTab:CreateSection("Dalgona 🍪")

local UserInputService = game:GetService("UserInputService")
local camera = workspace.CurrentCamera
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- Needle part, now using 'Needle' from the camera
local NeedlePart = camera:WaitForChild("Needle")

-- Button to start the process
local Button = FirstGameTab:CreateButton({
    Name = "Complete Cookie",
    Callback = function()
        print("Button clicked!")

        local shapeNames = {"Umbrella", "Triangle", "Circle", "Star", "MonaLisa"}

        -- Function to find the shape model
        local function findShapeModel(shapeName)
            return camera:FindFirstChild(shapeName)
        end

        -- Function to simulate click on a part (LineSegment)
        local function simulateClickOnPart(targetPart)
            if targetPart then
                print("Simulating click on: " .. targetPart.Name)

                -- Move Needle to the segment (LineSegment)
                NeedlePart.CFrame = targetPart.CFrame * CFrame.new(0, 0, 2)  -- Adjust the offset to ensure it's in position

                -- Trigger actions that would normally occur during a click
                targetPart.BrickColor = BrickColor.new("Bright green")  -- Example action on click

                -- You can add other actions here as well, such as animations, sound effects, etc.
            else
                print("No target part found to simulate click on.")
            end
        end

        -- Function to automatically draw the shape and simulate clicking
        local function drawShape(shapeName)
            print("Starting to draw shape: " .. shapeName)

            local shapeModel = findShapeModel(shapeName)

            if not shapeModel then
                warn(shapeName .. " model not found!")
                return
            end

            -- Find the CutPart folder
            local cutPartFolder = shapeModel:FindFirstChild("CutPart")
            if not cutPartFolder then
                warn("No 'CutPart' folder found in " .. shapeName .. "!")
                return
            end

            -- Find LineSegment parts in CutPart folder
            local lineSegments = {}
            for _, part in pairs(cutPartFolder:GetChildren()) do
                if part.Name == "LineSegment" then
                    table.insert(lineSegments, part)
                end
            end

            -- Use a while loop to continuously click each segment until all are processed
            local segmentsProcessed = 0
            local totalSegments = #lineSegments
            while segmentsProcessed < totalSegments do
                local segment = lineSegments[segmentsProcessed + 1]  -- Get the next segment to click on
                simulateClickOnPart(segment)
                segmentsProcessed = segmentsProcessed + 1  -- Increment the counter
                wait(0.5)  -- Simulate delay between clicks, adjust as necessary
            end

            print("All segments processed!")
        end

        -- Loop through shapes and simulate clicking on parts
        for _, shapeName in pairs(shapeNames) do
            local shapeModel = findShapeModel(shapeName)
            if shapeModel then
                print("Found shape: " .. shapeName)
                drawShape(shapeName)
                break  -- Draw the first shape found
            end
        end
    end,
})


local Section = FirstGameTab:CreateSection("Lights out 🔦")


local Section = FirstGameTab:CreateSection("Mingle 🎠")


local Section = FirstGameTab:CreateSection("Tug Of War")


local RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(checkLight)
