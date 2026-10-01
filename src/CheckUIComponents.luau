--!strict
-- CheckUIComponents.luau
-- Production-ready constructor methods for all Check-UI components.
-- Expanded in v1.2.0 to support all 5 canonical simulator menus:
-- Shop, Codes, Rebirth, Settings, and Daily Rewards.

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
        ColorSequenceKeypoint.new(0, Theme.Colors.CloseFaceTop),
        ColorSequenceKeypoint.new(1, Theme.Colors.CloseFaceBottom)
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
    title.Size = UDim2.new(0, 280, 0, 44)
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
-- 4. HEADER ACTION BUTTON (E.G. "SKIP" IN REBIRTH)
----------------------------------------------------
function CheckUIComponents.createHeaderButton(header: Instance, text: string, props: {
    Width: number?,
    Height: number?,
    GradientTop: Color3?,
    GradientBottom: Color3?,
    BevelColor: Color3?,
    HighlightColor: Color3?,
    DamierColor: Color3?,
    OffsetRight: number?,
}?)
    props = props or {}
    local width = props.Width or 84
    local height = props.Height or 38
    local offsetRight = props.OffsetRight or -82 -- Sits immediately left of [X] close button (-34 - 38/2 - 10 - width/2)

    local btn = Instance.new("ImageButton")
    btn.Name = text .. "Button"
    btn.Size = UDim2.new(0, width, 0, height)
    btn.Position = UDim2.new(1, offsetRight, 0.5, -2)
    btn.AnchorPoint = Vector2.new(0.5, 0.5)
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.ClipsDescendants = true
    btn.ZIndex = (header.ZIndex or 21) + 4
    btn.Parent = header

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 0, 0)
    stroke.Thickness = 2.8
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = btn

    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, props.GradientTop or Theme.Colors.SkipGradientTop),
        ColorSequenceKeypoint.new(1, props.GradientBottom or Theme.Colors.SkipGradientBottom)
    }
    grad.Rotation = 90
    grad.Parent = btn

    -- 3D Bevel Frame at bottom
    local bevel = Instance.new("Frame")
    bevel.Name = "Bevel"
    bevel.Size = UDim2.new(1, 0, 0, 3)
    bevel.Position = UDim2.new(0, 0, 1, -3)
    bevel.BackgroundColor3 = props.BevelColor or Theme.Colors.SkipBevel
    bevel.BorderSizePixel = 0
    bevel.ZIndex = btn.ZIndex + 1
    bevel.Parent = btn

    -- Inner Pastel Highlight
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
    innerStroke.Color = props.HighlightColor or Theme.Colors.SkipHighlight
    innerStroke.Thickness = 1.2
    innerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    innerStroke.Parent = innerHighlight

    -- Damier texture
    local damier = Instance.new("ImageLabel")
    damier.Name = "Checkerboard"
    damier.Size = UDim2.new(1, 0, 1, 0)
    damier.Position = UDim2.new(0, 0, 0, 0)
    damier.BackgroundTransparency = 1
    damier.Image = Theme.Assets.Checkerboard
    damier.ScaleType = Enum.ScaleType.Tile
    damier.TileSize = UDim2.new(0, 16, 0, 16)
    damier.ImageColor3 = props.DamierColor or Theme.Colors.SkipDamier
    damier.ImageTransparency = 0.35
    damier.ZIndex = btn.ZIndex + 1
    damier.Parent = btn

    local damierGrad = Instance.new("UIGradient")
    damierGrad.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 1.00),
        NumberSequenceKeypoint.new(0.30, 0.80),
        NumberSequenceKeypoint.new(0.70, 0.35),
        NumberSequenceKeypoint.new(1.00, 0.10)
    }
    damierGrad.Rotation = 90
    damierGrad.Parent = damier

    -- Label
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Text = text
    label.Font = Theme.Typography.Font
    label.TextSize = 24
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.ZIndex = btn.ZIndex + 3
    label.Parent = btn

    local lStroke = Instance.new("UIStroke")
    lStroke.Color = Color3.fromRGB(0, 0, 0)
    lStroke.Thickness = 2.8
    lStroke.Parent = label

    local bScale = Instance.new("UIScale")
    bScale.Name = "ButtonScale"
    bScale.Scale = 1
    bScale.Parent = btn

    return btn
end

----------------------------------------------------
-- 5. 3D BEVELED ACTION BUTTON (GENERIC)
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
        ColorSequenceKeypoint.new(0, Theme.Colors.ClaimGradientTop),
        ColorSequenceKeypoint.new(1, Theme.Colors.ClaimGradientBottom)
    }
    grad.Rotation = 90
    grad.Parent = btn

    -- 3D Bevel Frame at bottom
    local bevel = Instance.new("Frame")
    bevel.Name = "Frame"
    bevel.Size = UDim2.new(1, 0, 0, 3)
    bevel.Position = UDim2.new(0, 0, 1, -3)
    bevel.BackgroundColor3 = props.BevelColor or Theme.Colors.ClaimBevel
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
    innerStroke.Color = props.HighlightColor or Theme.Colors.ClaimHighlight
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
    damier.ImageColor3 = props.DamierColor or Theme.Colors.ClaimDamier
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
-- 6. STATE BUTTON BUILDER (CLAIM / CLAIMED / LOCKED)
----------------------------------------------------
function CheckUIComponents.createStateButton(props: {
    State: "Claim" | "Claimed" | "Locked",
    Size: UDim2,
    Position: UDim2,
    AnchorPoint: Vector2?,
    Parent: Instance,
    CustomText: string?,
    ZIndex: number?,
})
    local state = props.State
    local text = props.CustomText or string.upper(state)
    
    local gradSeq: ColorSequence
    local bevelColor: Color3
    local highlightColor: Color3
    local damierColor: Color3

    if state == "Claim" then
        gradSeq = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Theme.Colors.ClaimGradientTop),
            ColorSequenceKeypoint.new(1, Theme.Colors.ClaimGradientBottom)
        }
        bevelColor = Theme.Colors.ClaimBevel
        highlightColor = Theme.Colors.ClaimHighlight
        damierColor = Theme.Colors.ClaimDamier
    elseif state == "Claimed" then
        gradSeq = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Theme.Colors.ClaimedGradientTop),
            ColorSequenceKeypoint.new(1, Theme.Colors.ClaimedGradientBottom)
        }
        bevelColor = Theme.Colors.ClaimedBevel
        highlightColor = Theme.Colors.ClaimedHighlight
        damierColor = Theme.Colors.ClaimedDamier
    else -- Locked
        gradSeq = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Theme.Colors.LockedGradientTop),
            ColorSequenceKeypoint.new(1, Theme.Colors.LockedGradientBottom)
        }
        bevelColor = Theme.Colors.LockedBevel
        highlightColor = Theme.Colors.LockedHighlight
        damierColor = Theme.Colors.LockedDamier
    end

    return CheckUIComponents.create3DButton({
        Name = state .. "Button",
        Size = props.Size,
        Position = props.Position,
        AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0.5),
        Parent = props.Parent,
        Text = text,
        TextSize = 20,
        Gradient = gradSeq,
        BevelColor = bevelColor,
        HighlightColor = highlightColor,
        DamierColor = damierColor,
        ZIndex = props.ZIndex,
    })
end

----------------------------------------------------
-- 7. SECTION HEADER WITH TILDE (~Gamepass~)
----------------------------------------------------
function CheckUIComponents.createSectionHeader(parent: Instance, text: string, position: UDim2)
    local label = Instance.new("TextLabel")
    label.Name = "SectionHeader"
    label.Text = text
    label.Font = Theme.Typography.Font
    label.TextSize = Theme.Typography.SectionHeaderSize
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Size = UDim2.new(1, 0, 0, 28)
    label.Position = position
    label.AnchorPoint = Vector2.new(0.5, 0.5)
    label.BackgroundTransparency = 1
    label.ZIndex = (parent.ZIndex or 20) + 1
    label.Parent = parent

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 0, 0)
    stroke.Thickness = Theme.Typography.SectionHeaderStrokeSize
    stroke.Parent = label

    return label
end

----------------------------------------------------
-- 8. RECESSED CONTENT CARD / CONTAINER
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

----------------------------------------------------
-- 9. PROGRESSION BAR (REBIRTH & QUEST METERS)
----------------------------------------------------
function CheckUIComponents.createProgressBar(props: {
    Size: UDim2,
    Position: UDim2,
    AnchorPoint: Vector2?,
    Parent: Instance,
    Progress: number, -- Between 0 and 1
    Text: string?,
    ZIndex: number?,
})
    local zIndex = props.ZIndex or 24

    -- Trough (Recessed Dark Container)
    local trough = Instance.new("Frame")
    trough.Name = "ProgressTrough"
    trough.Size = props.Size
    trough.Position = props.Position
    trough.AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0.5)
    trough.BackgroundColor3 = Theme.Colors.ProgressTrough
    trough.BorderSizePixel = 0
    trough.ClipsDescendants = true
    trough.ZIndex = zIndex
    trough.Parent = props.Parent

    local tStroke = Instance.new("UIStroke")
    tStroke.Color = Theme.Colors.ProgressBorder
    tStroke.Thickness = 2.0
    tStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    tStroke.Parent = trough

    -- Fill Bar (Orange to Gold gradient)
    local fill = Instance.new("Frame")
    fill.Name = "ProgressFill"
    local pct = math.clamp(props.Progress, 0, 1)
    fill.Size = UDim2.new(pct, 0, 1, 0)
    fill.Position = UDim2.new(0, 0, 0, 0)
    fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    fill.BorderSizePixel = 0
    fill.ZIndex = zIndex + 1
    fill.Parent = trough

    local fillGrad = Instance.new("UIGradient")
    fillGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Theme.Colors.ProgressGradientTop),
        ColorSequenceKeypoint.new(1, Theme.Colors.ProgressGradientBottom)
    }
    fillGrad.Rotation = 90
    fillGrad.Parent = fill

    -- Subtle 2px bottom bevel inside fill
    local bevel = Instance.new("Frame")
    bevel.Name = "FillBevel"
    bevel.Size = UDim2.new(1, 0, 0, 2)
    bevel.Position = UDim2.new(0, 0, 1, -2)
    bevel.BackgroundColor3 = Theme.Colors.ProgressBevel
    bevel.BorderSizePixel = 0
    bevel.ZIndex = zIndex + 2
    bevel.Parent = fill

    -- Center Label (e.g. "58% Completed")
    local labelText = props.Text or (string.format("%d%% Completed", math.floor(pct * 100)))
    local label = Instance.new("TextLabel")
    label.Name = "ProgressLabel"
    label.Text = labelText
    label.Font = Theme.Typography.Font
    label.TextSize = Theme.Typography.ProgressTextSize
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Position = UDim2.new(0.5, 0, 0.5, 0)
    label.AnchorPoint = Vector2.new(0.5, 0.5)
    label.BackgroundTransparency = 1
    label.ZIndex = zIndex + 3
    label.Parent = trough

    local lStroke = Instance.new("UIStroke")
    lStroke.Color = Color3.fromRGB(0, 0, 0)
    lStroke.Thickness = Theme.Typography.ProgressStrokeSize
    lStroke.Parent = label

    return trough
end

----------------------------------------------------
-- 10. REBIRTH COMPARISON FLOW (TIER 1 -> TIER 2)
----------------------------------------------------
function CheckUIComponents.createComparisonFlow(props: {
    Size: UDim2,
    Position: UDim2,
    AnchorPoint: Vector2?,
    Parent: Instance,
    LeftTitle: string,
    LeftValue: string,
    RightTitle: string,
    RightValue: string,
    ZIndex: number?,
})
    local zIndex = props.ZIndex or 22
    local container = Instance.new("Frame")
    container.Name = "ComparisonContainer"
    container.Size = props.Size
    container.Position = props.Position
    container.AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0.5)
    container.BackgroundTransparency = 1
    container.ZIndex = zIndex
    container.Parent = props.Parent

    local cardWidth = 0.44

    local function buildTierCard(name: string, posX: number, title: string, value: string)
        local card = Instance.new("Frame")
        card.Name = name
        card.Size = UDim2.new(cardWidth, 0, 1, 0)
        card.Position = UDim2.new(posX, 0, 0.5, 0)
        card.AnchorPoint = Vector2.new(0.5, 0.5)
        card.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        card.BorderSizePixel = 0
        card.ClipsDescendants = true
        card.ZIndex = zIndex + 1
        card.Parent = container

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 4)
        corner.Parent = card

        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(0, 0, 0)
        stroke.Thickness = 2.8
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = card

        local grad = Instance.new("UIGradient")
        grad.Color = Theme.CardGradients.Lime
        grad.Rotation = 90
        grad.Parent = card

        local damier = Instance.new("ImageLabel")
        damier.Name = "Checkerboard"
        damier.Size = UDim2.new(1, 0, 1, 0)
        damier.Position = UDim2.new(0, 0, 0, 0)
        damier.BackgroundTransparency = 1
        damier.Image = Theme.Assets.Checkerboard
        damier.ScaleType = Enum.ScaleType.Tile
        damier.TileSize = UDim2.new(0, 16, 0, 16)
        damier.ImageColor3 = Color3.fromRGB(40, 160, 20)
        damier.ImageTransparency = 0.35
        damier.ZIndex = zIndex + 2
        damier.Parent = card

        local tLabel = Instance.new("TextLabel")
        tLabel.Name = "Title"
        tLabel.Text = title
        tLabel.Font = Theme.Typography.Font
        tLabel.TextSize = 18
        tLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        tLabel.Size = UDim2.new(1, 0, 0, 20)
        tLabel.Position = UDim2.new(0.5, 0, 0.28, 0)
        tLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        tLabel.BackgroundTransparency = 1
        tLabel.ZIndex = zIndex + 3
        tLabel.Parent = card

        local tStroke = Instance.new("UIStroke")
        tStroke.Color = Color3.fromRGB(0, 0, 0)
        tStroke.Thickness = 2.2
        tStroke.Parent = tLabel

        local vLabel = Instance.new("TextLabel")
        vLabel.Name = "Value"
        vLabel.Text = value
        vLabel.Font = Theme.Typography.Font
        vLabel.TextSize = 26
        vLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        vLabel.Size = UDim2.new(1, 0, 0, 30)
        vLabel.Position = UDim2.new(0.5, 0, 0.70, 0)
        vLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        vLabel.BackgroundTransparency = 1
        vLabel.ZIndex = zIndex + 3
        vLabel.Parent = card

        local vStroke = Instance.new("UIStroke")
        vStroke.Color = Color3.fromRGB(0, 0, 0)
        vStroke.Thickness = 2.8
        vStroke.Parent = vLabel

        return card
    end

    buildTierCard("LeftTier", cardWidth / 2, props.LeftTitle, props.LeftValue)
    buildTierCard("RightTier", 1 - cardWidth / 2, props.RightTitle, props.RightValue)

    -- Middle 3D Arrow (white with black border)
    local arrow = Instance.new("TextLabel")
    arrow.Name = "Arrow"
    arrow.Text = "➡"
    arrow.Font = Theme.Typography.Font
    arrow.TextSize = 34
    arrow.TextColor3 = Color3.fromRGB(235, 245, 255)
    arrow.Size = UDim2.new(0, 40, 0, 40)
    arrow.Position = UDim2.new(0.5, 0, 0.5, 0)
    arrow.AnchorPoint = Vector2.new(0.5, 0.5)
    arrow.BackgroundTransparency = 1
    arrow.ZIndex = zIndex + 3
    arrow.Parent = container

    local aStroke = Instance.new("UIStroke")
    aStroke.Color = Color3.fromRGB(0, 0, 0)
    aStroke.Thickness = 3.0
    aStroke.Parent = arrow

    return container
end

----------------------------------------------------
-- 11. DAILY REWARD CARD (DAY 1-6 & RAINBOW DAY 7)
----------------------------------------------------
function CheckUIComponents.createRewardCard(props: {
    Parent: Instance,
    DayNumber: number,
    ItemName: string,
    IconAsset: string,
    State: "Claim" | "Claimed" | "Locked",
    Size: UDim2,
    Position: UDim2,
    IsDay7: boolean?,
    ZIndex: number?,
})
    local zIndex = props.ZIndex or 22
    local isDay7 = props.IsDay7 or (props.DayNumber == 7)

    local card = Instance.new("Frame")
    card.Name = "Day" .. tostring(props.DayNumber)
    card.Size = props.Size
    card.Position = props.Position
    card.AnchorPoint = Vector2.new(0.5, 0.5)
    card.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    card.BorderSizePixel = 0
    card.ClipsDescendants = true
    card.ZIndex = zIndex
    card.Parent = props.Parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = card

    local stroke = Instance.new("UIStroke")
    stroke.Color = isDay7 and Color3.fromRGB(255, 0, 180) or Color3.fromRGB(0, 0, 0)
    stroke.Thickness = isDay7 and 3.2 or 2.8
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = card

    -- Background Gradient selection based on Day
    local grad = Instance.new("UIGradient")
    if isDay7 then
        grad.Color = Theme.CardGradients.Rainbow
        grad.Rotation = 45 -- Dynamic diagonal angle for rainbow
    elseif props.DayNumber <= 3 then
        grad.Color = Theme.CardGradients.Cyan
        grad.Rotation = 90
    elseif props.DayNumber == 4 then
        grad.Color = Theme.CardGradients.Purple
        grad.Rotation = 90
    elseif props.DayNumber == 5 then
        grad.Color = Theme.CardGradients.Magenta
        grad.Rotation = 90
    else -- Day 6
        grad.Color = Theme.CardGradients.Amber
        grad.Rotation = 90
    end
    grad.Parent = card

    -- Sunburst on Day 4 and Day 7
    if isDay7 or props.DayNumber == 4 then
        local sunburst = Instance.new("ImageLabel")
        sunburst.Name = "Sunburst"
        sunburst.Size = UDim2.new(2, 0, 2, 0)
        sunburst.Position = UDim2.new(0.5, 0, 0.45, 0)
        sunburst.AnchorPoint = Vector2.new(0.5, 0.5)
        sunburst.BackgroundTransparency = 1
        sunburst.Image = Theme.Assets.Sunburst
        sunburst.ImageTransparency = isDay7 and 0.4 or 0.55
        sunburst.ZIndex = zIndex + 1
        sunburst.Parent = card
    end

    -- Damier texture
    local damier = Instance.new("ImageLabel")
    damier.Name = "Checkerboard"
    damier.Size = UDim2.new(1, 0, 1, 0)
    damier.Position = UDim2.new(0, 0, 0, 0)
    damier.BackgroundTransparency = 1
    damier.Image = Theme.Assets.Checkerboard
    damier.ScaleType = Enum.ScaleType.Tile
    damier.TileSize = UDim2.new(0, 18, 0, 18)
    damier.ImageColor3 = isDay7 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 60, 140)
    damier.ImageTransparency = isDay7 and 0.65 or 0.45
    damier.ZIndex = zIndex + 1
    damier.Parent = card

    -- Top Day Label
    local dayLabel = Instance.new("TextLabel")
    dayLabel.Name = "DayLabel"
    dayLabel.Text = isDay7 and "DAY 7" or ("DAY " .. tostring(props.DayNumber))
    dayLabel.Font = Theme.Typography.Font
    dayLabel.TextSize = isDay7 and 32 or 22
    dayLabel.TextColor3 = isDay7 and Color3.fromRGB(255, 240, 50) or Color3.fromRGB(255, 255, 255)
    dayLabel.Size = UDim2.new(1, 0, 0, isDay7 and 38 or 26)
    dayLabel.Position = UDim2.new(0.5, 0, 0, isDay7 and 14 or 8)
    dayLabel.AnchorPoint = Vector2.new(0.5, 0)
    dayLabel.BackgroundTransparency = 1
    dayLabel.ZIndex = zIndex + 2
    dayLabel.Parent = card

    local dStroke = Instance.new("UIStroke")
    dStroke.Color = Color3.fromRGB(0, 0, 0)
    dStroke.Thickness = isDay7 and 3.4 or 2.8
    dStroke.Parent = dayLabel

    -- Center Item Icon
    local icon = Instance.new("ImageLabel")
    icon.Name = "ItemIcon"
    icon.Size = isDay7 and UDim2.new(0, 120, 0, 120) or UDim2.new(0, 72, 0, 72)
    icon.Position = UDim2.new(0.5, 0, isDay7 and 0.46 or 0.45, 0)
    icon.AnchorPoint = Vector2.new(0.5, 0.5)
    icon.BackgroundTransparency = 1
    icon.Image = props.IconAsset
    icon.ScaleType = Enum.ScaleType.Fit
    icon.ZIndex = zIndex + 2
    icon.Parent = card

    -- Item Name Label
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "ItemName"
    nameLabel.Text = props.ItemName
    nameLabel.Font = Theme.Typography.Font
    nameLabel.TextSize = isDay7 and 20 or 15
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.Size = UDim2.new(1, 0, 0, isDay7 and 24 or 18)
    nameLabel.Position = UDim2.new(0.5, 0, 1, isDay7 and -56 or -42)
    nameLabel.AnchorPoint = Vector2.new(0.5, 1)
    nameLabel.BackgroundTransparency = 1
    nameLabel.ZIndex = zIndex + 2
    nameLabel.Parent = card

    local nStroke = Instance.new("UIStroke")
    nStroke.Color = Color3.fromRGB(0, 0, 0)
    nStroke.Thickness = 2.4
    nStroke.Parent = nameLabel

    -- State Button at Bottom
    local btnHeight = isDay7 and 34 or 26
    local btnWidth = isDay7 and 0.88 or 0.90
    CheckUIComponents.createStateButton({
        State = props.State,
        Size = UDim2.new(btnWidth, 0, 0, btnHeight),
        Position = UDim2.new(0.5, 0, 1, isDay7 and -12 or -8),
        AnchorPoint = Vector2.new(0.5, 1),
        Parent = card,
        ZIndex = zIndex + 3,
    })

    return card
end

return CheckUIComponents
