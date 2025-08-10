-- Gui to Lua
-- Version: 3.2

-- Instances:

local AvexyPro1 = Instance.new("ScreenGui")
local AvexyFrame = Instance.new("Frame")
local Exit = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local GameName = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
local line = Instance.new("Frame")
local line_2 = Instance.new("Frame")
local Tabs = Instance.new("Frame")
local UIGridLayout = Instance.new("UIGridLayout")
local line_3 = Instance.new("Frame")
local Version1 = Instance.new("TextLabel")
local Minimize = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local ImageLabel_2 = Instance.new("ImageLabel")
local Tab = Instance.new("Frame")
local Tab1 = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local UIGridLayout_2 = Instance.new("UIGridLayout")
local UICorner_5 = Instance.new("UICorner")
local UI = Instance.new("Folder")
local Button = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local TextName = Instance.new("TextLabel")
local Keyword = Instance.new("TextLabel")
local UIGradient_2 = Instance.new("UIGradient")
local TabButton = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local TextName_2 = Instance.new("TextLabel")
local UIGradient_3 = Instance.new("UIGradient")
local Credit = Instance.new("TextLabel")
local PlayerName = Instance.new("TextLabel")
local Profile = Instance.new("ImageLabel")

--Properties:

--AvexyPro1.Name = "AvexyPro"
--AvexyPro1.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
--AvexyPro1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
--AvexyPro1.ResetOnSpawn = false

--AvexyFrame.Name = "AvexyFrame"
--AvexyFrame.Parent = AvexyPro1
--AvexyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
--AvexyFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
--AvexyFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
--AvexyFrame.BorderSizePixel = 0
--AvexyFrame.ClipsDescendants = true
--AvexyFrame.Position = UDim2.new(0.514853895, 0, 0.454884082, 0)
--AvexyFrame.Size = UDim2.new(0.269805133, 0, 0.541034818, 0)
--AvexyFrame.Visible = true

--Exit.Name = "Exit"
--Exit.Parent = AvexyFrame
--Exit.AnchorPoint = Vector2.new(0.5, 0.5)
--Exit.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
--Exit.BorderColor3 = Color3.fromRGB(0, 0, 0)
--Exit.BorderSizePixel = 0
--Exit.Position = UDim2.new(0.953449368, 0, 0.0532786883, 0)
--Exit.Size = UDim2.new(0.0680000037, 0, 0.0700000003, 0)
--Exit.AutoButtonColor = false
--Exit.Font = Enum.Font.ArialBold
--Exit.Text = ""
--Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
--Exit.TextSize = 30.000
--Exit.TextWrapped = true

--UICorner.CornerRadius = UDim.new(0, 2)
--UICorner.Parent = Exit

--ImageLabel.Parent = Exit
--ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
--ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--ImageLabel.BackgroundTransparency = 1.000
--ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
--ImageLabel.BorderSizePixel = 0
--ImageLabel.Position = UDim2.new(0.485090256, 0, 0.497658014, 0)
--ImageLabel.Size = UDim2.new(1, 0, 1, 0)
--ImageLabel.Image = "rbxassetid://10747384394"

--GameName.Name = "GameName"
--GameName.Parent = AvexyFrame
--GameName.AnchorPoint = Vector2.new(0.5, 0.5)
--GameName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--GameName.BackgroundTransparency = 1.000
--GameName.BorderColor3 = Color3.fromRGB(0, 0, 0)
--GameName.BorderSizePixel = 0
--GameName.Position = UDim2.new(0.162475824, 0, 0.0532786883, 0)
--GameName.Size = UDim2.new(0.272727281, 0, 0.0409836061, 0)
--GameName.Font = Enum.Font.Unknown
--GameName.Text = "game name"
--GameName.TextColor3 = Color3.fromRGB(255, 255, 255)
--GameName.TextScaled = true
--GameName.TextSize = 14.000
--GameName.TextWrapped = true
--GameName.TextXAlignment = Enum.TextXAlignment.Left

--UICorner_2.CornerRadius = UDim.new(0, 3)
--UICorner_2.Parent = AvexyFrame

--Title.Name = "Title"
--Title.Parent = AvexyFrame
--Title.AnchorPoint = Vector2.new(0.5, 0.5)
--Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--Title.BackgroundTransparency = 1.000
--Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
--Title.BorderSizePixel = 0
--Title.Position = UDim2.new(0.130560935, 0, 0.109631151, 0)
--Title.Size = UDim2.new(0.210831717, 0, 0.0389344245, 0)
--Title.Font = Enum.Font.Unknown
--Title.Text = "AvexyPro"
--Title.TextColor3 = Color3.fromRGB(255, 255, 255)
--Title.TextScaled = true
--Title.TextSize = 14.000
--Title.TextWrapped = true
--Title.TextXAlignment = Enum.TextXAlignment.Left

--UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 234)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
--UIGradient.Parent = Title

--line.Name = "line"
--line.Parent = AvexyFrame
--line.AnchorPoint = Vector2.new(0.5, 0.5)
--line.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
--line.BorderColor3 = Color3.fromRGB(0, 0, 0)
--line.BorderSizePixel = 0
--line.Position = UDim2.new(0.163999841, 0, 0.16803278, 0)
--line.Size = UDim2.new(0.32799992, 0, 0.00409836043, 0)

--line_2.Name = "line"
--line_2.Parent = AvexyFrame
--line_2.AnchorPoint = Vector2.new(0.5, 0.5)
--line_2.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
--line_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
--line_2.BorderSizePixel = 0
--line_2.Position = UDim2.new(0.326000005, 0, 0.5, 0)
--line_2.Size = UDim2.new(0.00400000019, 0, 1, 0)

--Tabs.Name = "Tabs"
--Tabs.Parent = AvexyFrame
--Tabs.AnchorPoint = Vector2.new(0.5, 0.5)
--Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--Tabs.BackgroundTransparency = 1.000
--Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
--Tabs.BorderSizePixel = 0
--Tabs.Position = UDim2.new(0.161475778, 0, 0.585553288, 0)
--Tabs.Size = UDim2.new(0.272661269, 0, 0.787909865, 0)

--UIGridLayout.Parent = Tabs
--UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
--UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
--UIGridLayout.CellPadding = UDim2.new(0, 5, 0, 15)
--UIGridLayout.CellSize = UDim2.new(0, 160, 0, 30)

--line_3.Name = "line"
--line_3.Parent = AvexyFrame
--line_3.AnchorPoint = Vector2.new(0.5, 0.5)
--line_3.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
--line_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
--line_3.BorderSizePixel = 0
--line_3.Position = UDim2.new(0.661552429, 0, 0.934426248, 0)
--line_3.Size = UDim2.new(0.673285425, 0, 0.00409836043, 0)

--Version1.Name = "Version"
--Version1.Parent = AvexyFrame
--Version1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--Version1.BackgroundTransparency = 1.000
--Version1.BorderColor3 = Color3.fromRGB(0, 0, 0)
--Version1.BorderSizePixel = 0
--Version1.Position = UDim2.new(0.870000005, 0, 0.944999993, 0)
--Version1.Size = UDim2.new(0.113718413, 0, 0.0430327877, 0)
--Version1.Font = Enum.Font.Unknown
--Version1.Text = "Version"
--Version1.TextColor3 = Color3.fromRGB(255, 255, 255)
--Version1.TextScaled = true
--Version1.TextSize = 14.000
--Version1.TextWrapped = true

--Minimize.Name = "Minimize"
--Minimize.Parent = AvexyFrame
--Minimize.AnchorPoint = Vector2.new(0.5, 0.5)
--Minimize.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
--Minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
--Minimize.BorderSizePixel = 0
--Minimize.Position = UDim2.new(0.874026835, 0, 0.0532786846, 0)
--Minimize.Size = UDim2.new(0.0680000037, 0, 0.0700000003, 0)
--Minimize.AutoButtonColor = false
--Minimize.Font = Enum.Font.ArialBold
--Minimize.Text = ""
--Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
--Minimize.TextSize = 30.000
--Minimize.TextWrapped = true

--UICorner_3.CornerRadius = UDim.new(0, 2)
--UICorner_3.Parent = Minimize

--ImageLabel_2.Parent = Minimize
--ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
--ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--ImageLabel_2.BackgroundTransparency = 1.000
--ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
--ImageLabel_2.BorderSizePixel = 0
--ImageLabel_2.Position = UDim2.new(0.485090256, 0, 0.497658014, 0)
--ImageLabel_2.Size = UDim2.new(1, 0, 1, 0)
--ImageLabel_2.Image = "rbxassetid://10734895530"

--Tab.Name = "Tab"
--Tab.Parent = AvexyFrame
--Tab.AnchorPoint = Vector2.new(0.5, 0.5)
--Tab.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
--Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
--Tab.BorderSizePixel = 0
--Tab.Position = UDim2.new(0.6632604, 0, 0.507045805, 0)
--Tab.Size = UDim2.new(0.640916705, 0, 0.809402645, 0)
--Tab.Visible = false

--Tab1.Name = "Tab1"
--Tab1.Parent = Tab
--Tab1.AnchorPoint = Vector2.new(0.5, 0.5)
--Tab1.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
--Tab1.BackgroundTransparency = 1.000
--Tab1.BorderColor3 = Color3.fromRGB(0, 0, 0)
--Tab1.BorderSizePixel = 0
--Tab1.Position = UDim2.new(0.282977492, 0, 0.270333201, 0)
--Tab1.Size = UDim2.new(0.477767229, 0, 0.474558711, 0)

--UICorner_4.CornerRadius = UDim.new(0, 3)
--UICorner_4.Parent = Tab1

--UIGridLayout_2.Parent = Tab1
--UIGridLayout_2.FillDirection = Enum.FillDirection.Vertical
--UIGridLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
--UIGridLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
--UIGridLayout_2.CellPadding = UDim2.new(0, 7, 0, 5)
--UIGridLayout_2.CellSize = UDim2.new(0, 190, 0, 35)

--UICorner_5.CornerRadius = UDim.new(0, 5)
--UICorner_5.Parent = Tab

--UI.Name = "UI"
--UI.Parent = AvexyFrame

--Button.Name = "Button"
--Button.Parent = UI
--Button.AnchorPoint = Vector2.new(0.5, 0.5)
--Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
--Button.BorderSizePixel = 0
--Button.Position = UDim2.new(0.645860016, 0, 0.0351563282, 0)
--Button.Size = UDim2.new(1.05922127, 0, 0.0703126565, 0)
--Button.Visible = false
--Button.AutoButtonColor = false
--Button.Font = Enum.Font.Unknown
--Button.Text = ""
--Button.TextColor3 = Color3.fromRGB(255, 255, 255)
--Button.TextSize = 20.000

--UICorner_6.CornerRadius = UDim.new(0, 4)
--UICorner_6.Parent = Button

--TextName.Name = "TextName"
--TextName.Parent = Button
--TextName.AnchorPoint = Vector2.new(0.5, 0.5)
--TextName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--TextName.BackgroundTransparency = 1.000
--TextName.BorderColor3 = Color3.fromRGB(0, 0, 0)
--TextName.BorderSizePixel = 0
--TextName.Position = UDim2.new(0.50000006, 0, 0.537694216, 0)
--TextName.Size = UDim2.new(0.999999881, 0, 0.422020882, 0)
--TextName.Font = Enum.Font.Unknown
--TextName.Text = "Name"
--TextName.TextColor3 = Color3.fromRGB(255, 255, 255)
--TextName.TextSize = 20.000
--TextName.TextWrapped = true

--Keyword.Name = "Keyword"
--Keyword.Parent = Button
--Keyword.AnchorPoint = Vector2.new(0.5, 0.5)
--Keyword.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--Keyword.BackgroundTransparency = 1.000
--Keyword.BorderColor3 = Color3.fromRGB(0, 0, 0)
--Keyword.BorderSizePixel = 0
--Keyword.Position = UDim2.new(0.5, 0, 0.829999983, 0)
--Keyword.Size = UDim2.new(0.999999881, 0, 0.145596042, 0)
--Keyword.Font = Enum.Font.Unknown
--Keyword.Text = "Button"
--Keyword.TextColor3 = Color3.fromRGB(100, 100, 100)
--Keyword.TextSize = 13.000
--Keyword.TextWrapped = true

--UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(204, 0, 255)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(204, 82, 213)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(184, 80, 213))}
--UIGradient_2.Rotation = 90
--UIGradient_2.Parent = Button

--TabButton.Name = "TabButton"
--TabButton.Parent = UI
--TabButton.AnchorPoint = Vector2.new(0.5, 0.5)
--TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
--TabButton.BorderSizePixel = 0
--TabButton.Position = UDim2.new(0.645860076, 0, 0.0380228125, 0)
--TabButton.Size = UDim2.new(1.05922139, 0, 0.0760456249, 0)
--TabButton.Visible = false
--TabButton.AutoButtonColor = false
--TabButton.Font = Enum.Font.Unknown
--TabButton.Text = ""
--TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
--TabButton.TextSize = 20.000

--UICorner_7.CornerRadius = UDim.new(0, 5)
--UICorner_7.Parent = TabButton

--TextName_2.Name = "TextName"
--TextName_2.Parent = TabButton
--TextName_2.AnchorPoint = Vector2.new(0.5, 0.5)
--TextName_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--TextName_2.BackgroundTransparency = 1.000
--TextName_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
--TextName_2.BorderSizePixel = 0
--TextName_2.Position = UDim2.new(0.5, 0, 0.5, 0)
--TextName_2.Size = UDim2.new(1, 0, 1, 0)
--TextName_2.Font = Enum.Font.Unknown
--TextName_2.Text = "Name"
--TextName_2.TextColor3 = Color3.fromRGB(255, 255, 255)
--TextName_2.TextSize = 20.000
--TextName_2.TextWrapped = true



local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local function DragUI(gui)
	local dragging = false
	local dragStart
	local startPos

	-- Tween information for the smooth movement
	local dragTweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

	-- Function to smoothly update UI position based on the mouse position
	local function update(input)
		local delta = input.Position - dragStart  -- The difference between the mouse position and the drag start
		local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)

		-- Create the tween to smoothly update the position
		local tween = TweenService:Create(gui, dragTweenInfo, {Position = newPos})
		tween:Play()  -- Play the animation
	end

	-- Listen for when the user clicks on the GUI
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position  -- Record where the drag started
			startPos = gui.Position  -- Record the starting position of the GUI
		end
	end)

	-- Listen for when the user moves the mouse while dragging
	UserInputService.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			update(input)  -- Update position of the UI smoothly while dragging
		end
	end)

	-- Listen for when the user releases the mouse button
	gui.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false  -- Stop dragging when the mouse button is released
		end
	end)
end

local tabLimit = 4

local AvexyPro = {}

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local userId = player.UserId -- Get the player's UserId
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

function AvexyPro:CreateWindow(Name)
	local Window = {}

	AvexyPro1.Name = "AvexyPro"
	AvexyPro1.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	AvexyPro1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	AvexyPro1.ResetOnSpawn = false

	AvexyFrame.Name = "AvexyFrame"
	AvexyFrame.Parent = AvexyPro1
	AvexyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	AvexyFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
	AvexyFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	AvexyFrame.BorderSizePixel = 0
	AvexyFrame.ClipsDescendants = true
	AvexyFrame.Position = UDim2.new(0.514853895, 0, 0.454884082, 0)
	AvexyFrame.Size = UDim2.new(0.269805133, 0, 0.541034818, 0)
	AvexyFrame.Visible = true
	
	UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(18, 18, 18)), ColorSequenceKeypoint.new(0.304, Color3.fromRGB(18, 18, 18)), ColorSequenceKeypoint.new(0.537, Color3.fromRGB(16, 16, 16)), ColorSequenceKeypoint.new(0.789, Color3.fromRGB(20, 20, 20)), ColorSequenceKeypoint.new(1, Color3.fromRGB(36, 36, 36))}
	UIGradient_3.Rotation = -60
	UIGradient_3.Parent = AvexyFrame
	
	Credit.Text = "Made By @Avexy"
	Credit.BackgroundTransparency = 1
	Credit.Font = Enum.Font.FredokaOne
	Credit.TextColor3 = Color3.fromRGB(255, 255, 255)
	Credit.Size = UDim2.new(0.137, 0, 0.042, 0)
	Credit.Position = UDim2.new(0.676, 0, 0.946, 0)
	Credit.Visible = true
	Credit.TextScaled = true
	Credit.Parent = AvexyFrame
	
	PlayerName.Text = game.Players.LocalPlayer.Name
	PlayerName.BackgroundTransparency = 1
	PlayerName.Font = Enum.Font.FredokaOne
	PlayerName.TextColor3 = Color3.fromRGB(255, 255, 255)
	PlayerName.Size = UDim2.new(0.137, 0, 0.042, 0)
	PlayerName.Position = UDim2.new(0.413, 0, 0.946, 0)
	PlayerName.Visible = true
	PlayerName.TextScaled = true
	PlayerName.Parent = AvexyFrame

	if isReady then
		Profile.Image = content -- Set the profile picture
	end
	
	Profile.BackgroundTransparency = 1
	Profile.Size = UDim2.new(0.045, 0, 0.053, 0)
	Profile.Position = UDim2.new(0.355, 0, 0.94, 0)
	Profile.Parent = AvexyFrame

	
	DragUI(AvexyFrame)

	Exit.Name = "Exit"
	Exit.Parent = AvexyFrame
	Exit.AnchorPoint = Vector2.new(0.5, 0.5)
	Exit.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	Exit.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Exit.BorderSizePixel = 0
	Exit.Position = UDim2.new(0.953449368, 0, 0.0532786883, 0)
	Exit.Size = UDim2.new(0.0680000037, 0, 0.0700000003, 0)
	Exit.AutoButtonColor = false
	Exit.Font = Enum.Font.ArialBold
	Exit.Text = ""
	Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
	Exit.TextSize = 30.000
	Exit.TextWrapped = true

	UICorner.CornerRadius = UDim.new(0, 2)
	UICorner.Parent = Exit

	ImageLabel.Parent = Exit
	ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Position = UDim2.new(0.485090256, 0, 0.497658014, 0)
	ImageLabel.Size = UDim2.new(1, 0, 1, 0)
	ImageLabel.Image = "rbxassetid://10747384394"

	GameName.Name = "GameName"
	GameName.Parent = AvexyFrame
	GameName.AnchorPoint = Vector2.new(0.5, 0.5)
	GameName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GameName.BackgroundTransparency = 1.000
	GameName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GameName.BorderSizePixel = 0
	GameName.Position = UDim2.new(0.162475824, 0, 0.0532786883, 0)
	GameName.Size = UDim2.new(0.272727281, 0, 0.0409836061, 0)
	GameName.Font = Enum.Font.Unknown
	GameName.Text = Name
	GameName.TextColor3 = Color3.fromRGB(255, 255, 255)
	GameName.TextScaled = true
	GameName.TextSize = 14.000
	GameName.TextWrapped = true
	GameName.TextXAlignment = Enum.TextXAlignment.Left

	UICorner_2.CornerRadius = UDim.new(0, 3)
	UICorner_2.Parent = AvexyFrame

	Title.Name = "Title"
	Title.Parent = AvexyFrame
	Title.AnchorPoint = Vector2.new(0.5, 0.5)
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.130560935, 0, 0.109631151, 0)
	Title.Size = UDim2.new(0.210831717, 0, 0.0389344245, 0)
	Title.Font = Enum.Font.Unknown
	Title.Text = "AvexyPro"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextScaled = true
	Title.TextSize = 14.000
	Title.TextWrapped = true
	Title.TextXAlignment = Enum.TextXAlignment.Left

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 234)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
	UIGradient.Parent = Title

	line.Name = "line"
	line.Parent = AvexyFrame
	line.AnchorPoint = Vector2.new(0.5, 0.5)
	line.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
	line.BorderColor3 = Color3.fromRGB(0, 0, 0)
	line.BorderSizePixel = 0
	line.Position = UDim2.new(0.163999841, 0, 0.16803278, 0)
	line.Size = UDim2.new(0.32799992, 0, 0.00409836043, 0)

	line_2.Name = "line"
	line_2.Parent = AvexyFrame
	line_2.AnchorPoint = Vector2.new(0.5, 0.5)
	line_2.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
	line_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	line_2.BorderSizePixel = 0
	line_2.Position = UDim2.new(0.326000005, 0, 0.5, 0)
	line_2.Size = UDim2.new(0.00400000019, 0, 1, 0)

	Tabs.Name = "Tabs"
	Tabs.Parent = AvexyFrame
	Tabs.AnchorPoint = Vector2.new(0.5, 0.5)
	Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tabs.BackgroundTransparency = 1.000
	Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tabs.BorderSizePixel = 0
	Tabs.Position = UDim2.new(0.161475778, 0, 0.585553288, 0)
	Tabs.Size = UDim2.new(0.272661269, 0, 0.787909865, 0)

	UIGridLayout.Parent = Tabs
	UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellPadding = UDim2.new(0, 5, 0, 15)
	UIGridLayout.CellSize = UDim2.new(0, 100, 0, 30)

	line_3.Name = "line"
	line_3.Parent = AvexyFrame
	line_3.AnchorPoint = Vector2.new(0.5, 0.5)
	line_3.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
	line_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	line_3.BorderSizePixel = 0
	line_3.Position = UDim2.new(0.661552429, 0, 0.934426248, 0)
	line_3.Size = UDim2.new(0.673285425, 0, 0.00409836043, 0)

	Version1.Name = "Version"
	Version1.Parent = AvexyFrame
	Version1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Version1.BackgroundTransparency = 1.000
	Version1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Version1.BorderSizePixel = 0
	Version1.Position = UDim2.new(0.870000005, 0, 0.944999993, 0)
	Version1.Size = UDim2.new(0.113718413, 0, 0.0430327877, 0)
	Version1.Font = Enum.Font.Unknown
	Version1.Text = "v0.0.2"
	Version1.TextColor3 = Color3.fromRGB(255, 255, 255)
	Version1.TextScaled = true
	Version1.TextSize = 14.000
	Version1.TextWrapped = true

	Minimize.Name = "Minimize"
	Minimize.Parent = AvexyFrame
	Minimize.AnchorPoint = Vector2.new(0.5, 0.5)
	Minimize.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	Minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Minimize.BorderSizePixel = 0
	Minimize.Position = UDim2.new(0.874026835, 0, 0.0532786846, 0)
	Minimize.Size = UDim2.new(0.0680000037, 0, 0.0700000003, 0)
	Minimize.AutoButtonColor = false
	Minimize.Font = Enum.Font.ArialBold
	Minimize.Text = ""
	Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
	Minimize.TextSize = 30.000
	Minimize.TextWrapped = true

	UICorner_3.CornerRadius = UDim.new(0, 2)
	UICorner_3.Parent = Minimize

	ImageLabel_2.Parent = Minimize
	ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel_2.BackgroundTransparency = 1.000
	ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel_2.BorderSizePixel = 0
	ImageLabel_2.Position = UDim2.new(0.485090256, 0, 0.497658014, 0)
	ImageLabel_2.Size = UDim2.new(1, 0, 1, 0)
	ImageLabel_2.Image = "rbxassetid://10734895530"

	Tab1.Name = "Tab1"
	Tab1.Parent = Tab
	Tab1.AnchorPoint = Vector2.new(0.5, 0.5)
	Tab1.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
	Tab1.BackgroundTransparency = 1.000
	Tab1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tab1.BorderSizePixel = 0
	Tab1.Position = UDim2.new(0.282977492, 0, 0.270333201, 0)
	Tab1.Size = UDim2.new(0.477767229, 0, 0.474558711, 0)

	UICorner_4.CornerRadius = UDim.new(0, 3)
	UICorner_4.Parent = Tab1

	UIGridLayout_2.Parent = Tab1
	UIGridLayout_2.FillDirection = Enum.FillDirection.Vertical
	UIGridLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIGridLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout_2.CellPadding = UDim2.new(0, 7, 0, 5)
	UIGridLayout_2.CellSize = UDim2.new(0, 130, 0, 25)

	UICorner_5.CornerRadius = UDim.new(0, 5)
	UICorner_5.Parent = Tab

	UI.Name = "UI"
	UI.Parent = AvexyFrame

	UICorner_6.CornerRadius = UDim.new(0, 4)
	UICorner_6.Parent = Button

	TextName.Name = "TextName"
	TextName.Parent = Button
	TextName.AnchorPoint = Vector2.new(0.5, 0.5)
	TextName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextName.BackgroundTransparency = 1.000
	TextName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextName.BorderSizePixel = 0
	TextName.Position = UDim2.new(0.50000006, 0, 0.537694216, 0)
	TextName.Size = UDim2.new(0.999999881, 0, 0.422020882, 0)
	TextName.Font = Enum.Font.FredokaOne
	TextName.Text = ""
	TextName.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextName.TextScaled = true
	TextName.TextWrapped = true

	Keyword.Name = "Keyword"
	Keyword.Parent = Button
	Keyword.AnchorPoint = Vector2.new(0.5, 0.5)
	Keyword.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Keyword.BackgroundTransparency = 1.000
	Keyword.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Keyword.BorderSizePixel = 0
	Keyword.Position = UDim2.new(0.5, 0, 0.829999983, 0)
	Keyword.Size = UDim2.new(0.999999881, 0, 0.145596042, 0)
	Keyword.Font = Enum.Font.FredokaOne
	Keyword.Text = "Button"
	Keyword.TextColor3 = Color3.fromRGB(100, 100, 100)
	Keyword.TextSize = 13.000
	Keyword.TextWrapped = true

	UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(204, 0, 255)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(204, 82, 213)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(184, 80, 213))}
	UIGradient_2.Rotation = 90
	UIGradient_2.Parent = Button

	UICorner_7.CornerRadius = UDim.new(0, 5)
	UICorner_7.Parent = TabButton

	TextName_2.Name = "TextName"
	--TextName_2.Parent = TabButton
	TextName_2.AnchorPoint = Vector2.new(0.5, 0.5)
	TextName_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextName_2.BackgroundTransparency = 1.000
	TextName_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextName_2.BorderSizePixel = 0
	TextName_2.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextName_2.Size = UDim2.new(1, 0, 1, 0)
	TextName_2.Font = Enum.Font.FredokaOne
	TextName_2.Text = "Name"
	TextName_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextName_2.TextSize = 20.000
	TextName_2.TextWrapped = true
	
	--Button.Name = "Button"
	--Button.Parent = UI
	--Button.AnchorPoint = Vector2.new(0.5, 0.5)
	--Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	--Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
	--Button.BorderSizePixel = 0
	--Button.Position = UDim2.new(0.645860016, 0, 0.0351563282, 0)
	--Button.Size = UDim2.new(1.05922127, 0, 0.0703126565, 0)
	--Button.Visible = false
	--Button.AutoButtonColor = false
	--Button.Font = Enum.Font.FredokaOne
	--Button.Text = ""
	--Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	--Button.TextSize = 20.000
	
	--TabButton.Name = "TabButton"
	--TabButton.Parent = UI
	--TabButton.AnchorPoint = Vector2.new(0.5, 0.5)
	--TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	--TabButton.BorderSizePixel = 0
	--TabButton.Position = UDim2.new(0.645860076, 0, 0.0380228125, 0)
	--TabButton.Size = UDim2.new(1.05922139, 0, 0.0760456249, 0)
	--TabButton.Visible = false
	--TabButton.AutoButtonColor = false
	--TabButton.Font = Enum.Font.FredokaOne
	--TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	--TabButton.TextSize = 12.000

	Window.Instance = AvexyPro1
	Window.Tabs = {} -- Store tabs for switching logic

	-- Function to create a new tab
	function Window:CreateTab(Name)
		local newTabButton = TabButton:Clone()

		newTabButton.Parent = Tabs
		newTabButton.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
		newTabButton.Visible = true
		newTabButton.Name = "TabButton"
		newTabButton.AutoButtonColor = false
		newTabButton.Font = Enum.Font.FredokaOne
		newTabButton.Text = ""

		-- Create a new TextName instance for each tab button
		local newTextName = Instance.new("TextLabel")
		newTextName.Name = "TextName"
		newTextName.Parent = newTabButton
		newTextName.AnchorPoint = Vector2.new(0.5, 0.5)
		newTextName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		newTextName.BackgroundTransparency = 1.000
		newTextName.BorderSizePixel = 0
		newTextName.Position = UDim2.new(0.5, 0, 0.5, 0)
		newTextName.Size = UDim2.new(1, 0, 1, 0)
		newTextName.Font = Enum.Font.FredokaOne
		newTextName.Text = Name  -- Set the correct name for each tab
		newTextName.TextColor3 = Color3.fromRGB(255, 255, 255)
		newTextName.TextSize = 20.000
		newTextName.TextWrapped = true

		local newTab = Tab:Clone()
		newTab.Name = "Tab"
		newTab.Parent = AvexyFrame
		newTab.AnchorPoint = Vector2.new(0.5, 0.5)
		newTab.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
		newTab.BorderSizePixel = 0
		newTab.Position = UDim2.new(0.6632604, 0, 0.507045805, 0)
		newTab.Size = UDim2.new(0.640916705, 0, 0.809402645, 0)
		newTab.Visible = false

		-- Store tab info
		table.insert(self.Tabs, {Button = newTabButton, Frame = newTab})

		-- Create the UIGradient for the tab button
		local gradient = Instance.new("UIGradient")
		gradient.Parent = newTabButton
		gradient.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)), 
			ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))
		})

		-- Function to reset all tabs
		local function resetTabs()
			for _, tabData in pairs(self.Tabs) do
				tabData.Frame.Visible = false
				local existingGradient = tabData.Button:FindFirstChild("UIGradient")
				if existingGradient then
					existingGradient.Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)),
						ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))
					})
				end
			end
		end

		-- Handle tab button click
		local function onClick()
			resetTabs() -- Reset others before applying highlight
			newTab.Visible = true
			newTabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

			-- Update gradient color on click
			gradient.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 208)), 
				ColorSequenceKeypoint.new(1, Color3.fromRGB(115, 0, 94))
			})
		end

		newTabButton.MouseButton1Click:Connect(onClick)

		local TabObject = {
			Instance = newTab
		}

		function TabObject:CreateButton(options)
			local newButton = Instance.new("TextButton") -- Create a new button instance
			newButton.Name = "Button"
			newButton.Parent = self.Instance -- Correctly parent it to the tab
			newButton.AnchorPoint = Vector2.new(0.5, 0.5)
			newButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			newButton.BorderSizePixel = 0
			newButton.Position = UDim2.new(0.5, 0, 0.1, 0) -- Center it in the tab
			newButton.Size = UDim2.new(0.8, 0, 0.1, 0) -- Proper button size
			newButton.Visible = true
			newButton.AutoButtonColor = false
			newButton.Font = Enum.Font.FredokaOne
			newButton.Text = options.Name or "Button" -- Set the button name
			newButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			newButton.TextSize = 20
			newButton.BackgroundTransparency = 0.1

			-- Handle button click event
			if options.Callback then
				newButton.MouseButton1Click:Connect(options.Callback)
			end

			return newButton
		end


		return TabObject
	end

	return Window
end

--local function CreateTab(Name)
--	local tabs = game.Players.LocalPlayer.PlayerGui.AvexyPro.AvexyFrame.UI.TabButton

--	local tab = game.Players.LocalPlayer.PlayerGui.AvexyPro.AvexyFrame.Tab.Tab1

--	tabs.Parent = game.Players.LocalPlayer.PlayerGui.AvexyPro.AvexyFrame.Tabs
--	tabs.Visible = true
--	TextName_2.Text = Name
--	tabs.BackgroundColor3 = Color3.fromRGB(18, 18, 18)

--	tab.Parent =	script.Parent.AvexyFrame.Tab
--	tab.Visible = true

--	-- Ensure only one gradient exists
--	local gradient = tabs:FindFirstChild("UIGradient")
--	if not gradient then
--		gradient = Instance.new("UIGradient")
--		gradient.Parent = TabButton
--	end

--	-- Function to reset all buttons' gradients within this tab only
--	local function resetAllButtons()
--		for _, otherButton in pairs(game.Players.LocalPlayer.PlayerGui.AvexyPro.AvexyFrame.Tabs:GetChildren()) do
--			if otherButton:IsA("TextButton") then
--				local existingGradient = otherButton:FindFirstChild("UIGradient")
--				if existingGradient then
--					existingGradient.Color = ColorSequence.new({
--						ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)), -- Default white
--						ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))  -- Light gray
--					})

--					--newTab.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
--				end
--			end
--		end
--	end

--	-- Define the click behavior
--	local function onClick()
--		resetAllButtons() -- Reset others before applying highlight

--		tab.Parent.Visible = true
--		tab.Visible = true

--		TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

--		gradient.Color = ColorSequence.new({
--			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 208)), -- Purple color
--			ColorSequenceKeypoint.new(1, Color3.fromRGB(115, 0, 94))   -- Dark color
--		})

--	end

--	TabButton.MouseButton1Click:Connect(onClick)
--end

--local function CreateButton(options)
--	local button1 = game.Players.LocalPlayer.PlayerGui.AvexyPro.AvexyFrame.UI.Button
	
--	button1.Parent = game.Players.LocalPlayer.PlayerGui.AvexyPro.AvexyFrame.Tab.Tab1
--	button1.Visible = true
--	TextName.Text = options.Name

--	return button1
--end

return AvexyPro
