local env = game.Workspace
local segments = env.segmentSystem.Segments

local id = 16993432698

if game.PlaceId == id then

local gui = loadstring(game:HttpGet("https://gitlab.com/0x45.xyz/droplib/-/raw/master/drop-minified.lua"))():Init(CONFIG,SCREENGUI_PARENT)

local category = gui:CreateCategory("Impossible Squid Game! Glass Bridge 2", POSITION)

local section = category:CreateSection("Game")

local label = section:CreateTextLabel("v1.0.3")

local function showPath()
        print("showing path")
        while true do
            for i = 1, 55 do
                local model = segments:FindFirstChild("Segment" .. i)
                
                if model then
                    local folder = model:FindFirstChild("Folder")
                    if folder then
                        -- Loop through all parts inside the Folder
                        for _, part in ipairs(folder:GetChildren()) do
                            local boolValue = part:FindFirstChildWhichIsA("BoolValue")
                            if boolValue then
                                -- Update color based on BoolValue
                                if boolValue.Value == true then
                                    if part.BrickColor ~= BrickColor.new("Bright red") then
                                        part.BrickColor = BrickColor.new("Bright red")
                                    end
                                elseif boolValue.Value == false and part.Transparency == 1 then
                                    -- If BoolValue is false and transparency is 1, set the part to red
                                    part.BrickColor = BrickColor.new("Bright red")
                                end
                            else
                                part.BrickColor = BrickColor.new("Bright green")
                                part.Transparency = 0.6  -- Ensure part is visible
                        end
                    end
                end
            end
        end
        task.wait(.0001)
    end
end

local function autoFarm()
    print("Starting auto farm...")

    local maxIterations = 100  -- Limit the number of iterations to avoid infinite loops
    local iterationCount = 0

    local character = game.Players.LocalPlayer.Character
    local humanoid = character and character:FindFirstChild("Humanoid")
    
    if not humanoid then
        print("No humanoid found in the character.")
        return
    end

    -- Loop through all segments in order (Segment1 to Segment55)
    for i = 1, 55 do
        local segment = segments:FindFirstChild("Segment" .. i)
        
        if segment then
            local folder = segment:FindFirstChild("Folder")
            if folder then
                -- Loop through all parts inside the Folder to find the first green part
                local greenPart = nil
                for _, part in ipairs(folder:GetChildren()) do
                    if part.BrickColor == BrickColor.new("Bright green") then
                        greenPart = part
                        break  -- Stop searching once we find the first green part
                    end
                end

                -- If a green part is found, move to it
                if greenPart then
                    local distance = (greenPart.Position - character.HumanoidRootPart.Position).Magnitude
                    print("Moving to the green part in Segment" .. i)

                    humanoid:MoveTo(greenPart.Position)

                    -- Wait until the character reaches the green part
                    while humanoid and (greenPart.Position - character.HumanoidRootPart.Position).Magnitude > 5 do
                        -- Ensure humanoid is not stuck and is moving
                        if humanoid.Health <= 0 then
                            print("Humanoid is dead. Stopping auto farm.")
                            return
                        end

                        -- If humanoid has moved, break the wait loop
                        if humanoid.WalkSpeed > 0 then
                            print("Character is moving towards the green part.")
                        end

                        task.wait(0.5)  -- Wait while moving toward the part
                    end

                    print("Reached green part in Segment" .. i)
                else
                    print("No green part found in Segment" .. i)
                end
            else
                print("No folder found in Segment" .. i)
            end
        else
            print("No Segment" .. i .. " found")
        end

        -- Short wait before moving to the next segment
        task.wait(0.05)

        -- Stop after a certain number of iterations to avoid infinite loops
        iterationCount = iterationCount + 1
        if iterationCount >= maxIterations then
            print("Reached maximum iterations, stopping auto farm.")
            break
        end
    end
end

local currentState = false  -- Make currentState global

local function autoFarmV2()
    local finish = game.Workspace.Finish.Chest
    local character = game.Players.LocalPlayer.Character

    if not character.HumanoidRootPart then
        print("HumanoidRootPart not found")
        return
    end

    local currentState = false
    local switchActive = false  -- Control flag to determine if auto-farming should continue

    -- Create a switch for enabling/disabling auto-farming
    local switch = section:CreateSwitch('Auto Farm V2', function(value)
        switchActive = value  -- Update the switch state when toggled
    end, false)

    -- Auto-farm loop
    while true do
        if switchActive then
            if currentState == false then
                print("Moving to finish position...")
                -- Move the character to the finish position (Position, not CFrame)
                character.HumanoidRootPart.Position = finish.Position
                task.wait(1)  -- Wait for the character to reach the chest

                currentState = true
            elseif currentState == true then
                print("Waiting before switching state back to false.")
                task.wait(0.55)  -- Wait before switching back to false
                currentState = false
            end
        else
            -- If switch is turned off, exit the loop
            print("Auto-farm turned off.")
            break
        end

        task.wait(0.1)  -- Small wait to prevent the loop from being too resource-intensive
    end
end

-- This should be the single toggle:
section:CreateSwitch('Auto Farm V2', function(value)
    -- Only this switch controls the state of auto-farming
    switchActive = value
end, false)


local function onSliderChange(newValue)
    print("Slider value changed to: " .. newValue)
    
    -- Example of using the new value (e.g., adjusting WalkSpeed)
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = newValue  -- Adjust walk speed based on slider value
        end
    end
end

local label = section:CreateTextLabel("enable Show Path to Auto Farm")

local button = section:CreateButton("Show Path", showPath)

local button = section:CreateButton("Auto Farm", autoFarm)


-- Create the slider
local slider = section:CreateSlider(
    "WalkSpeed",   -- TITLE: Label for the slider
    onSliderChange, -- CALLBACK: Function that will run when the slider is changed
    16,             -- MIN: Minimum value of the slider
    60,            -- MAX: Maximum value of the slider
    1,              -- STEP: Slider steps by 1
    true,           -- DYNAMIC: Whether the value updates dynamically (true means it updates immediately)
    16              -- INITIAL: Initial value for the slider
)

end
