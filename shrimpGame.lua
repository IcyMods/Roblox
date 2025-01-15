local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "[🪖GUARD] Shrimp Game",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "made by vortex services | avvexyy",
    LoadingSubtitle = "by vortex",
    Theme = "Serenity ", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
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



local Button = FirstGameTab:CreateButton({
    Name = "TP to end",
    Callback = function()
    local endPart = game.Workspace.LightGameBlocker
    local character = game.Players.LocalPlayer.Character

    character.HumanoidRootPart.CFrame = endPart.CFrame
    end,
})

local TweenService = game:GetService("TweenService")


-- Add a button that can handle all four shapes (Umbrella, Triangle, Circle, Star)
local Button = SecondGameTab:CreateButton({
    Name = "Finish Cookie",
    Callback = function()
        local player = game.Players.LocalPlayer
        local mouse = player:GetMouse()
        local camera = workspace.CurrentCamera
        local needlePart = camera:FindFirstChild("Needle") -- Needle part inside Camera

        -- List of shapes (models) and their names
        local shapeNames = {"Umbrella", "Triangle", "Circle", "Star"}
        
        -- Function to find the correct shape (cookie) model
        local function findShapeModel(shapeName)
            return workspace:FindFirstChild(shapeName)
        end

        -- Function to move the needle to each LineSegment
        local function moveNeedleToSegment(segment)
            -- Tween the needle to the segment's position
            local targetCFrame = segment.CFrame
            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
            local goal = { CFrame = targetCFrame }
            local tween = TweenService:Create(needlePart, tweenInfo, goal)
            tween:Play()
        end

        -- Function to update the needle position based on mouse
        local function updateNeedlePosition()
            local mousePos = mouse.Hit.p
            needlePart.CFrame = CFrame.new(mousePos)
        end

        -- Function to start drawing a specific shape
        local function drawShape(shapeName)
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

            -- Get all the LineSegment parts inside the CutPart folder
            local lineSegments = {}
            for _, part in pairs(cutPartFolder:GetChildren()) do
                if part.Name == "LineSegment" then
                    table.insert(lineSegments, part)
                end
            end

            if #lineSegments == 0 then
                warn("No LineSegment parts found inside 'CutPart' in " .. shapeName .. "!")
                return
            end

            -- Start drawing the shape
            for _, segment in pairs(lineSegments) do
                moveNeedleToSegment(segment) -- Move needle to each segment
                wait(0.5)  -- Adjust time for smooth drawing
            end

            print(shapeName .. " drawing completed!")
        end

        -- Start the drawing process for each shape when the button is pressed
        Button.Callback = function()
            local selectedShape = "Umbrella"  -- Choose a shape to draw (change this dynamically if needed)
            drawShape(selectedShape)  -- Draw the selected shape

            -- Optionally, repeat for other shapes (Umbrella, Triangle, Circle, Star)
            -- drawShape("Triangle")
            -- drawShape("Circle")
            -- drawShape("Star")
        end
    end,
})
local Button = ThirdGameTab:CreateButton({
    Name = "Teleport to safe zone",
    Callback = function()
    local mouse = game:GetMouse()
    end,
})
