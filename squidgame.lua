local env = game.Workspace
local segments = env.segmentSystem.Segments

local id = 16993432698

if game.PlaceId == id then

local gui = loadstring(game:HttpGet("https://gitlab.com/0x45.xyz/droplib/-/raw/master/drop-minified.lua"))():Init(CONFIG,SCREENGUI_PARENT)

local category = gui:CreateCategory("Impossible Squid Game! Glass Bridge 2", POSITION)

local section = category:CreateSection("Main")

local label = section:CreateTextLabel("v1.0.6")
local label = section:CreateTextLabel("Made by Vortex Services - avvexyy")

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
local switchActive = false  -- Flag to control the state of the switch

local bodyVelocity = nil  -- Store reference to BodyVelocity to be able to remove it later

-- Function that controls the auto-farm process
local function autoFarmV2()
    local finish = game.Workspace.Finish.Chest
    local character = game.Players.LocalPlayer.Character

    if not character.HumanoidRootPart then
        print("HumanoidRootPart not found")
        return
    end

    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then
        print("Humanoid not found")
        return
    end

    -- Ensure the character is floating
    if not bodyVelocity then
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)  -- High force to override gravity
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)  -- Start with no initial movement
        bodyVelocity.Parent = character.HumanoidRootPart  -- Attach the velocity to the HumanoidRootPart
    end

    local glideSpeed = 175  -- Speed at which the player glides (can be adjusted)

    -- Auto-farm loop: Will run as long as switchActive is true
    while switchActive do
        if currentState == false then
            print("Gliding to finish position...")

            -- Calculate the direction towards the finish position
            local direction = (finish.Position - character.HumanoidRootPart.Position).unit

            -- Apply velocity towards the finish position
            bodyVelocity.Velocity = direction * glideSpeed  -- Move towards the chest

            -- Wait until the character reaches the chest
            local distance = (finish.Position - character.HumanoidRootPart.Position).Magnitude
            while distance > 2 do  -- Adjust threshold as needed for when to stop
                distance = (finish.Position - character.HumanoidRootPart.Position).Magnitude
                task.wait(0.1)
            end

            -- Stop the glide once the target is reached
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            task.wait(1)  -- Wait after reaching the chest
            currentState = true
        elseif currentState == true then
            print("Waiting before switching state back to false.")
            task.wait(3)  -- Wait before switching back to false
            currentState = false
        end

        task.wait(2)  -- Small wait to prevent the loop from being too resource-intensive
    end

    -- Remove the body velocity when the process is finished or when the switch is off
    if bodyVelocity then
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)  -- Stop the glide immediately
        bodyVelocity:Destroy()  -- Remove BodyVelocity to restore normal movement
        bodyVelocity = nil  -- Reset the reference
    end

    print("Auto-farm stopped.")
end

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

-- Create the switch to enable/disable auto-farming
section:CreateSwitch('Auto Farm V2', function(value)
    switchActive = value  -- Update the switch state

    if switchActive then
        -- Start the auto-farm when the switch is turned on
        print("Starting auto-farm...")
        -- Start auto-farm in a new thread to avoid blocking the switch's OnChanged callback
        spawn(autoFarmV2)  
    else
        -- If the switch is turned off, auto-farm will stop
        print("Auto-farm turned off.")
        -- When switched off, we ensure to stop the glide and restore normal movement
        if bodyVelocity then
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)  -- Stop any ongoing movement
            bodyVelocity:Destroy()  -- Remove BodyVelocity to restore normal movement
            bodyVelocity = nil  -- Reset reference to ensure it's not reused
        end
    end
end, false)


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
