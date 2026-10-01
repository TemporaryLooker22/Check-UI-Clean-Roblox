--!strict
-- CheckUIComponents.luau
-- Production-ready constructor methods for all Check-UI components.

local Theme = require(script.Parent.CheckUITheme)

local CheckUIComponents = {}

----------------------------------------------------
-- 1. MODAL WINDOW
----------------------------------------------------
function CheckUIComponents.createWindow(props: {
    Name: string,
    Size: UDim2,
    Parent: Instance,
    ZIndex: number?,
})
    local window = Instance.new("Frame")
    window.Name = props.Name
    window.Size = props.Size
    window.Position = UDim2.new(0.5, 0, 0.5, 0)
    window.AnchorPoint = Vector2.new(0.5, 0.5)
    window.BackgroundColor3 = Theme.Colors.Canvas
    window.BorderSizePixel = 0
    window.ClipsDescendants = true
    window.ZIndex = props.ZIndex or 20
    window.Visible = false
    window.Parent = props.Parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = window

    local stroke = Instance.new("UIStroke")
    stroke.Name = "OuterStroke"
    stroke.Color = Theme.Colors.CanvasBorder
    stroke.Thickness = 3.5
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = window

    local windowScale = Instance.new("UIScale")
    windowScale.Name = "WindowScale"
    windowScale.Scale = 1
    windowScale.Parent = window

    return window
end

----------------------------------------------------
-- 2. 3D BEVELED SQUARE CLOSE BUTTON [X]
----------------------------------------------------
function CheckUIComponents.createCloseButton(header: Instance)
    local old = header:FindFirstChild("CloseButton")
    if old then old:Destroy() end

    local btn = Instance.new("ImageButton")
    btn.Name = "CloseButton"
    btn.Size = UDim2.new(0, 38, 0, 38)
    btn.Position = UDim2.new(1, -34, 0.5, -2)
    btn.AnchorPoint = Vector2.new(0.5, 0.5)
    btn.BackgroundColor3 = Theme.Colors.CloseBase
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.ClipsDescendants = false
    btn.ZIndex = (header.ZIndex or 21) + 4
    btn.Parent = header

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 0, 0)
    stroke.Thickness = 2.8
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = btn

    local face = Instance.new("Frame")
    face.Name = "Face"
    face.Size = UDim2.new(1, 0, 1, -4)
    face.Position = UDim2.new(0, 0, 0, 0)
    face.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    face.BorderSizePixel = 0
    face.ZIndex = btn.ZIndex + 1
    face.Parent = btn

    local faceGrad = Instance.new("UIGradient")
    faceGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 125, 175)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 20, 40))
    }
    faceGrad.Rotation = 90
    faceGrad.Parent = face

    local innerBorder = Instance.new("Frame")
    innerBorder.Name = "InnerBorder"
    innerBorder.Size = UDim2.new(1, -2, 1, -2)
    innerBorder.Position = UDim2.new(0.5, 0, 0.5, 0)
    innerBorder.AnchorPoint = Vector2.new(0.5, 0.5)
    innerBorder.BackgroundTransparency = 1
    innerBorder.BorderSizePixel = 0
    innerBorder.ZIndex = face.ZIndex + 1
    innerBorder.Parent = face

    local innerStroke = Instance.new("UIStroke")
    innerStroke.Color = Theme.Colors.CloseHighlight
    innerStroke.Thickness = 1.2
    innerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    innerStroke.Parent = innerBorder

    local sepLine = Instance.new("Frame")
    sepLine.Name = "SepLine"
    sepLine.Size = UDim2.new(1, 0, 0, 1)
    sepLine.Position = UDim2.new(0, 0, 1, -4)
    sepLine.BackgroundColor3 = Theme.Colors.CloseSepLine
    sepLine.BorderSizePixel = 0
    sepLine.ZIndex = face.ZIndex + 1
    sepLine.Parent = btn

    local closeX = Instance.new("TextLabel")
    closeX.Name = "X"
    closeX.Text = "X"
    closeX.Font = Theme.Typography.Font
    closeX.TextSize = Theme.Typography.CloseXSize
    closeX.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeX.Size = UDim2.new(1, 0, 1, 0)
    closeX.Position = UDim2.new(0.5, 0, 0.5, 0)
    closeX.AnchorPoint = Vector2.new(0.5, 0.5)
    closeX.BackgroundTransparency = 1
    closeX.ZIndex = face.ZIndex + 2
    closeX.Parent = face

    local xStroke = Instance.new("UIStroke")
    xStroke.Color = Color3.fromRGB(0, 0, 0)
    xStroke.Thickness = Theme.Typography.CloseXStrokeSize
    xStroke.Parent = closeX

    local buttonScale = Instance.new("UIScale")
    buttonScale.Name = "ButtonScale"
    buttonScale.Scale = 1
    buttonScale.Parent = btn

    return btn
end

----------------------------------------------------
-- 3. WINDOW HEADER WITH 2-TIER SHADOW DIVIDER
----------------------------------------------------
function CheckUIComponents.createHeader(window: Instance, titleText: string, theme: any)
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 60)
    header.Position = UDim2.new(0, 0, 0, 0)
    header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    header.BorderSizePixel = 0
    header.ClipsDescendants = true
    header.ZIndex = (window.ZIndex or 20) + 1
    header.Parent = window

    local grad = Instance.new("UIGradient")
    grad.Name = "HeaderGradient"
    grad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, theme.Top),
        ColorSequenceKeypoint.new(1, theme.Bottom)
    }
    grad.Rotation = 90
    grad.Parent = header

    -- White top highlight line
    local topHighlight = Instance.new("Frame")
    topHighlight.Name = "TopHighlight"
    topHighlight.Size = UDim2.new(1, 0, 0, 2)
    topHighlight.Position = UDim2.new(0, 0, 0, 0)
    topHighlight.BackgroundColor3 = theme.TopHighlight
    topHighlight.BackgroundTransparency = 0.25
    topHighlight.BorderSizePixel = 0
    topHighlight.ZIndex = header.ZIndex + 1
    topHighlight.Parent = header

    -- Fading Damier
    local damier = Instance.new("ImageLabel")
    damier.Name = "Checkerboard"
    damier.Size = UDim2.new(1, 0, 1, 0)
    damier.Position = UDim2.new(0, 0, 0, 0)
    damier.BackgroundTransparency = 1
    damier.Image = Theme.Assets.Checkerboard
    damier.ScaleType = Enum.ScaleType.Tile
    damier.TileSize = UDim2.new(0, 26, 0, 26)
    damier.ImageColor3 = theme.DamierColor
    damier.ImageTransparency = 0.35
    damier.ZIndex = header.ZIndex + 1
    damier.Parent = header

    local damierGrad = Instance.new("UIGradient")
    damierGrad.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 1.00),
        NumberSequenceKeypoint.new(0.28, 0.65),
        NumberSequenceKeypoint.new(1.00, 0.05)
    }
    damierGrad.Rotation = 90
    damierGrad.Parent = damier

    -- 2-Tier 3D Shadow Divider Bar
    local divDark = Instance.new("Frame")
    divDark.Name = "DivDark"
    divDark.Size = UDim2.new(1, 0, 0, 3)
    divDark.Position = UDim2.new(0, 0, 1, -6)
    divDark.BackgroundColor3 = theme.DivDark
    divDark.BorderSizePixel = 0
    divDark.ZIndex = header.ZIndex + 2
    divDark.Parent = header

    local divBlack = Instance.new("Frame")
    divBlack.Name = "DivBlack"
    divBlack.Size = UDim2.new(1, 0, 0, 3)
    divBlack.Position = UDim2.new(0, 0, 1, -3)
    divBlack.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    divBlack.BorderSizePixel = 0
    divBlack.ZIndex = header.ZIndex + 2
    divBlack.Parent = header

    -- Title
    local title = Instance.new("TextLabel")
    title.Name = "TitleLabel"
    title.Text = titleText
    title.Font = Theme.Typography.Font
    title.TextSize = Theme.Typography.HeaderTitleSize
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Size = UDim2.new(0, 220, 0, 44)
    title.Position = UDim2.new(0, 18, 0.5, -2)
    title.AnchorPoint = Vector2.new(0, 0.5)
    title.BackgroundTransparency = 1
    title.ZIndex = header.ZIndex + 3
    title.Parent = header

    local tStroke = Instance.new("UIStroke")
    tStroke.Color = Color3.fromRGB(0, 0, 0)
    tStroke.Thickness = Theme.Typography.HeaderStrokeSize
    tStroke.Parent = title

    -- Attach Close Button
    CheckUIComponents.createCloseButton(header)

    return header
end

----------------------------------------------------
-- 4. 3D BEVELED ACTION BUTTON
----------------------------------------------------
function CheckUIComponents.create3DButton(props: {
    Name: string,
    Size: UDim2,
    Position: UDim2,
    AnchorPoint: Vector2?,
    Parent: Instance,
    Text: string,
    TextSize: number?,
    Gradient: ColorSequence?,
    BevelColor: Color3?,
    HighlightColor: Color3?,
    DamierColor: Color3?,
    ZIndex: number?,
})
    local btn = Instance.new("ImageButton")
    btn.Name = props.Name
    btn.Size = props.Size
    btn.Position = props.Position
    btn.AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0.5)
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.ClipsDescendants = true
    btn.ZIndex = props.ZIndex or 25
    btn.Parent = props.Parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Name = "OuterStroke"
    stroke.Color = Color3.fromRGB(0, 0, 0)
    stroke.Thickness = 2.8
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = btn

    local grad = Instance.new("UIGradient")
    grad.Name = "ButtonGradient"
    grad.Color = props.Gradient or ColorSequence.new{
        ColorSequenceKeypoint.new(0, Theme.Colors.GreenGradientTop),
        ColorSequenceKeypoint.new(1, Theme.Colors.GreenGradientBottom)
    }
    grad.Rotation = 90
    grad.Parent = btn

    -- 3D Bevel Frame (Bottom Extrusion)
    local bevel = Instance.new("Frame")
    bevel.Name = "Frame"
    bevel.Size = UDim2.new(1, 0, 0, 3)
    bevel.Position = UDim2.new(0, 0, 1, -3)
    bevel.BackgroundColor3 = props.BevelColor or Theme.Colors.GreenBevel
    bevel.BorderSizePixel = 0
    bevel.ZIndex = btn.ZIndex + 1
    bevel.Parent = btn

    -- Inner Highlight Stroke
    local innerHighlight = Instance.new("Frame")
    innerHighlight.Name = "InnerHighlight"
    innerHighlight.Size = UDim2.new(1, -4, 1, -4)
    innerHighlight.Position = UDim2.new(0.5, 0, 0.5, 0)
    innerHighlight.AnchorPoint = Vector2.new(0.5, 0.5)
    innerHighlight.BackgroundTransparency = 1
    innerHighlight.BorderSizePixel = 0
    innerHighlight.ZIndex = btn.ZIndex + 2
    innerHighlight.Parent = btn

    local innerStroke = Instance.new("UIStroke")
    innerStroke.Name = "InnerStroke"
    innerStroke.Color = props.HighlightColor or Theme.Colors.GreenHighlight
    innerStroke.Thickness = 1.2
    innerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    innerStroke.Parent = innerHighlight

    -- Seamless Fading Damier
    local damier = Instance.new("ImageLabel")
    damier.Name = "Checkerboard"
    damier.Size = UDim2.new(1, 0, 1, 0)
    damier.Position = UDim2.new(0, 0, 0, 0)
    damier.BackgroundTransparency = 1
    damier.Image = Theme.Assets.Checkerboard
    damier.ScaleType = Enum.ScaleType.Tile
    damier.TileSize = UDim2.new(0, 18, 0, 18)
    damier.ImageColor3 = props.DamierColor or Theme.Colors.GreenDamier
    damier.ImageTransparency = 0.3
    damier.ZIndex = btn.ZIndex + 1
    damier.Parent = btn

    local damierGrad = Instance.new("UIGradient")
    damierGrad.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 1.00),
        NumberSequenceKeypoint.new(0.30, 0.82),
        NumberSequenceKeypoint.new(0.70, 0.35),
        NumberSequenceKeypoint.new(1.00, 0.10)
    }
    damierGrad.Rotation = 90
    damierGrad.Parent = damier

    -- Label
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Text = props.Text
    label.Font = Theme.Typography.Font
    label.TextSize = props.TextSize or Theme.Typography.ButtonLabelSize
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.ZIndex = btn.ZIndex + 3
    label.Parent = btn

    local lStroke = Instance.new("UIStroke")
    lStroke.Color = Color3.fromRGB(0, 0, 0)
    lStroke.Thickness = Theme.Typography.ButtonStrokeSize
    lStroke.Parent = label

    local bScale = Instance.new("UIScale")
    bScale.Name = "ButtonScale"
    bScale.Scale = 1
    bScale.Parent = btn

    return btn
end

----------------------------------------------------
-- 5. RECESSED CONTENT CARD / CONTAINER
----------------------------------------------------
function CheckUIComponents.createCardContainer(props: {
    Name: string,
    Size: UDim2,
    Position: UDim2,
    AnchorPoint: Vector2?,
    Parent: Instance,
    ZIndex: number?,
})
    local card = Instance.new("Frame")
    card.Name = props.Name
    card.Size = props.Size
    card.Position = props.Position
    card.AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0)
    card.BackgroundColor3 = Theme.Colors.CardBackground
    card.BorderSizePixel = 0
    card.ClipsDescendants = true
    card.ZIndex = props.ZIndex or 22
    card.Parent = props.Parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = card

    local stroke = Instance.new("UIStroke")
    stroke.Name = "BorderStroke"
    stroke.Color = Theme.Colors.CardBorder
    stroke.Thickness = 2.8
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = card

    local inner = Instance.new("Frame")
    inner.Name = "InnerHighlight"
    inner.Size = UDim2.new(1, -4, 1, -4)
    inner.Position = UDim2.new(0.5, 0, 0.5, 0)
    inner.AnchorPoint = Vector2.new(0.5, 0.5)
    inner.BackgroundTransparency = 1
    inner.BorderSizePixel = 0
    inner.ZIndex = card.ZIndex + 1
    inner.Parent = card

    local innerStroke = Instance.new("UIStroke")
    innerStroke.Color = Theme.Colors.CardHighlight
    innerStroke.Transparency = 0.4
    innerStroke.Thickness = 1.2
    innerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    innerStroke.Parent = inner

    local damier = Instance.new("ImageLabel")
    damier.Name = "Checkerboard"
    damier.Size = UDim2.new(1, 0, 1, 0)
    damier.Position = UDim2.new(0, 0, 0, 0)
    damier.BackgroundTransparency = 1
    damier.Image = Theme.Assets.Checkerboard
    damier.ScaleType = Enum.ScaleType.Tile
    damier.TileSize = UDim2.new(0, 22, 0, 22)
    damier.ImageColor3 = Color3.fromRGB(15, 28, 34)
    damier.ImageTransparency = 0.45
    damier.ZIndex = card.ZIndex + 1
    damier.Parent = card

    return card
end

return CheckUIComponents
