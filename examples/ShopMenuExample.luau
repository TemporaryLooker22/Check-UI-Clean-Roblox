
local StarterGui = game:GetService('StarterGui')
local CodesUI = StarterGui:FindFirstChild('CodesUI')
if not CodesUI then return 'CodesUI not found' end

local oldShop = CodesUI:FindFirstChild('ShopFrame')
if oldShop then oldShop:Destroy() end

local FADED_BURST_ID = 'rbxassetid://130563114903838'
local DAMIER_ID = 'rbxassetid://385956923'
local CASH_ICON_ID = 'rbxassetid://88694661500877'
local PLAYER_ICON_ID = 'rbxassetid://77589096360120'
local ROBUX_ICON_ID = 'rbxassetid://132185731364109'

----------------------------------------------------
-- COMPACT SHOP FRAME (600 x 415 - matches SettingsFrame height)
----------------------------------------------------
local ShopFrame = Instance.new('Frame')
ShopFrame.Name = 'ShopFrame'
ShopFrame.Size = UDim2.new(0, 600, 0, 415)
ShopFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
ShopFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ShopFrame.BackgroundColor3 = Color3.fromRGB(59, 88, 102) -- Slate blue
ShopFrame.BorderSizePixel = 0
ShopFrame.ZIndex = 20
ShopFrame.ClipsDescendants = true
ShopFrame.Visible = true

local shopCorner = Instance.new('UICorner')
shopCorner.CornerRadius = UDim.new(0, 4)
shopCorner.Parent = ShopFrame

local shopStroke = Instance.new('UIStroke')
shopStroke.Color = Color3.fromRGB(24, 30, 34)
shopStroke.Thickness = 3.5
shopStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
shopStroke.Parent = ShopFrame

local windowScale = Instance.new('UIScale')
windowScale.Name = 'WindowScale'
windowScale.Scale = 1
windowScale.Parent = ShopFrame

----------------------------------------------------
-- HEADER
----------------------------------------------------
local Header = Instance.new('Frame')
Header.Name = 'Header'
Header.Size = UDim2.new(1, 0, 0, 60)
Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Header.BorderSizePixel = 0
Header.ZIndex = 21
Header.ClipsDescendants = true
Header.Parent = ShopFrame

local headerGrad = Instance.new('UIGradient')
headerGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 20, 150)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(225, 0, 25))
}
headerGrad.Rotation = 90
headerGrad.Parent = Header

-- White top highlight line
local TopHighlight = Instance.new('Frame')
TopHighlight.Name = 'TopHighlight'
TopHighlight.Size = UDim2.new(1, 0, 0, 2)
TopHighlight.BackgroundColor3 = Color3.fromRGB(255, 200, 225)
TopHighlight.BackgroundTransparency = 0.3
TopHighlight.BorderSizePixel = 0
TopHighlight.ZIndex = 22
TopHighlight.Parent = Header

-- Checkerboard in Header
local HeaderDamier = Instance.new('ImageLabel')
HeaderDamier.Name = 'HeaderDamier'
HeaderDamier.Size = UDim2.new(1, 0, 1, 0)
HeaderDamier.BackgroundTransparency = 1
HeaderDamier.Image = DAMIER_ID
HeaderDamier.ScaleType = Enum.ScaleType.Tile
HeaderDamier.TileSize = UDim2.new(0, 26, 0, 26)
HeaderDamier.ImageColor3 = Color3.fromRGB(150, 0, 20)
HeaderDamier.ImageTransparency = 0.35
HeaderDamier.ZIndex = 22
HeaderDamier.Parent = Header

local damierGrad = Instance.new('UIGradient')
damierGrad.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.28, 0.65),
    NumberSequenceKeypoint.new(1, 0.05)
}
damierGrad.Rotation = 90
damierGrad.Parent = HeaderDamier

-- Bottom Divider
local DivDark = Instance.new('Frame')
DivDark.Name = 'DivDark'
DivDark.Size = UDim2.new(1, 0, 0, 3)
DivDark.Position = UDim2.new(0, 0, 1, -6)
DivDark.BackgroundColor3 = Color3.fromRGB(125, 0, 18)
DivDark.BorderSizePixel = 0
DivDark.ZIndex = 23
DivDark.Parent = Header

local DivBlack = Instance.new('Frame')
DivBlack.Name = 'DivBlack'
DivBlack.Size = UDim2.new(1, 0, 0, 3)
DivBlack.Position = UDim2.new(0, 0, 1, -3)
DivBlack.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DivBlack.BorderSizePixel = 0
DivBlack.ZIndex = 23
DivBlack.Parent = Header

-- Title 'Shop'
local Title = Instance.new('TextLabel')
Title.Name = 'Title'
Title.Text = 'Shop'
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 38
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Size = UDim2.new(0, 180, 0, 44)
Title.Position = UDim2.new(0, 18, 0.5, -2)
Title.AnchorPoint = Vector2.new(0, 0.5)
Title.BackgroundTransparency = 1
Title.ZIndex = 24
Title.Parent = Header

local titleStroke = Instance.new('UIStroke')
titleStroke.Color = Color3.fromRGB(0, 0, 0)
titleStroke.Thickness = 3.2
titleStroke.Parent = Title

-- Close Button [X]
local CloseBtn = Instance.new('ImageButton')
CloseBtn.Name = 'CloseButton'
CloseBtn.Size = UDim2.new(0, 38, 0, 38)
CloseBtn.Position = UDim2.new(1, -34, 0.5, -2)
CloseBtn.AnchorPoint = Vector2.new(0.5, 0.5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(115, 0, 16)
CloseBtn.BorderSizePixel = 0
CloseBtn.AutoButtonColor = false
CloseBtn.ClipsDescendants = false
CloseBtn.ZIndex = 25
CloseBtn.Parent = Header

local closeStroke = Instance.new('UIStroke')
closeStroke.Color = Color3.fromRGB(0, 0, 0)
closeStroke.Thickness = 2.8
closeStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
closeStroke.Parent = CloseBtn

local Face = Instance.new('Frame')
Face.Name = 'Face'
Face.Size = UDim2.new(1, 0, 1, -4)
Face.Position = UDim2.new(0, 0, 0, 0)
Face.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Face.BorderSizePixel = 0
Face.ZIndex = 26
Face.Parent = CloseBtn

local faceGrad = Instance.new('UIGradient')
faceGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 125, 175)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 20, 40))
}
faceGrad.Rotation = 90
faceGrad.Parent = Face

local InnerBorder = Instance.new('Frame')
InnerBorder.Name = 'InnerBorder'
InnerBorder.Size = UDim2.new(1, -2, 1, -2)
InnerBorder.Position = UDim2.new(0.5, 0, 0.5, 0)
InnerBorder.AnchorPoint = Vector2.new(0.5, 0.5)
InnerBorder.BackgroundTransparency = 1
InnerBorder.BorderSizePixel = 0
InnerBorder.ZIndex = 27
InnerBorder.Parent = Face

local innerStroke = Instance.new('UIStroke')
innerStroke.Color = Color3.fromRGB(255, 210, 235)
innerStroke.Thickness = 1.2
innerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
innerStroke.Parent = InnerBorder

local SepLine = Instance.new('Frame')
SepLine.Name = 'SepLine'
SepLine.Size = UDim2.new(1, 0, 0, 1)
SepLine.Position = UDim2.new(0, 0, 1, -4)
SepLine.BackgroundColor3 = Color3.fromRGB(70, 0, 10)
SepLine.BorderSizePixel = 0
SepLine.ZIndex = 27
SepLine.Parent = CloseBtn

local closeX = Instance.new('TextLabel')
closeX.Name = 'X'
closeX.Text = 'X'
closeX.Font = Enum.Font.GothamBlack
closeX.TextSize = 29
closeX.TextColor3 = Color3.fromRGB(255, 255, 255)
closeX.Size = UDim2.new(1, 0, 1, 0)
closeX.Position = UDim2.new(0.5, 0, 0.5, 0)
closeX.AnchorPoint = Vector2.new(0.5, 0.5)
closeX.BackgroundTransparency = 1
closeX.ZIndex = 28
closeX.Parent = Face

local xStroke = Instance.new('UIStroke')
xStroke.Color = Color3.fromRGB(0, 0, 0)
xStroke.Thickness = 3
xStroke.Parent = closeX

local closeScale = Instance.new('UIScale')
closeScale.Name = 'ButtonScale'
closeScale.Scale = 1
closeScale.Parent = CloseBtn

----------------------------------------------------
-- CONTENT SCROLL
----------------------------------------------------
local ContentScroll = Instance.new('ScrollingFrame')
ContentScroll.Name = 'ContentScroll'
ContentScroll.Size = UDim2.new(1, 0, 1, -60)
ContentScroll.Position = UDim2.new(0, 0, 0, 60)
ContentScroll.BackgroundTransparency = 1
ContentScroll.BorderSizePixel = 0
ContentScroll.ScrollBarThickness = 7
ContentScroll.ScrollBarImageColor3 = Color3.fromRGB(210, 225, 235)
ContentScroll.ScrollBarImageTransparency = 0.3
ContentScroll.CanvasSize = UDim2.new(0, 0, 0, 445)
ContentScroll.ScrollingDirection = Enum.ScrollingDirection.Y
ContentScroll.CanvasPosition = Vector2.new(0, 0)
ContentScroll.ZIndex = 21
ContentScroll.Parent = ShopFrame

----------------------------------------------------
-- HELPER: CREATE BUY BUTTON
----------------------------------------------------
local function createBuyButton(parent, btnName, price, size, pos, anchor, zBase)
    local btn = Instance.new('ImageButton')
    btn.Name = btnName
    btn.Size = size
    btn.Position = pos
    btn.AnchorPoint = anchor
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.AutoButtonColor = false
    btn.ClipsDescendants = true
    btn.ZIndex = zBase
    btn.Parent = parent

    local bCorner = Instance.new('UICorner')
    bCorner.CornerRadius = UDim.new(0, 2)
    bCorner.Parent = btn

    local bStroke = Instance.new('UIStroke')
    bStroke.Color = Color3.fromRGB(0, 0, 0)
    bStroke.Thickness = 2.4
    bStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    bStroke.Parent = btn

    local bGrad = Instance.new('UIGradient')
    bGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(235, 255, 30)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 215, 10))
    }
    bGrad.Rotation = 90
    bGrad.Parent = btn

    local bInner = Instance.new('Frame')
    bInner.Name = 'InnerHighlight'
    bInner.Size = UDim2.new(1, -4, 1, -4)
    bInner.Position = UDim2.new(0.5, 0, 0.5, 0)
    bInner.AnchorPoint = Vector2.new(0.5, 0.5)
    bInner.BackgroundTransparency = 1
    bInner.BorderSizePixel = 0
    bInner.ZIndex = zBase + 1
    bInner.Parent = btn

    local bInnerStroke = Instance.new('UIStroke')
    bInnerStroke.Color = Color3.fromRGB(235, 255, 130)
    bInnerStroke.Thickness = 1.2
    bInnerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    bInnerStroke.Parent = bInner

    -- Seamless full-height damier with smooth vertical gradient fade
    local bDamier = Instance.new('ImageLabel')
    bDamier.Name = 'Damier'
    bDamier.Size = UDim2.new(1, 0, 1, 0)
    bDamier.Position = UDim2.new(0, 0, 0, 0)
    bDamier.BackgroundTransparency = 1
    bDamier.Image = DAMIER_ID
    bDamier.ScaleType = Enum.ScaleType.Tile
    bDamier.TileSize = UDim2.new(0, 12, 0, 12)
    bDamier.ImageColor3 = Color3.fromRGB(0, 110, 0)
    bDamier.ZIndex = zBase + 1
    bDamier.Parent = btn

    local dGrad = Instance.new('UIGradient')
    dGrad.Rotation = 90
    dGrad.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.30, 0.82),
        NumberSequenceKeypoint.new(0.65, 0.35),
        NumberSequenceKeypoint.new(1, 0.10)
    }
    dGrad.Parent = bDamier

    local bBottom = Instance.new('Frame')
    bBottom.Size = UDim2.new(1, 0, 0, 3)
    bBottom.Position = UDim2.new(0, 0, 1, -3)
    bBottom.BackgroundColor3 = Color3.fromRGB(15, 120, 15)
    bBottom.BorderSizePixel = 0
    bBottom.ZIndex = zBase + 2
    bBottom.Parent = btn

    local robuxIcon = Instance.new('ImageLabel')
    robuxIcon.Name = 'RobuxIcon'
    robuxIcon.Size = UDim2.new(0, 24, 0, 24)
    robuxIcon.Position = UDim2.new(0, 7, 0.5, 0)
    robuxIcon.AnchorPoint = Vector2.new(0, 0.5)
    robuxIcon.BackgroundTransparency = 1
    robuxIcon.Image = ROBUX_ICON_ID
    robuxIcon.ScaleType = Enum.ScaleType.Fit
    robuxIcon.ZIndex = zBase + 3
    robuxIcon.Parent = btn

    local priceLabel = Instance.new('TextLabel')
    priceLabel.Name = 'Price'
    priceLabel.Text = tostring(price)
    priceLabel.Font = Enum.Font.GothamBlack
    priceLabel.TextSize = 22
    priceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    priceLabel.Position = UDim2.new(0, 35, 0.5, 0)
    priceLabel.AnchorPoint = Vector2.new(0, 0.5)
    priceLabel.Size = UDim2.new(1, -40, 1, 0)
    priceLabel.BackgroundTransparency = 1
    priceLabel.TextXAlignment = Enum.TextXAlignment.Center
    priceLabel.ZIndex = zBase + 3
    priceLabel.Parent = btn

    local pStroke = Instance.new('UIStroke')
    pStroke.Color = Color3.fromRGB(0, 0, 0)
    pStroke.Thickness = 2.6
    pStroke.Parent = priceLabel

    local bScale = Instance.new('UIScale')
    bScale.Name = 'ButtonScale'
    bScale.Scale = 1
    bScale.Parent = btn

    return btn
end

----------------------------------------------------
-- SECTION 1: ~Gamepass~
----------------------------------------------------
local gpTitle = Instance.new('TextLabel')
gpTitle.Name = 'GamepassHeader'
gpTitle.Text = '~Gamepass~'
gpTitle.Font = Enum.Font.GothamBlack
gpTitle.TextSize = 21
gpTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
gpTitle.Size = UDim2.new(1, 0, 0, 24)
gpTitle.Position = UDim2.new(0, 0, 0, 6)
gpTitle.BackgroundTransparency = 1
gpTitle.ZIndex = 22
gpTitle.Parent = ContentScroll

local gpStroke = Instance.new('UIStroke')
gpStroke.Color = Color3.fromRGB(0, 0, 0)
gpStroke.Thickness = 2.6
gpStroke.Parent = gpTitle

----------------------------------------------------
-- CARD: DOUBLE MONEY (276 x 155)
----------------------------------------------------
local DMC = Instance.new('Frame')
DMC.Name = 'DoubleMoneyCard'
DMC.Size = UDim2.new(0, 276, 0, 155)
DMC.Position = UDim2.new(0, 16, 0, 32)
DMC.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DMC.BorderSizePixel = 0
DMC.ClipsDescendants = true
DMC.ZIndex = 22
DMC.Parent = ContentScroll

local dmcStroke = Instance.new('UIStroke')
dmcStroke.Color = Color3.fromRGB(0, 0, 0)
dmcStroke.Thickness = 2.8
dmcStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
dmcStroke.Parent = DMC

local dmcInner = Instance.new('Frame')
dmcInner.Name = 'InnerBorder'
dmcInner.Size = UDim2.new(1, -6, 1, -6)
dmcInner.Position = UDim2.new(0.5, 0, 0.5, 0)
dmcInner.AnchorPoint = Vector2.new(0.5, 0.5)
dmcInner.BackgroundTransparency = 1
dmcInner.BorderSizePixel = 0
dmcInner.ZIndex = 23
dmcInner.Parent = DMC

local dmcInnerStroke = Instance.new('UIStroke')
dmcInnerStroke.Color = Color3.fromRGB(235, 160, 255)
dmcInnerStroke.Thickness = 1.4
dmcInnerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
dmcInnerStroke.Parent = dmcInner

local dmcGrad = Instance.new('UIGradient')
dmcGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(235, 60, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 0, 245))
}
dmcGrad.Rotation = 45
dmcGrad.Parent = DMC

local dmcDamier = Instance.new('ImageLabel')
dmcDamier.Name = 'Checkerboard'
dmcDamier.Size = UDim2.new(1, 0, 1, 0)
dmcDamier.BackgroundTransparency = 1
dmcDamier.Image = DAMIER_ID
dmcDamier.ScaleType = Enum.ScaleType.Tile
dmcDamier.TileSize = UDim2.new(0, 22, 0, 22)
dmcDamier.ImageColor3 = Color3.fromRGB(90, 0, 165)
dmcDamier.ImageTransparency = 0.35
dmcDamier.ZIndex = 23
dmcDamier.Parent = DMC

local dmcDamierGrad = Instance.new('UIGradient')
dmcDamierGrad.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.35, 0.60),
    NumberSequenceKeypoint.new(1, 0.05)
}
dmcDamierGrad.Rotation = 65
dmcDamierGrad.Parent = dmcDamier

local dmcBurst = Instance.new('ImageLabel')
dmcBurst.Name = 'Sunburst'
dmcBurst.Size = UDim2.new(0, 220, 0, 220)
dmcBurst.Position = UDim2.new(0, 68, 0.5, 12)
dmcBurst.AnchorPoint = Vector2.new(0.5, 0.5)
dmcBurst.BackgroundTransparency = 1
dmcBurst.Image = FADED_BURST_ID
dmcBurst.ImageColor3 = Color3.fromRGB(255, 255, 255)
dmcBurst.ImageTransparency = 0.12
dmcBurst.ZIndex = 24
dmcBurst.Parent = DMC

local dmcTitle = Instance.new('TextLabel')
dmcTitle.Name = 'Title'
dmcTitle.Text = 'Double Money'
dmcTitle.Font = Enum.Font.GothamBlack
dmcTitle.TextSize = 22
dmcTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
dmcTitle.Size = UDim2.new(1, -16, 0, 26)
dmcTitle.Position = UDim2.new(0.5, 0, 0, 8)
dmcTitle.AnchorPoint = Vector2.new(0.5, 0)
dmcTitle.BackgroundTransparency = 1
dmcTitle.ZIndex = 26
dmcTitle.Parent = DMC

local dmcTitleStroke = Instance.new('UIStroke')
dmcTitleStroke.Color = Color3.fromRGB(0, 0, 0)
dmcTitleStroke.Thickness = 2.8
dmcTitleStroke.Parent = dmcTitle

local dmcCash = Instance.new('ImageLabel')
dmcCash.Name = 'CashIcon'
dmcCash.Image = CASH_ICON_ID
dmcCash.ScaleType = Enum.ScaleType.Fit
dmcCash.Size = UDim2.new(0, 120, 0, 95)
dmcCash.Position = UDim2.new(0, 8, 0.5, 12)
dmcCash.AnchorPoint = Vector2.new(0, 0.5)
dmcCash.BackgroundTransparency = 1
dmcCash.ZIndex = 26
dmcCash.Parent = DMC

local dmcDesc = Instance.new('TextLabel')
dmcDesc.Name = 'Desc'
dmcDesc.Text = 'Get X2 Cash\n(permanent)'
dmcDesc.Font = Enum.Font.GothamBlack
dmcDesc.TextSize = 14
dmcDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
dmcDesc.Size = UDim2.new(0, 120, 0, 32)
dmcDesc.Position = UDim2.new(0.72, 0, 0.48, 0)
dmcDesc.AnchorPoint = Vector2.new(0.5, 0.5)
dmcDesc.BackgroundTransparency = 1
dmcDesc.ZIndex = 26
dmcDesc.Parent = DMC

local dmcDescStroke = Instance.new('UIStroke')
dmcDescStroke.Color = Color3.fromRGB(0, 0, 0)
dmcDescStroke.Thickness = 2.4
dmcDescStroke.Parent = dmcDesc

createBuyButton(DMC, 'DoubleMoneyBuy', 99, UDim2.new(0, 114, 0, 38), UDim2.new(0.72, 0, 0.78, 0), Vector2.new(0.5, 0.5), 26)

----------------------------------------------------
-- CARD: AUTO COLLECT (276 x 155)
----------------------------------------------------
local ACC = Instance.new('Frame')
ACC.Name = 'AutoCollectCard'
ACC.Size = UDim2.new(0, 276, 0, 155)
ACC.Position = UDim2.new(0, 308, 0, 32)
ACC.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ACC.BorderSizePixel = 0
ACC.ClipsDescendants = true
ACC.ZIndex = 22
ACC.Parent = ContentScroll

local accStroke = Instance.new('UIStroke')
accStroke.Color = Color3.fromRGB(0, 0, 0)
accStroke.Thickness = 2.8
accStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
accStroke.Parent = ACC

local accInner = Instance.new('Frame')
accInner.Name = 'InnerBorder'
accInner.Size = UDim2.new(1, -6, 1, -6)
accInner.Position = UDim2.new(0.5, 0, 0.5, 0)
accInner.AnchorPoint = Vector2.new(0.5, 0.5)
accInner.BackgroundTransparency = 1
accInner.BorderSizePixel = 0
accInner.ZIndex = 23
accInner.Parent = ACC

local accInnerStroke = Instance.new('UIStroke')
accInnerStroke.Color = Color3.fromRGB(165, 240, 255)
accInnerStroke.Thickness = 1.4
accInnerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
accInnerStroke.Parent = accInner

local accGrad = Instance.new('UIGradient')
accGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 235, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 120, 255))
}
accGrad.Rotation = 45
accGrad.Parent = ACC

local accDamier = Instance.new('ImageLabel')
accDamier.Name = 'Checkerboard'
accDamier.Size = UDim2.new(1, 0, 1, 0)
accDamier.BackgroundTransparency = 1
accDamier.Image = DAMIER_ID
accDamier.ScaleType = Enum.ScaleType.Tile
accDamier.TileSize = UDim2.new(0, 22, 0, 22)
accDamier.ImageColor3 = Color3.fromRGB(0, 65, 180)
accDamier.ImageTransparency = 0.35
accDamier.ZIndex = 23
accDamier.Parent = ACC

local accDamierGrad = Instance.new('UIGradient')
accDamierGrad.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.35, 0.60),
    NumberSequenceKeypoint.new(1, 0.05)
}
accDamierGrad.Rotation = 65
accDamierGrad.Parent = accDamier

local accBurst = Instance.new('ImageLabel')
accBurst.Name = 'Sunburst'
accBurst.Size = UDim2.new(0, 220, 0, 220)
accBurst.Position = UDim2.new(0, 68, 0.5, 12)
accBurst.AnchorPoint = Vector2.new(0.5, 0.5)
accBurst.BackgroundTransparency = 1
accBurst.Image = FADED_BURST_ID
accBurst.ImageColor3 = Color3.fromRGB(255, 255, 255)
accBurst.ImageTransparency = 0.12
accBurst.ZIndex = 24
accBurst.Parent = ACC

local accTitle = Instance.new('TextLabel')
accTitle.Name = 'Title'
accTitle.Text = 'Auto Collect'
accTitle.Font = Enum.Font.GothamBlack
accTitle.TextSize = 22
accTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
accTitle.Size = UDim2.new(1, -16, 0, 26)
accTitle.Position = UDim2.new(0.5, 0, 0, 8)
accTitle.AnchorPoint = Vector2.new(0.5, 0)
accTitle.BackgroundTransparency = 1
accTitle.ZIndex = 26
accTitle.Parent = ACC

local accTitleStroke = Instance.new('UIStroke')
accTitleStroke.Color = Color3.fromRGB(0, 0, 0)
accTitleStroke.Thickness = 2.8
accTitleStroke.Parent = accTitle

local accPlayer = Instance.new('ImageLabel')
accPlayer.Name = 'PlayerIcon'
accPlayer.Image = PLAYER_ICON_ID
accPlayer.ScaleType = Enum.ScaleType.Fit
accPlayer.Size = UDim2.new(0, 95, 0, 115)
accPlayer.Position = UDim2.new(0, 18, 0.5, 12)
accPlayer.AnchorPoint = Vector2.new(0, 0.5)
accPlayer.BackgroundTransparency = 1
accPlayer.ZIndex = 26
accPlayer.Parent = ACC

local accDesc = Instance.new('TextLabel')
accDesc.Name = 'Desc'
accDesc.Text = 'Auto\ncollect your\nmoney!'
accDesc.Font = Enum.Font.GothamBlack
accDesc.TextSize = 14
accDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
accDesc.Size = UDim2.new(0, 120, 0, 46)
accDesc.Position = UDim2.new(0.72, 0, 0.46, 0)
accDesc.AnchorPoint = Vector2.new(0.5, 0.5)
accDesc.BackgroundTransparency = 1
accDesc.ZIndex = 26
accDesc.Parent = ACC

local accDescStroke = Instance.new('UIStroke')
accDescStroke.Color = Color3.fromRGB(0, 0, 0)
accDescStroke.Thickness = 2.4
accDescStroke.Parent = accDesc

createBuyButton(ACC, 'AutoCollectBuy', 99, UDim2.new(0, 114, 0, 38), UDim2.new(0.72, 0, 0.78, 0), Vector2.new(0.5, 0.5), 26)

----------------------------------------------------
-- SECTION 2: ~Products~
----------------------------------------------------
local prTitle = Instance.new('TextLabel')
prTitle.Name = 'ProductsHeader'
prTitle.Text = '~Products~'
prTitle.Font = Enum.Font.GothamBlack
prTitle.TextSize = 21
prTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
prTitle.Size = UDim2.new(1, 0, 0, 24)
prTitle.Position = UDim2.new(0, 0, 0, 198)
prTitle.BackgroundTransparency = 1
prTitle.ZIndex = 22
prTitle.Parent = ContentScroll

local prStroke = Instance.new('UIStroke')
prStroke.Color = Color3.fromRGB(0, 0, 0)
prStroke.Thickness = 2.6
prStroke.Parent = prTitle

----------------------------------------------------
-- PRODUCTS CARDS (180 x 175)
----------------------------------------------------
local products = {
    { frameName = 'Product1k', buyName = 'Prod1kBuy', amount = '1,000', price = 19, xPos = 16 },
    { frameName = 'Product10k', buyName = 'Prod10kBuy', amount = '10,000', price = 99, xPos = 210 },
    { frameName = 'Product100k', buyName = 'Prod100kBuy', amount = '100,000', price = 399, xPos = 404 }
}

for i, prod in ipairs(products) do
    local PC = Instance.new('Frame')
    PC.Name = prod.frameName
    PC.Size = UDim2.new(0, 180, 0, 175)
    PC.Position = UDim2.new(0, prod.xPos, 0, 226)
    PC.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    PC.BorderSizePixel = 0
    PC.ClipsDescendants = true
    PC.ZIndex = 22
    PC.Parent = ContentScroll

    local pStroke = Instance.new('UIStroke')
    pStroke.Color = Color3.fromRGB(0, 0, 0)
    pStroke.Thickness = 2.8
    pStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    pStroke.Parent = PC

    local pInner = Instance.new('Frame')
    pInner.Name = 'InnerBorder'
    pInner.Size = UDim2.new(1, -6, 1, -6)
    pInner.Position = UDim2.new(0.5, 0, 0.5, 0)
    pInner.AnchorPoint = Vector2.new(0.5, 0.5)
    pInner.BackgroundTransparency = 1
    pInner.BorderSizePixel = 0
    pInner.ZIndex = 23
    pInner.Parent = PC

    local pInnerStroke = Instance.new('UIStroke')
    pInnerStroke.Color = Color3.fromRGB(245, 255, 180)
    pInnerStroke.Thickness = 1.4
    pInnerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    pInnerStroke.Parent = pInner

    local pGrad = Instance.new('UIGradient')
    pGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(235, 255, 50)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(110, 215, 0))
    }
    pGrad.Rotation = 45
    pGrad.Parent = PC

    local pDamier = Instance.new('ImageLabel')
    pDamier.Name = 'Checkerboard'
    pDamier.Size = UDim2.new(1, 0, 1, 0)
    pDamier.BackgroundTransparency = 1
    pDamier.Image = DAMIER_ID
    pDamier.ScaleType = Enum.ScaleType.Tile
    pDamier.TileSize = UDim2.new(0, 18, 0, 18)
    pDamier.ImageColor3 = Color3.fromRGB(70, 170, 0)
    pDamier.ImageTransparency = 0.40
    pDamier.ZIndex = 23
    pDamier.Parent = PC

    local pDamierGrad = Instance.new('UIGradient')
    pDamierGrad.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.35, 0.65),
        NumberSequenceKeypoint.new(1, 0.05)
    }
    pDamierGrad.Rotation = 90
    pDamierGrad.Parent = pDamier

    local pBurst = Instance.new('ImageLabel')
    pBurst.Name = 'Sunburst'
    pBurst.Size = UDim2.new(0, 190, 0, 190)
    pBurst.Position = UDim2.new(0.5, 0, 0.5, 0)
    pBurst.AnchorPoint = Vector2.new(0.5, 0.5)
    pBurst.BackgroundTransparency = 1
    pBurst.Image = FADED_BURST_ID
    pBurst.ImageColor3 = Color3.fromRGB(255, 255, 255)
    pBurst.ImageTransparency = 0.12
    pBurst.ZIndex = 24
    pBurst.Parent = PC

    local aTitle = Instance.new('TextLabel')
    aTitle.Name = 'AmountTitle'
    aTitle.Text = prod.amount
    aTitle.Font = Enum.Font.GothamBlack
    aTitle.TextSize = 22
    aTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    aTitle.Size = UDim2.new(1, -10, 0, 26)
    aTitle.Position = UDim2.new(0.5, 0, 0, 8)
    aTitle.AnchorPoint = Vector2.new(0.5, 0)
    aTitle.BackgroundTransparency = 1
    aTitle.ZIndex = 26
    aTitle.Parent = PC

    local aStroke = Instance.new('UIStroke')
    aStroke.Color = Color3.fromRGB(0, 0, 0)
    aStroke.Thickness = 2.8
    aStroke.Parent = aTitle

    local cIcon = Instance.new('ImageLabel')
    cIcon.Name = 'CashIcon'
    cIcon.Image = CASH_ICON_ID
    cIcon.ScaleType = Enum.ScaleType.Fit
    cIcon.Size = UDim2.new(0, 110, 0, 85)
    cIcon.Position = UDim2.new(0.5, 0, 0.5, -4)
    cIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    cIcon.BackgroundTransparency = 1
    cIcon.ZIndex = 26
    cIcon.Parent = PC

    createBuyButton(PC, prod.buyName, prod.price, UDim2.new(0, 108, 0, 34), UDim2.new(0.5, 0, 1, -24), Vector2.new(0.5, 0.5), 26)
end

ShopFrame.Parent = CodesUI
return 'ShopFrame rebuilt with compact 600x415 size!'
