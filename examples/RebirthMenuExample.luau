--!strict
-- RebirthMenuExample.luau
-- Standalone, production-ready Check-UI Rebirth Menu.
-- Features:
-- - Royal Purple header with 2-tier 3D shadow divider
-- - "Skip" header button sitting next to the [X] close button
-- - Comparison flow (Rebirth 1 X1 Money -> Rebirth 2 X1.3 Money)
-- - Requirements sub-container with text description
-- - Progression percentage bar (58% Completed) with orange-to-gold gradient
-- - 3D Beveled "Rebirth" action button at the bottom

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CheckUI = require(ReplicatedStorage.CheckUI.CheckUIComponents)
local Theme = require(ReplicatedStorage.CheckUI.CheckUITheme)

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RebirthGui"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- Create Window (528 x 430 px)
local rebirthWindow = CheckUI.createWindow({
    Name = "RebirthFrame",
    Size = UDim2.new(0, 528, 0, 430),
    Parent = screenGui,
    ZIndex = 20,
})

-- Create Royal Purple Header
local header = CheckUI.createHeader(rebirthWindow, "Rebirth", Theme.HeaderThemes.Rebirth)

-- Add "Skip" Button to Header (left of [X] close button)
local skipBtn = CheckUI.createHeaderButton(header, "Skip", {
    Width = 86,
    Height = 36,
    OffsetRight = -86,
})

-- Rebirth Comparison Flow (Rebirth 1 X1 Money -> Rebirth 2 X1.3 Money)
local comparison = CheckUI.createComparisonFlow({
    Size = UDim2.new(0.92, 0, 0, 56),
    Position = UDim2.new(0.5, 0, 0, 96),
    Parent = rebirthWindow,
    LeftTitle = "Rebirth 1",
    LeftValue = "X1 Money",
    RightTitle = "Rebirth 2",
    RightValue = "X1.3 Money",
})

-- Requirements Sub-Container (Recessed Dark Card with 1.2px highlight)
local reqBox = Instance.new("Frame")
reqBox.Name = "RequirementsBox"
reqBox.Size = UDim2.new(0.92, 0, 0, 172)
reqBox.Position = UDim2.new(0.5, 0, 0, 168)
reqBox.AnchorPoint = Vector2.new(0.5, 0)
reqBox.BackgroundColor3 = Theme.Colors.RequirementsBox
reqBox.BorderSizePixel = 0
reqBox.ZIndex = 22
reqBox.Parent = rebirthWindow

local reqCorner = Instance.new("UICorner")
reqCorner.CornerRadius = UDim.new(0, 4)
reqCorner.Parent = reqBox

local reqStroke = Instance.new("UIStroke")
reqStroke.Color = Theme.Colors.RequirementsHighlight
reqStroke.Thickness = 1.2
reqStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
reqStroke.Parent = reqBox

-- Title "Requirements:"
local reqTitle = Instance.new("TextLabel")
reqTitle.Name = "RequirementsTitle"
reqTitle.Text = "Requirements:"
reqTitle.Font = Theme.Typography.Font
reqTitle.TextSize = 22
reqTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
reqTitle.Size = UDim2.new(1, 0, 0, 24)
reqTitle.Position = UDim2.new(0.5, 0, 0, 10)
reqTitle.AnchorPoint = Vector2.new(0.5, 0)
reqTitle.BackgroundTransparency = 1
reqTitle.ZIndex = 23
reqTitle.Parent = reqBox

local reqTitleStroke = Instance.new("UIStroke")
reqTitleStroke.Color = Color3.fromRGB(0, 0, 0)
reqTitleStroke.Thickness = 2.4
reqTitleStroke.Parent = reqTitle

-- Description text
local reqDesc = Instance.new("TextLabel")
reqDesc.Name = "RequirementsDescription"
reqDesc.Text = "Complete the tycoon to 100% by buying every buttons, after that you are able to rebirth to gain a multiplier."
reqDesc.Font = Theme.Typography.Font
reqDesc.TextSize = 13
reqDesc.TextColor3 = Color3.fromRGB(225, 235, 245)
reqDesc.TextWrapped = true
reqDesc.Size = UDim2.new(0.92, 0, 0, 36)
reqDesc.Position = UDim2.new(0.5, 0, 0, 36)
reqDesc.AnchorPoint = Vector2.new(0.5, 0)
reqDesc.BackgroundTransparency = 1
reqDesc.ZIndex = 23
reqDesc.Parent = reqBox

local reqDescStroke = Instance.new("UIStroke")
reqDescStroke.Color = Color3.fromRGB(0, 0, 0)
reqDescStroke.Thickness = 1.8
reqDescStroke.Parent = reqDesc

-- Subtitle "Progression:"
local progTitle = Instance.new("TextLabel")
progTitle.Name = "ProgressionTitle"
progTitle.Text = "Progression:"
progTitle.Font = Theme.Typography.Font
progTitle.TextSize = 22
progTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
progTitle.Size = UDim2.new(1, 0, 0, 24)
progTitle.Position = UDim2.new(0.5, 0, 0, 84)
progTitle.AnchorPoint = Vector2.new(0.5, 0)
progTitle.BackgroundTransparency = 1
progTitle.ZIndex = 23
progTitle.Parent = reqBox

local progTitleStroke = Instance.new("UIStroke")
progTitleStroke.Color = Color3.fromRGB(0, 0, 0)
progTitleStroke.Thickness = 2.4
progTitleStroke.Parent = progTitle

-- Progression Bar (58% Completed)
local progressBar = CheckUI.createProgressBar({
    Size = UDim2.new(0.92, 0, 0, 32),
    Position = UDim2.new(0.5, 0, 0, 116),
    AnchorPoint = Vector2.new(0.5, 0),
    Parent = reqBox,
    Progress = 0.58,
    Text = "58% Completed",
    ZIndex = 24,
})

-- Big Bottom Action Button "Rebirth"
local rebirthBtn = CheckUI.create3DButton({
    Name = "RebirthActionButton",
    Size = UDim2.new(0, 180, 0, 44),
    Position = UDim2.new(0.5, 0, 0, 376),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Parent = rebirthWindow,
    Text = "Rebirth",
    TextSize = 26,
    ZIndex = 25,
})

rebirthWindow.Visible = true
return rebirthWindow
