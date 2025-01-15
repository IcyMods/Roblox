local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "[🪖GUARD] Shrimp Game",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "[🪖GUARD] Shrimp Game | v1.0.7",
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

local FirstGameTab = Window:CreateTab("Red Light Green Light", 4483362458) -- Title, Image

local SecondGameTab = Window:CreateTab("Sugar Honeycombs", 4483362458) -- Title, Image

local ThirdGameTab = Window:CreateTab("Lights Out", 4483362458) -- Title, Image

local ForthGameTab = Window:CreateTab("Tug of War", 4483362458) -- Title, Image

local FifthGameTab = Window:CreateTab("Stepping Stones", 4483362458) -- Title, Image

local SixthGameTab = Window:CreateTab("Squid Game", 4483362458) -- Title, Image

local SeventhGameTab = Window:CreateTab("Mingle", 4483362458) -- Title, Image


-- Create a Label for displaying the current light color
local Label = FirstGameTab:CreateLabel("Current Light: ", Color3.fromRGB(255, 255, 255), false)

-- Function to check the light indicator's background color and update the label text
local function checkLight()
    local player = game.Players.LocalPlayer
    local lightIndicator = player.PlayerGui.interface:FindFirstChild("LightIndicator")
    
    -- Ensure the lightIndicator exists
    if lightIndicator then
        -- Get the current background color of the lightIndicator
        local currentColor = lightIndicator.BackgroundColor3
        
        -- Determine the color based on BackgroundColor3 (only checking for Red and Green)
        local colorName
        if currentColor == Color3.fromRGB(0, 255, 0) then
            colorName = "Green"
        elseif currentColor == Color3.fromRGB(255, 0, 0) then
            colorName = "Red"
        else
            colorName = "Unknown"
        end
        
        -- Update the label with the current color
        Label:Set("Current Light: " .. currentColor)  -- Update the text of the label
    else
        warn("lightIndicator not found!")
    end
end


local Button = FirstGameTab:CreateButton({
    Name = "Complete Red light, Green light",
    Callback = function()
    local endPart = game.Workspace.LightGameBlocker
    local character = game.Players.LocalPlayer.Character

    character.HumanoidRootPart.CFrame = endPart.CFrame
    end,
})

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Button = SecondGameTab:CreateButton({
    Name = "Finish Cookie",
    Callback = function()
        local camera = game.Workspace.CurrentCamera
        local needlePart = camera:FindFirstChild("Needle") -- Needle part inside Camera

        if not needlePart then
            warn("Needle part not found in the Camera!")
            return
        end

        print("Button clicked!")

        -- List of shapes (models) and their names
        local shapeNames = {"Umbrella", "Triangle", "Circle", "Star"}

        -- Function to find the correct shape (cookie) model inside the Camera
        local function findShapeModel(shapeName)
            print("Searching for shape: " .. shapeName)
            return camera:FindFirstChild(shapeName)  -- Search inside the Camera
        end

        -- Function to move the needle to each LineSegment
        local function moveNeedleToSegment(segment)
            print("Moving needle to segment: " .. segment.Name)
            -- Tween the needle to the segment's position
            local targetCFrame = segment.CFrame
            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
            local goal = { CFrame = targetCFrame }
            local tween = TweenService:Create(needlePart, tweenInfo, goal)
            tween:Play()
        end

        -- Function to start drawing a specific shape
        local function drawShape(shapeName)
            print("Starting to draw shape: " .. shapeName)

            local shapeModel = findShapeModel(shapeName)
            
            -- Check if the model exists
            if not shapeModel then
                warn(shapeName .. " model not found!")
                return
            end

            -- Find the CutPart folder inside the model
            local cutPartFolder = shapeModel:FindFirstChild("CutPart")
            if not cutPartFolder then
                warn("No 'CutPart' folder found in " .. shapeName .. "!")
                return
            end

            print("Found 'CutPart' folder in " .. shapeName)

            -- Get all the LineSegment parts inside the CutPart folder
            local lineSegments = {}
            for _, part in pairs(cutPartFolder:GetChildren()) do
                if part.Name == "LineSegment" then
                    table.insert(lineSegments, part)
                    print("Found LineSegment part: " .. part.Name)
                end
            end

            if #lineSegments == 0 then
                warn("No LineSegment parts found inside 'CutPart' in " .. shapeName .. "!")
                return
            end

            print("Found " .. #lineSegments .. " LineSegment parts.")

            -- Automatically draw the shape
            for _, segment in pairs(lineSegments) do
                moveNeedleToSegment(segment) -- Move needle to each segment
                wait(0.5)  -- Adjust time for smooth drawing
            end

            print(shapeName .. " drawing completed!")
        end

        -- Loop through each shape name and try to find the corresponding model
        for _, shapeName in pairs(shapeNames) do
            local shapeModel = findShapeModel(shapeName)
            if shapeModel then
                print("Found shape: " .. shapeName)
                drawShape(shapeName)  -- Start drawing if the shape is found
                break  -- Stop after finding and drawing the first model
            end
        end
    end,
})


local Button = ThirdGameTab:CreateButton({
    Name = "Teleport to safe zone",
    Callback = function()

    end,
})

checkLight()
