--!strict
-- DailyRewardsMenuExample.luau
-- Standalone, production-grade Check-UI Daily Rewards Menu.
-- Features:
-- - Lime green header with 2-tier 3D shadow divider
-- - 3x2 Grid for Days 1 to 6 with dynamic color gradients:
--   Days 1-3: Cyan/Blue, Day 4: Purple with Sunburst, Day 5: Magenta, Day 6: Amber
-- - Spanning full-height Day 7 Featured Card with Rainbow/Spectrum gradient & rotating sunburst
-- - Button State Triad: "CLAIMED" (Silver), "CLAIM" (Lime Green), "LOCKED" (Crimson Red)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local CheckUI = require(ReplicatedStorage.CheckUI.CheckUIComponents)
local Theme = require(ReplicatedStorage.CheckUI.CheckUITheme)

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DailyRewardsGui"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- Create Window (640 x 440 px)
local dailyWindow = CheckUI.createWindow({
    Name = "DailyRewardsFrame",
    Size = UDim2.new(0, 640, 0, 440),
    Parent = screenGui,
    ZIndex = 20,
})

-- Create Lime Green Header
local header = CheckUI.createHeader(dailyWindow, "Daily Rewards", Theme.HeaderThemes.DailyRewards)

-- Container for Content
local contentArea = Instance.new("Frame")
contentArea.Name = "ContentArea"
contentArea.Size = UDim2.new(0.96, 0, 0, 360)
contentArea.Position = UDim2.new(0.5, 0, 0, 70)
contentArea.AnchorPoint = Vector2.new(0.5, 0)
contentArea.BackgroundTransparency = 1
contentArea.ZIndex = 21
contentArea.Parent = dailyWindow

-- Grid configuration
-- Days 1-6 span X: 0 to ~72% of width (3 cols x 2 rows)
-- Day 7 spans X: ~75% to 100% of width (1 col x full height)
local cardWidth = 140
local cardHeight = 170
local colGap = 8
local rowGap = 8
local startX = 14 + cardWidth / 2
local startY = 6 + cardHeight / 2

local daysData = {
    { Day = 1, Name = "ITEM NAME!", State = "Claimed" },
    { Day = 2, Name = "ITEM NAME!", State = "Claim" },
    { Day = 3, Name = "ITEM NAME!", State = "Locked" },
    { Day = 4, Name = "ITEM NAME!", State = "Locked" },
    { Day = 5, Name = "ITEM NAME!", State = "Locked" },
    { Day = 6, Name = "ITEM NAME!", State = "Locked" },
}

for i, data in ipairs(daysData) do
    local col = (i - 1) % 3
    local row = math.floor((i - 1) / 3)
    local posX = startX + col * (cardWidth + colGap)
    local posY = startY + row * (cardHeight + rowGap)

    CheckUI.createRewardCard({
        Parent = contentArea,
        DayNumber = data.Day,
        ItemName = data.Name,
        IconAsset = Theme.Assets.PlayerIcon,
        State = data.State :: any,
        Size = UDim2.new(0, cardWidth, 0, cardHeight),
        Position = UDim2.new(0, posX, 0, posY),
        IsDay7 = false,
        ZIndex = 22,
    })
end

-- Day 7 Featured Card (Full height on right side)
local day7Width = 148
local day7Height = cardHeight * 2 + rowGap
local day7PosX = startX + 3 * (cardWidth + colGap) - (cardWidth - day7Width) / 2 + 2
local day7PosY = startY + (cardHeight + rowGap) / 2

local day7Card = CheckUI.createRewardCard({
    Parent = contentArea,
    DayNumber = 7,
    ItemName = "ITEM NAME!",
    IconAsset = Theme.Assets.CashIcon, -- Placeholder for special pet model
    State = "Locked",
    Size = UDim2.new(0, day7Width, 0, day7Height),
    Position = UDim2.new(0, day7PosX, 0, day7PosY),
    IsDay7 = true,
    ZIndex = 22,
})

-- Continuously rotate sunbursts while window is visible
local sunbursts: { ImageLabel } = {}
for _, desc in ipairs(dailyWindow:GetDescendants()) do
    if desc.Name == "Sunburst" and desc:IsA("ImageLabel") then
        table.insert(sunbursts, desc)
    end
end

RunService.RenderStepped:Connect(function(dt)
    if dailyWindow.Visible then
        local delta = 20 * dt
        for _, sb in ipairs(sunbursts) do
            sb.Rotation = (sb.Rotation + delta) % 360
        end
    end
end)

dailyWindow.Visible = true
return dailyWindow
