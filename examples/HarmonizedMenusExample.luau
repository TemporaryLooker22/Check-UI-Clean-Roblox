local StarterGui = game:GetService("StarterGui")
local CodesUI = StarterGui:FindFirstChild("CodesUI")
if not CodesUI then return "CodesUI ScreenGui not found" end

local DAMIER_ID = "rbxassetid://385956923"

----------------------------------------------------
-- HELPER: Create 3D Beveled Square CloseButton
----------------------------------------------------
local function createCloseButton(parentHeader)
    local oldBtn = parentHeader:FindFirstChild("CloseButton")
    if oldBtn then oldBtn:Destroy() end

    local CloseBtn = Instance.new("ImageButton")
    CloseBtn.Name = "CloseButton"
    CloseBtn.Size = UDim2.new(0, 38, 0, 38)
    CloseBtn.Position = UDim2.new(1, -34, 0.5, -2)
    CloseBtn.AnchorPoint = Vector2.new(0.5, 0.5)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(115, 0, 16) -- Dark 3D bevel extrusion base
    CloseBtn.BorderSizePixel = 0
    CloseBtn.AutoButtonColor = false
    CloseBtn.ClipsDescendants = false
    CloseBtn.ZIndex = 25
    CloseBtn.Parent = parentHeader

    local closeStroke = Instance.new("UIStroke")
    closeStroke.Color = Color3.fromRGB(0, 0, 0)
    closeStroke.Thickness = 2.8
    closeStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    closeStroke.Parent = CloseBtn

    local Face = Instance.new("Frame")
    Face.Name = "Face"
    Face.Size = UDim2.new(1, 0, 1, -4)
    Face.Position = UDim2.new(0, 0, 0, 0)
    Face.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Face.BorderSizePixel = 0
    Face.ZIndex = 26
    Face.Parent = CloseBtn

    local faceGrad = Instance.new("UIGradient")
    faceGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 125, 175)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 20, 40))
    }
    faceGrad.Rotation = 90
    faceGrad.Parent = Face

    local InnerBorder = Instance.new("Frame")
    InnerBorder.Name = "InnerBorder"
    InnerBorder.Size = UDim2.new(1, -2, 1, -2)
    InnerBorder.Position = UDim2.new(0.5, 0, 0.5, 0)
    InnerBorder.AnchorPoint = Vector2.new(0.5, 0.5)
    InnerBorder.BackgroundTransparency = 1
    InnerBorder.BorderSizePixel = 0
    InnerBorder.ZIndex = 27
    InnerBorder.Parent = Face

    local innerStroke = Instance.new("UIStroke")
    innerStroke.Color = Color3.fromRGB(255, 210, 235)
    innerStroke.Thickness = 1.2
    innerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    innerStroke.Parent = InnerBorder

    local SepLine = Instance.new("Frame")
    SepLine.Name = "SepLine"
    SepLine.Size = UDim2.new(1, 0, 0, 1)
    SepLine.Position = UDim2.new(0, 0, 1, -4)
    SepLine.BackgroundColor3 = Color3.fromRGB(70, 0, 10)
    SepLine.BorderSizePixel = 0
    SepLine.ZIndex = 27
    SepLine.Parent = CloseBtn

    local closeX = Instance.new("TextLabel")
    closeX.Name = "X"
    closeX.Text = "X"
    closeX.Font = Enum.Font.GothamBlack
    closeX.TextSize = 29
    closeX.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeX.Size = UDim2.new(1, 0, 1, 0)
    closeX.Position = UDim2.new(0.5, 0, 0.5, 0)
    closeX.AnchorPoint = Vector2.new(0.5, 0.5)
    closeX.BackgroundTransparency = 1
    closeX.ZIndex = 28
    closeX.Parent = Face

    local xStroke = Instance.new("UIStroke")
    xStroke.Color = Color3.fromRGB(0, 0, 0)
    xStroke.Thickness = 3
    xStroke.Parent = closeX

    local closeScale = Instance.new("UIScale")
    closeScale.Name = "ButtonScale"
    closeScale.Scale = 1
    closeScale.Parent = CloseBtn

    return CloseBtn
end

----------------------------------------------------
-- 1. HARMONIZE SETTINGS FRAME
----------------------------------------------------
local settingsFrame = CodesUI:FindFirstChild("SettingsFrame")
if settingsFrame then
    -- Frame Base
    settingsFrame.Size = UDim2.new(0, 528, 0, 415)
    settingsFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    settingsFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    settingsFrame.BackgroundColor3 = Color3.fromRGB(59, 88, 102) -- Solid Slate Blue (Shop chart)
    settingsFrame.BackgroundTransparency = 0
    settingsFrame.BorderSizePixel = 0
    settingsFrame.ClipsDescendants = true
    settingsFrame.ZIndex = 20

    local sCorner = settingsFrame:FindFirstChild("UICorner")
    if not sCorner then
        sCorner = Instance.new("UICorner")
        sCorner.Parent = settingsFrame
    end
    sCorner.CornerRadius = UDim.new(0, 4)

    local sStroke = settingsFrame:FindFirstChild("OuterStroke") or settingsFrame:FindFirstChild("UIStroke")
    if not sStroke then
        sStroke = Instance.new("UIStroke")
        sStroke.Name = "OuterStroke"
        sStroke.Parent = settingsFrame
    end
    sStroke.Color = Color3.fromRGB(24, 30, 34)
    sStroke.Thickness = 3.5
    sStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local sWindowScale = settingsFrame:FindFirstChild("WindowScale")
    if not sWindowScale then
        sWindowScale = Instance.new("UIScale")
        sWindowScale.Name = "WindowScale"
        sWindowScale.Scale = 1
        sWindowScale.Parent = settingsFrame
    end

    -- Header (Silver/Metallic White theme)
    local sHeader = settingsFrame:FindFirstChild("Header")
    if sHeader then
        sHeader.Size = UDim2.new(1, 0, 0, 60)
        sHeader.Position = UDim2.new(0, 0, 0, 0)
        sHeader.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        sHeader.BorderSizePixel = 0
        sHeader.ClipsDescendants = true
        sHeader.ZIndex = 21

        local hGrad = sHeader:FindFirstChild("HeaderGradient") or sHeader:FindFirstChild("UIGradient")
        if not hGrad then
            hGrad = Instance.new("UIGradient")
            hGrad.Name = "HeaderGradient"
            hGrad.Parent = sHeader
        end
        hGrad.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(215, 222, 232))
        }
        hGrad.Rotation = 90

        -- Top highlight
        local topH = sHeader:FindFirstChild("TopHighlight")
        if not topH then
            topH = Instance.new("Frame")
            topH.Name = "TopHighlight"
            topH.Parent = sHeader
        end
        topH.Size = UDim2.new(1, 0, 0, 2)
        topH.Position = UDim2.new(0, 0, 0, 0)
        topH.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        topH.BackgroundTransparency = 0.2
        topH.BorderSizePixel = 0
        topH.ZIndex = 22

        -- Checkerboard overlay with smooth fade
        local sDamier = sHeader:FindFirstChild("Checkerboard") or sHeader:FindFirstChild("HeaderDamier")
        if not sDamier then
            sDamier = Instance.new("ImageLabel")
            sDamier.Name = "Checkerboard"
            sDamier.Parent = sHeader
        end
        sDamier.Size = UDim2.new(1, 0, 1, 0)
        sDamier.Position = UDim2.new(0, 0, 0, 0)
        sDamier.BackgroundTransparency = 1
        sDamier.Image = DAMIER_ID
        sDamier.ScaleType = Enum.ScaleType.Tile
        sDamier.TileSize = UDim2.new(0, 26, 0, 26)
        sDamier.ImageColor3 = Color3.fromRGB(110, 120, 135)
        sDamier.ImageTransparency = 0.35
        sDamier.ZIndex = 22

        local dGrad = sDamier:FindFirstChild("CheckerGradient") or sDamier:FindFirstChild("UIGradient")
        if not dGrad then
            dGrad = Instance.new("UIGradient")
            dGrad.Name = "CheckerGradient"
            dGrad.Parent = sDamier
        end
        dGrad.Transparency = NumberSequence.new{
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.28, 0.65),
            NumberSequenceKeypoint.new(1, 0.05)
        }
        dGrad.Rotation = 90

        -- Clean up old divider if present and replace with 2-tier 3D separator (matching Shop)
        local oldDiv = sHeader:FindFirstChild("DividerBar")
        if oldDiv then oldDiv:Destroy() end

        local divDark = sHeader:FindFirstChild("DivDark")
        if not divDark then
            divDark = Instance.new("Frame")
            divDark.Name = "DivDark"
            divDark.Parent = sHeader
        end
        divDark.Size = UDim2.new(1, 0, 0, 3)
        divDark.Position = UDim2.new(0, 0, 1, -6)
        divDark.BackgroundColor3 = Color3.fromRGB(90, 100, 112)
        divDark.BorderSizePixel = 0
        divDark.ZIndex = 23

        local divBlack = sHeader:FindFirstChild("DivBlack")
        if not divBlack then
            divBlack = Instance.new("Frame")
            divBlack.Name = "DivBlack"
            divBlack.Parent = sHeader
        end
        divBlack.Size = UDim2.new(1, 0, 0, 3)
        divBlack.Position = UDim2.new(0, 0, 1, -3)
        divBlack.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        divBlack.BorderSizePixel = 0
        divBlack.ZIndex = 23

        -- Title
        local sTitle = sHeader:FindFirstChild("TitleLabel") or sHeader:FindFirstChild("Title")
        if sTitle then
            sTitle.Name = "TitleLabel"
            sTitle.Text = "Settings"
            sTitle.Font = Enum.Font.GothamBlack
            sTitle.TextSize = 38
            sTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            sTitle.TextXAlignment = Enum.TextXAlignment.Left
            sTitle.Size = UDim2.new(0, 220, 0, 44)
            sTitle.Position = UDim2.new(0, 18, 0.5, -2)
            sTitle.AnchorPoint = Vector2.new(0, 0.5)
            sTitle.BackgroundTransparency = 1
            sTitle.ZIndex = 24

            local tStroke = sTitle:FindFirstChild("TextStroke") or sTitle:FindFirstChild("UIStroke")
            if not tStroke then
                tStroke = Instance.new("UIStroke")
                tStroke.Name = "TextStroke"
                tStroke.Parent = sTitle
            end
            tStroke.Color = Color3.fromRGB(0, 0, 0)
            tStroke.Thickness = 3.2
        end

        -- New 3D Beveled Square CloseButton
        createCloseButton(sHeader)
    end

    -- Content Rows (SFX & Music)
    local sContent = settingsFrame:FindFirstChild("Content")
    if sContent then
        sContent.Size = UDim2.new(1, 0, 1, -60)
        sContent.Position = UDim2.new(0, 0, 0, 60)
        sContent.BackgroundTransparency = 1
        sContent.ZIndex = 21

        local function formatRow(row, yPos, titleText, subText, toggleName, isGreenDefault)
            row.Size = UDim2.new(1, -34, 0, 74)
            row.Position = UDim2.new(0.5, 0, 0, yPos)
            row.AnchorPoint = Vector2.new(0.5, 0)
            row.BackgroundColor3 = Color3.fromRGB(26, 44, 52) -- Solid dark container
            row.BorderSizePixel = 0
            row.ClipsDescendants = true
            row.ZIndex = 22

            local rCorner = row:FindFirstChild("UICorner")
            if not rCorner then
                rCorner = Instance.new("UICorner")
                rCorner.Parent = row
            end
            rCorner.CornerRadius = UDim.new(0, 4)

            local rStroke = row:FindFirstChild("UIStroke")
            if not rStroke then
                rStroke = Instance.new("UIStroke")
                rStroke.Parent = row
            end
            rStroke.Color = Color3.fromRGB(0, 0, 0)
            rStroke.Thickness = 2.8
            rStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

            local rInner = row:FindFirstChild("InnerHighlight")
            if not rInner then
                rInner = Instance.new("Frame")
                rInner.Name = "InnerHighlight"
                rInner.Parent = row
            end
            rInner.Size = UDim2.new(1, -4, 1, -4)
            rInner.Position = UDim2.new(0.5, 0, 0.5, 0)
            rInner.AnchorPoint = Vector2.new(0.5, 0.5)
            rInner.BackgroundTransparency = 1
            rInner.BorderSizePixel = 0
            rInner.ZIndex = 23

            local rInnerStroke = rInner:FindFirstChild("UIStroke")
            if not rInnerStroke then
                rInnerStroke = Instance.new("UIStroke")
                rInnerStroke.Parent = rInner
            end
            rInnerStroke.Color = Color3.fromRGB(75, 125, 145)
            rInnerStroke.Transparency = 0.4
            rInnerStroke.Thickness = 1.2
            rInnerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

            local rDamier = row:FindFirstChild("Checkerboard")
            if not rDamier then
                rDamier = Instance.new("ImageLabel")
                rDamier.Name = "Checkerboard"
                rDamier.Parent = row
            end
            rDamier.Size = UDim2.new(1, 0, 1, 0)
            rDamier.Position = UDim2.new(0, 0, 0, 0)
            rDamier.BackgroundTransparency = 1
            rDamier.Image = DAMIER_ID
            rDamier.ScaleType = Enum.ScaleType.Tile
            rDamier.TileSize = UDim2.new(0, 22, 0, 22)
            rDamier.ImageColor3 = Color3.fromRGB(15, 28, 34)
            rDamier.ImageTransparency = 0.45
            rDamier.ZIndex = 23

            local rTitle = row:FindFirstChild("Title")
            if rTitle then
                rTitle.Text = titleText
                rTitle.Font = Enum.Font.GothamBlack
                rTitle.TextSize = 24
                rTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                rTitle.Position = UDim2.new(0, 16, 0, 14)
                rTitle.Size = UDim2.new(0, 200, 0, 26)
                rTitle.BackgroundTransparency = 1
                rTitle.ZIndex = 24

                local rtStroke = rTitle:FindFirstChild("UIStroke")
                if not rtStroke then
                    rtStroke = Instance.new("UIStroke")
                    rtStroke.Parent = rTitle
                end
                rtStroke.Color = Color3.fromRGB(0, 0, 0)
                rtStroke.Thickness = 2.8
            end

            local rSub = row:FindFirstChild("Subtitle")
            if rSub then
                rSub.Text = subText
                rSub.Font = Enum.Font.GothamBlack
                rSub.TextSize = 14
                rSub.TextColor3 = Color3.fromRGB(195, 215, 228)
                rSub.Position = UDim2.new(0, 16, 0, 42)
                rSub.Size = UDim2.new(0, 250, 0, 20)
                rSub.BackgroundTransparency = 1
                rSub.ZIndex = 24

                local rsStroke = rSub:FindFirstChild("UIStroke")
                if not rsStroke then
                    rsStroke = Instance.new("UIStroke")
                    rsStroke.Parent = rSub
                end
                rsStroke.Color = Color3.fromRGB(0, 0, 0)
                rsStroke.Thickness = 2.0
            end

            -- Toggle Button with 3D Bevel & Shop Styling
            local toggle = row:FindFirstChild(toggleName)
            if toggle then
                toggle.Size = UDim2.new(0, 104, 0, 40)
                toggle.Position = UDim2.new(1, -66, 0.5, 0)
                toggle.AnchorPoint = Vector2.new(0.5, 0.5)
                toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                toggle.BorderSizePixel = 0
                toggle.AutoButtonColor = false
                toggle.ClipsDescendants = true
                toggle.ZIndex = 25

                local tCorner = toggle:FindFirstChild("UICorner")
                if not tCorner then
                    tCorner = Instance.new("UICorner")
                    tCorner.Parent = toggle
                end
                tCorner.CornerRadius = UDim.new(0, 4)

                local tStroke = toggle:FindFirstChild("OuterStroke") or toggle:FindFirstChild("UIStroke")
                if not tStroke then
                    tStroke = Instance.new("UIStroke")
                    tStroke.Name = "OuterStroke"
                    tStroke.Parent = toggle
                end
                tStroke.Color = Color3.fromRGB(0, 0, 0)
                tStroke.Thickness = 2.6
                tStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

                local tGrad = toggle:FindFirstChild("ButtonGradient") or toggle:FindFirstChild("UIGradient")
                if not tGrad then
                    tGrad = Instance.new("UIGradient")
                    tGrad.Name = "ButtonGradient"
                    tGrad.Parent = toggle
                end
                if isGreenDefault then
                    tGrad.Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 255, 25)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(105, 225, 0))
                    }
                else
                    tGrad.Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 55, 130)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(230, 10, 40))
                    }
                end
                tGrad.Rotation = 90

                -- 3D Bevel Frame (Bottom Drop Shadow)
                local bevel = toggle:FindFirstChild("Frame") or toggle:FindFirstChild("Bevel")
                if not bevel then
                    bevel = Instance.new("Frame")
                    bevel.Name = "Frame"
                    bevel.Parent = toggle
                end
                bevel.Size = UDim2.new(1, 0, 0, 3)
                bevel.Position = UDim2.new(0, 0, 1, -3)
                bevel.BackgroundColor3 = isGreenDefault and Color3.fromRGB(15, 120, 15) or Color3.fromRGB(120, 10, 45)
                bevel.BorderSizePixel = 0
                bevel.ZIndex = 26

                -- Inner Highlight
                local tInner = toggle:FindFirstChild("InnerHighlight")
                if not tInner then
                    tInner = Instance.new("Frame")
                    tInner.Name = "InnerHighlight"
                    tInner.Parent = toggle
                end
                tInner.Size = UDim2.new(1, -4, 1, -4)
                tInner.Position = UDim2.new(0.5, 0, 0.5, 0)
                tInner.AnchorPoint = Vector2.new(0.5, 0.5)
                tInner.BackgroundTransparency = 1
                tInner.BorderSizePixel = 0
                tInner.ZIndex = 27

                local tInnerStroke = tInner:FindFirstChild("InnerStroke") or tInner:FindFirstChild("UIStroke")
                if not tInnerStroke then
                    tInnerStroke = Instance.new("UIStroke")
                    tInnerStroke.Name = "InnerStroke"
                    tInnerStroke.Parent = tInner
                end
                tInnerStroke.Color = isGreenDefault and Color3.fromRGB(235, 255, 130) or Color3.fromRGB(255, 190, 220)
                tInnerStroke.Thickness = 1.2
                tInnerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

                -- Checkerboard texture with smooth fade
                local tDamier = toggle:FindFirstChild("Checkerboard") or toggle:FindFirstChild("Damier")
                if not tDamier then
                    tDamier = Instance.new("ImageLabel")
                    tDamier.Name = "Checkerboard"
                    tDamier.Parent = toggle
                end
                tDamier.Size = UDim2.new(1, 0, 1, 0)
                tDamier.Position = UDim2.new(0, 0, 0, 0)
                tDamier.BackgroundTransparency = 1
                tDamier.Image = DAMIER_ID
                tDamier.ScaleType = Enum.ScaleType.Tile
                tDamier.TileSize = UDim2.new(0, 16, 0, 16)
                tDamier.ImageColor3 = isGreenDefault and Color3.fromRGB(40, 160, 20) or Color3.fromRGB(140, 10, 40)
                tDamier.ImageTransparency = 0.3
                tDamier.ZIndex = 26

                local tdGrad = tDamier:FindFirstChild("UIGradient")
                if not tdGrad then
                    tdGrad = Instance.new("UIGradient")
                    tdGrad.Parent = tDamier
                end
                tdGrad.Transparency = NumberSequence.new{
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.3, 0.82),
                    NumberSequenceKeypoint.new(0.7, 0.35),
                    NumberSequenceKeypoint.new(1, 0.10)
                }
                tdGrad.Rotation = 90

                -- Label
                local tLabel = toggle:FindFirstChild("Label")
                if not tLabel then
                    tLabel = Instance.new("TextLabel")
                    tLabel.Name = "Label"
                    tLabel.Parent = toggle
                end
                tLabel.Text = "On"
                tLabel.Font = Enum.Font.GothamBlack
                tLabel.TextSize = 25
                tLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                tLabel.Size = UDim2.new(1, 0, 1, 0)
                tLabel.Position = UDim2.new(0, 0, 0, 0)
                tLabel.BackgroundTransparency = 1
                tLabel.ZIndex = 28

                local tlStroke = tLabel:FindFirstChild("UIStroke")
                if not tlStroke then
                    tlStroke = Instance.new("UIStroke")
                    tlStroke.Parent = tLabel
                end
                tlStroke.Color = Color3.fromRGB(0, 0, 0)
                tlStroke.Thickness = 2.8

                local tScale = toggle:FindFirstChild("ButtonScale")
                if not tScale then
                    tScale = Instance.new("UIScale")
                    tScale.Name = "ButtonScale"
                    tScale.Scale = 1
                    tScale.Parent = toggle
                end
            end
        end

        local sfxRow = sContent:FindFirstChild("SFXRow")
        if sfxRow then
            formatRow(sfxRow, 14, "SFX", "Toggle sound effect!", "SFXToggle", true)
        end

        local musicRow = sContent:FindFirstChild("MusicRow")
        if musicRow then
            formatRow(musicRow, 102, "Music", "Toggle music", "MusicToggle", false)
        end
    end
end

----------------------------------------------------
-- 2. HARMONIZE CODES MAIN FRAME
----------------------------------------------------
local mainFrame = CodesUI:FindFirstChild("MainFrame")
if mainFrame then
    -- Frame Base
    mainFrame.Size = UDim2.new(0, 528, 0, 262)
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(59, 88, 102) -- Solid Slate Blue (Shop chart)
    mainFrame.BackgroundTransparency = 0
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = true
    mainFrame.ZIndex = 20

    local mCorner = mainFrame:FindFirstChild("UICorner")
    if not mCorner then
        mCorner = Instance.new("UICorner")
        mCorner.Parent = mainFrame
    end
    mCorner.CornerRadius = UDim.new(0, 4)

    local mStroke = mainFrame:FindFirstChild("OuterStroke") or mainFrame:FindFirstChild("UIStroke")
    if not mStroke then
        mStroke = Instance.new("UIStroke")
        mStroke.Name = "OuterStroke"
        mStroke.Parent = mainFrame
    end
    mStroke.Color = Color3.fromRGB(24, 30, 34)
    mStroke.Thickness = 3.5
    mStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local mWindowScale = mainFrame:FindFirstChild("WindowScale")
    if not mWindowScale then
        mWindowScale = Instance.new("UIScale")
        mWindowScale.Name = "WindowScale"
        mWindowScale.Scale = 1
        mWindowScale.Parent = mainFrame
    end

    -- Header (Vibrant Cyan / Blue theme)
    local mHeader = mainFrame:FindFirstChild("Header")
    if mHeader then
        mHeader.Size = UDim2.new(1, 0, 0, 60)
        mHeader.Position = UDim2.new(0, 0, 0, 0)
        mHeader.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        mHeader.BorderSizePixel = 0
        mHeader.ClipsDescendants = true
        mHeader.ZIndex = 21

        local hGrad = mHeader:FindFirstChild("HeaderGradient") or mHeader:FindFirstChild("UIGradient")
        if not hGrad then
            hGrad = Instance.new("UIGradient")
            hGrad.Name = "HeaderGradient"
            hGrad.Parent = mHeader
        end
        hGrad.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 205, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 130, 245))
        }
        hGrad.Rotation = 90

        -- Top highlight
        local topH = mHeader:FindFirstChild("TopHighlight")
        if not topH then
            topH = Instance.new("Frame")
            topH.Name = "TopHighlight"
            topH.Parent = mHeader
        end
        topH.Size = UDim2.new(1, 0, 0, 2)
        topH.Position = UDim2.new(0, 0, 0, 0)
        topH.BackgroundColor3 = Color3.fromRGB(180, 240, 255)
        topH.BackgroundTransparency = 0.3
        topH.BorderSizePixel = 0
        topH.ZIndex = 22

        -- Checkerboard overlay with smooth fade
        local mDamier = mHeader:FindFirstChild("Checkerboard") or mHeader:FindFirstChild("HeaderDamier")
        if not mDamier then
            mDamier = Instance.new("ImageLabel")
            mDamier.Name = "Checkerboard"
            mDamier.Parent = mHeader
        end
        mDamier.Size = UDim2.new(1, 0, 1, 0)
        mDamier.Position = UDim2.new(0, 0, 0, 0)
        mDamier.BackgroundTransparency = 1
        mDamier.Image = DAMIER_ID
        mDamier.ScaleType = Enum.ScaleType.Tile
        mDamier.TileSize = UDim2.new(0, 26, 0, 26)
        mDamier.ImageColor3 = Color3.fromRGB(0, 75, 150)
        mDamier.ImageTransparency = 0.35
        mDamier.ZIndex = 22

        local dGrad = mDamier:FindFirstChild("CheckerGradient") or mDamier:FindFirstChild("UIGradient")
        if not dGrad then
            dGrad = Instance.new("UIGradient")
            dGrad.Name = "CheckerGradient"
            dGrad.Parent = mDamier
        end
        dGrad.Transparency = NumberSequence.new{
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.28, 0.65),
            NumberSequenceKeypoint.new(1, 0.05)
        }
        dGrad.Rotation = 90

        -- Clean up old divider if present and replace with 2-tier 3D separator (matching Shop)
        local oldDiv = mHeader:FindFirstChild("DividerBar")
        if oldDiv then oldDiv:Destroy() end

        local divDark = mHeader:FindFirstChild("DivDark")
        if not divDark then
            divDark = Instance.new("Frame")
            divDark.Name = "DivDark"
            divDark.Parent = mHeader
        end
        divDark.Size = UDim2.new(1, 0, 0, 3)
        divDark.Position = UDim2.new(0, 0, 1, -6)
        divDark.BackgroundColor3 = Color3.fromRGB(0, 50, 110)
        divDark.BorderSizePixel = 0
        divDark.ZIndex = 23

        local divBlack = mHeader:FindFirstChild("DivBlack")
        if not divBlack then
            divBlack = Instance.new("Frame")
            divBlack.Name = "DivBlack"
            divBlack.Parent = mHeader
        end
        divBlack.Size = UDim2.new(1, 0, 0, 3)
        divBlack.Position = UDim2.new(0, 0, 1, -3)
        divBlack.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        divBlack.BorderSizePixel = 0
        divBlack.ZIndex = 23

        -- Title
        local mTitle = mHeader:FindFirstChild("TitleLabel") or mHeader:FindFirstChild("Title")
        if mTitle then
            mTitle.Name = "TitleLabel"
            mTitle.Text = "Codes"
            mTitle.Font = Enum.Font.GothamBlack
            mTitle.TextSize = 38
            mTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            mTitle.TextXAlignment = Enum.TextXAlignment.Left
            mTitle.Size = UDim2.new(0, 220, 0, 44)
            mTitle.Position = UDim2.new(0, 18, 0.5, -2)
            mTitle.AnchorPoint = Vector2.new(0, 0.5)
            mTitle.BackgroundTransparency = 1
            mTitle.ZIndex = 24

            local tStroke = mTitle:FindFirstChild("TextStroke") or mTitle:FindFirstChild("UIStroke")
            if not tStroke then
                tStroke = Instance.new("UIStroke")
                tStroke.Name = "TextStroke"
                tStroke.Parent = mTitle
            end
            tStroke.Color = Color3.fromRGB(0, 0, 0)
            tStroke.Thickness = 3.2
        end

        -- New 3D Beveled Square CloseButton
        createCloseButton(mHeader)
    end

    -- Info Label
    local infoLabel = mainFrame:FindFirstChild("InfoLabel")
    if infoLabel then
        infoLabel.Font = Enum.Font.GothamBlack
        infoLabel.TextSize = 18
        infoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        infoLabel.Text = "Follow Username and Username on\nRoblox for codes!"
        infoLabel.Size = UDim2.new(1, -30, 0, 50)
        infoLabel.Position = UDim2.new(0.5, 0, 0, 70)
        infoLabel.AnchorPoint = Vector2.new(0.5, 0)
        infoLabel.BackgroundTransparency = 1
        infoLabel.ZIndex = 22

        local iStroke = infoLabel:FindFirstChild("UIStroke")
        if not iStroke then
            iStroke = Instance.new("UIStroke")
            iStroke.Parent = infoLabel
        end
        iStroke.Color = Color3.fromRGB(0, 0, 0)
        iStroke.Thickness = 2.4
    end

    -- Input Container (Recessed Dark Container matching Shop card depth)
    local inputContainer = mainFrame:FindFirstChild("InputContainer")
    if inputContainer then
        inputContainer.Size = UDim2.new(1, -44, 0, 52)
        inputContainer.Position = UDim2.new(0.5, 0, 0, 128)
        inputContainer.AnchorPoint = Vector2.new(0.5, 0)
        inputContainer.BackgroundColor3 = Color3.fromRGB(26, 44, 52) -- Solid dark container
        inputContainer.BorderSizePixel = 0
        inputContainer.ClipsDescendants = true
        inputContainer.ZIndex = 22

        local icCorner = inputContainer:FindFirstChild("UICorner")
        if not icCorner then
            icCorner = Instance.new("UICorner")
            icCorner.Parent = inputContainer
        end
        icCorner.CornerRadius = UDim.new(0, 4)

        local icStroke = inputContainer:FindFirstChild("BorderStroke") or inputContainer:FindFirstChild("UIStroke")
        if not icStroke then
            icStroke = Instance.new("UIStroke")
            icStroke.Name = "BorderStroke"
            icStroke.Parent = inputContainer
        end
        icStroke.Color = Color3.fromRGB(0, 0, 0)
        icStroke.Thickness = 2.8
        icStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        local icInner = inputContainer:FindFirstChild("InnerHighlight")
        if not icInner then
            icInner = Instance.new("Frame")
            icInner.Name = "InnerHighlight"
            icInner.Parent = inputContainer
        end
        icInner.Size = UDim2.new(1, -4, 1, -4)
        icInner.Position = UDim2.new(0.5, 0, 0.5, 0)
        icInner.AnchorPoint = Vector2.new(0.5, 0.5)
        icInner.BackgroundTransparency = 1
        icInner.BorderSizePixel = 0
        icInner.ZIndex = 23

        local icInnerStroke = icInner:FindFirstChild("UIStroke")
        if not icInnerStroke then
            icInnerStroke = Instance.new("UIStroke")
            icInnerStroke.Parent = icInner
        end
        icInnerStroke.Color = Color3.fromRGB(75, 125, 145)
        icInnerStroke.Transparency = 0.4
        icInnerStroke.Thickness = 1.2
        icInnerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        local icDamier = inputContainer:FindFirstChild("Checkerboard")
        if not icDamier then
            icDamier = Instance.new("ImageLabel")
            icDamier.Name = "Checkerboard"
            icDamier.Parent = inputContainer
        end
        icDamier.Size = UDim2.new(1, 0, 1, 0)
        icDamier.Position = UDim2.new(0, 0, 0, 0)
        icDamier.BackgroundTransparency = 1
        icDamier.Image = DAMIER_ID
        icDamier.ScaleType = Enum.ScaleType.Tile
        icDamier.TileSize = UDim2.new(0, 20, 0, 20)
        icDamier.ImageColor3 = Color3.fromRGB(15, 28, 34)
        icDamier.ImageTransparency = 0.45
        icDamier.ZIndex = 23

        local codeTextBox = inputContainer:FindFirstChild("CodeTextBox")
        if codeTextBox then
            codeTextBox.Size = UDim2.new(1, -24, 1, 0)
            codeTextBox.Position = UDim2.new(0, 12, 0, 0)
            codeTextBox.BackgroundTransparency = 1
            codeTextBox.Font = Enum.Font.GothamBlack
            codeTextBox.TextSize = 22
            codeTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            codeTextBox.PlaceholderText = "Enter code here.."
            codeTextBox.PlaceholderColor3 = Color3.fromRGB(145, 175, 190)
            codeTextBox.ZIndex = 24

            local ctbStroke = codeTextBox:FindFirstChild("UIStroke")
            if not ctbStroke then
                ctbStroke = Instance.new("UIStroke")
                ctbStroke.Parent = codeTextBox
            end
            ctbStroke.Color = Color3.fromRGB(0, 0, 0)
            ctbStroke.Thickness = 2.4
        end
    end

    -- Redeem Button with 3D Bevel & Shop Styling
    local redeemBtn = mainFrame:FindFirstChild("RedeemButton")
    if redeemBtn then
        redeemBtn.Size = UDim2.new(0, 214, 0, 48)
        redeemBtn.Position = UDim2.new(0.5, 0, 0, 198)
        redeemBtn.AnchorPoint = Vector2.new(0.5, 0)
        redeemBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        redeemBtn.BorderSizePixel = 0
        redeemBtn.AutoButtonColor = false
        redeemBtn.ClipsDescendants = true
        redeemBtn.ZIndex = 25

        local rbCorner = redeemBtn:FindFirstChild("UICorner")
        if not rbCorner then
            rbCorner = Instance.new("UICorner")
            rbCorner.Parent = redeemBtn
        end
        rbCorner.CornerRadius = UDim.new(0, 4)

        local rbStroke = redeemBtn:FindFirstChild("OuterStroke") or redeemBtn:FindFirstChild("UIStroke")
        if not rbStroke then
            rbStroke = Instance.new("UIStroke")
            rbStroke.Name = "OuterStroke"
            rbStroke.Parent = redeemBtn
        end
        rbStroke.Color = Color3.fromRGB(0, 0, 0)
        rbStroke.Thickness = 2.8
        rbStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        local rbGrad = redeemBtn:FindFirstChild("ButtonGradient") or redeemBtn:FindFirstChild("UIGradient")
        if not rbGrad then
            rbGrad = Instance.new("UIGradient")
            rbGrad.Name = "ButtonGradient"
            rbGrad.Parent = redeemBtn
        end
        rbGrad.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 255, 25)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(105, 225, 0))
        }
        rbGrad.Rotation = 90

        -- 3D Bevel Frame (Bottom Drop Shadow)
        local rbBevel = redeemBtn:FindFirstChild("Frame") or redeemBtn:FindFirstChild("Bevel")
        if not rbBevel then
            rbBevel = Instance.new("Frame")
            rbBevel.Name = "Frame"
            rbBevel.Parent = redeemBtn
        end
        rbBevel.Size = UDim2.new(1, 0, 0, 3)
        rbBevel.Position = UDim2.new(0, 0, 1, -3)
        rbBevel.BackgroundColor3 = Color3.fromRGB(15, 120, 15)
        rbBevel.BorderSizePixel = 0
        rbBevel.ZIndex = 26

        -- Inner Highlight
        local rbInner = redeemBtn:FindFirstChild("InnerHighlight")
        if not rbInner then
            rbInner = Instance.new("Frame")
            rbInner.Name = "InnerHighlight"
            rbInner.Parent = redeemBtn
        end
        rbInner.Size = UDim2.new(1, -4, 1, -4)
        rbInner.Position = UDim2.new(0.5, 0, 0.5, 0)
        rbInner.AnchorPoint = Vector2.new(0.5, 0.5)
        rbInner.BackgroundTransparency = 1
        rbInner.BorderSizePixel = 0
        rbInner.ZIndex = 27

        local rbInnerStroke = rbInner:FindFirstChild("UIStroke")
        if not rbInnerStroke then
            rbInnerStroke = Instance.new("UIStroke")
            rbInnerStroke.Parent = rbInner
        end
        rbInnerStroke.Color = Color3.fromRGB(235, 255, 130)
        rbInnerStroke.Thickness = 1.2
        rbInnerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        -- Checkerboard texture with smooth fade
        local rbDamier = redeemBtn:FindFirstChild("Checkerboard")
        if not rbDamier then
            rbDamier = Instance.new("ImageLabel")
            rbDamier.Name = "Checkerboard"
            rbDamier.Parent = redeemBtn
        end
        rbDamier.Size = UDim2.new(1, 0, 1, 0)
        rbDamier.Position = UDim2.new(0, 0, 0, 0)
        rbDamier.BackgroundTransparency = 1
        rbDamier.Image = DAMIER_ID
        rbDamier.ScaleType = Enum.ScaleType.Tile
        rbDamier.TileSize = UDim2.new(0, 18, 0, 18)
        rbDamier.ImageColor3 = Color3.fromRGB(40, 160, 20)
        rbDamier.ImageTransparency = 0.3
        rbDamier.ZIndex = 26

        local rbdGrad = rbDamier:FindFirstChild("UIGradient")
        if not rbdGrad then
            rbdGrad = Instance.new("UIGradient")
            rbdGrad.Parent = rbDamier
        end
        rbdGrad.Transparency = NumberSequence.new{
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.3, 0.82),
            NumberSequenceKeypoint.new(0.7, 0.35),
            NumberSequenceKeypoint.new(1, 0.10)
        }
        rbdGrad.Rotation = 90

        -- Label
        local rbLabel = redeemBtn:FindFirstChild("Label")
        if not rbLabel then
            rbLabel = Instance.new("TextLabel")
            rbLabel.Name = "Label"
            rbLabel.Parent = redeemBtn
        end
        rbLabel.Text = "Redeem"
        rbLabel.Font = Enum.Font.GothamBlack
        rbLabel.TextSize = 26
        rbLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        rbLabel.Size = UDim2.new(1, 0, 1, 0)
        rbLabel.Position = UDim2.new(0, 0, 0, 0)
        rbLabel.BackgroundTransparency = 1
        rbLabel.ZIndex = 28

        local rblStroke = rbLabel:FindFirstChild("UIStroke")
        if not rblStroke then
            rblStroke = Instance.new("UIStroke")
            rblStroke.Parent = rbLabel
        end
        rblStroke.Color = Color3.fromRGB(0, 0, 0)
        rblStroke.Thickness = 2.8

        local rbScale = redeemBtn:FindFirstChild("ButtonScale")
        if not rbScale then
            rbScale = Instance.new("UIScale")
            rbScale.Name = "ButtonScale"
            rbScale.Scale = 1
            rbScale.Parent = redeemBtn
        end
    end
end

return "SettingsFrame & MainFrame successfully harmonized with Shop graphic charter!"
