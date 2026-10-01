--!strict
-- CheckUITheme.luau
-- Central design tokens, color formulas, and asset registry for the Check-UI Design System.
-- Expanded in v1.2.0 to include all 5 canonical simulator menu themes:
-- Shop, Codes, Rebirth, Settings, and Daily Rewards.

local CheckUITheme = {}

CheckUITheme.Assets = {
    Checkerboard = "rbxassetid://385956923",
    Sunburst = "rbxassetid://130563114903838",
    CashIcon = "rbxassetid://88694661500877",
    PlayerIcon = "rbxassetid://77589096360120",
    RobuxIcon = "rbxassetid://132185731364109",
    HoverSound = "rbxassetid://6895079853",
    ClickSound = "rbxassetid://6895079853",
}

CheckUITheme.Colors = {
    -- Canvas Base
    Canvas = Color3.fromRGB(59, 88, 102),          -- #3B5866 Solid slate blue
    CanvasBorder = Color3.fromRGB(24, 30, 34),      -- #181E22 Deep charcoal outer border (3.5px)
    
    -- Card Containers & Sub-boxes
    CardBackground = Color3.fromRGB(26, 44, 52),    -- #1A2C34 Recessed dark container
    CardHighlight = Color3.fromRGB(75, 125, 145),   -- #4B7D91 Subtle slate highlight (1.2px)
    CardBorder = Color3.fromRGB(0, 0, 0),           -- Pure black
    RequirementsBox = Color3.fromRGB(20, 34, 42),   -- Dark sub-box for progression / requirements
    RequirementsHighlight = Color3.fromRGB(85, 140, 160), -- Crisp 1.2px border for requirements
    
    -- Close Button [X] 3D Bevel
    CloseBase = Color3.fromRGB(115, 0, 16),         -- #730010 Dark burgundy extrusion
    CloseSepLine = Color3.fromRGB(70, 0, 10),        -- #46000A Separator line
    CloseHighlight = Color3.fromRGB(255, 210, 235), -- #FFD2EB Pastel pink highlight
    CloseFaceTop = Color3.fromRGB(255, 125, 175),
    CloseFaceBottom = Color3.fromRGB(255, 20, 40),
    
    -- ====================================================
    -- BUTTON STATE TRIAD (CLAIM / CLAIMED / LOCKED / SKIP)
    -- ====================================================
    
    -- 1. Action / Buy / Claim / Redeem (Lime Green)
    ClaimGradientTop = Color3.fromRGB(180, 255, 25),
    ClaimGradientBottom = Color3.fromRGB(105, 225, 0),
    ClaimBevel = Color3.fromRGB(15, 120, 15),       -- #0F780F 3D bottom bevel
    ClaimHighlight = Color3.fromRGB(235, 255, 130), -- #EBFF82 Lime highlight
    ClaimDamier = Color3.fromRGB(40, 160, 20),
    
    -- Aliases for backwards compatibility:
    GreenGradientTop = Color3.fromRGB(180, 255, 25),
    GreenGradientBottom = Color3.fromRGB(105, 225, 0),
    GreenBevel = Color3.fromRGB(15, 120, 15),
    GreenHighlight = Color3.fromRGB(235, 255, 130),
    GreenDamier = Color3.fromRGB(40, 160, 20),
    
    -- 2. Claimed / Disabled / Off (Metallic Silver / Slate Grey)
    ClaimedGradientTop = Color3.fromRGB(216, 222, 228),
    ClaimedGradientBottom = Color3.fromRGB(148, 160, 176),
    ClaimedBevel = Color3.fromRGB(72, 82, 96),      -- #485260 Dark slate bevel
    ClaimedHighlight = Color3.fromRGB(255, 255, 255),
    ClaimedDamier = Color3.fromRGB(96, 104, 112),
    
    -- 3. Locked / Destructive (Crimson Red)
    LockedGradientTop = Color3.fromRGB(255, 32, 80),
    LockedGradientBottom = Color3.fromRGB(208, 0, 32),
    LockedBevel = Color3.fromRGB(112, 0, 16),       -- #700010 Burgundy bevel
    LockedHighlight = Color3.fromRGB(255, 176, 200),
    LockedDamier = Color3.fromRGB(144, 0, 24),
    
    -- 4. Skip / Secondary Header Action (Golden Amber / Orange-Yellow)
    SkipGradientTop = Color3.fromRGB(255, 208, 0),
    SkipGradientBottom = Color3.fromRGB(255, 140, 0),
    SkipBevel = Color3.fromRGB(153, 76, 0),          -- #994C00 Dark amber bevel
    SkipHighlight = Color3.fromRGB(255, 240, 160),
    SkipDamier = Color3.fromRGB(176, 96, 0),
    
    -- 5. Music / Feature Highlight (Hot Pink / Magenta)
    PinkGradientTop = Color3.fromRGB(255, 20, 128),
    PinkGradientBottom = Color3.fromRGB(212, 0, 85),
    PinkBevel = Color3.fromRGB(120, 10, 45),        -- #780A2D 3D bottom bevel
    PinkHighlight = Color3.fromRGB(255, 176, 208),
    PinkDamier = Color3.fromRGB(160, 0, 64),
    
    -- Off / Disabled Grey
    OffGradientTop = Color3.fromRGB(80, 85, 90),
    OffGradientBottom = Color3.fromRGB(45, 50, 55),
    OffBevel = Color3.fromRGB(28, 30, 34),
    OffHighlight = Color3.fromRGB(140, 145, 150),
    OffDamier = Color3.fromRGB(30, 32, 35),
    
    -- ====================================================
    -- PROGRESSION BAR (REBIRTH & QUEST METERS)
    -- ====================================================
    ProgressTrough = Color3.fromRGB(20, 30, 36),     -- Deep recessed background
    ProgressBorder = Color3.fromRGB(12, 18, 22),     -- 2px dark border
    ProgressGradientTop = Color3.fromRGB(255, 200, 0), -- Golden amber top
    ProgressGradientBottom = Color3.fromRGB(255, 106, 0), -- Deep orange bottom
    ProgressBevel = Color3.fromRGB(153, 60, 0),
}

-- ====================================================
-- THE 5 CANONICAL HEADER THEMES
-- ====================================================
CheckUITheme.HeaderThemes = {
    -- 1. Shop (Magenta / Crimson)
    Shop = {
        Top = Color3.fromRGB(255, 20, 150),
        Bottom = Color3.fromRGB(225, 0, 25),
        TopHighlight = Color3.fromRGB(255, 200, 225),
        DamierColor = Color3.fromRGB(150, 0, 20),
        DivDark = Color3.fromRGB(125, 0, 18),
    },
    
    -- 2. Codes (Electric Cyan / Blue)
    Codes = {
        Top = Color3.fromRGB(0, 205, 255),
        Bottom = Color3.fromRGB(0, 130, 245),
        TopHighlight = Color3.fromRGB(180, 240, 255),
        DamierColor = Color3.fromRGB(0, 75, 150),
        DivDark = Color3.fromRGB(0, 50, 110),
    },
    
    -- 3. Settings (Metallic Silver / Chrome)
    Settings = {
        Top = Color3.fromRGB(255, 255, 255),
        Bottom = Color3.fromRGB(215, 222, 232),
        TopHighlight = Color3.fromRGB(255, 255, 255),
        DamierColor = Color3.fromRGB(110, 120, 135),
        DivDark = Color3.fromRGB(90, 100, 112),
    },
    
    -- 4. Rebirth (Royal Purple / Violet)
    Rebirth = {
        Top = Color3.fromRGB(160, 0, 255),
        Bottom = Color3.fromRGB(96, 0, 200),
        TopHighlight = Color3.fromRGB(224, 160, 255),
        DamierColor = Color3.fromRGB(96, 0, 144),
        DivDark = Color3.fromRGB(80, 0, 120),
    },
    
    -- 5. Daily Rewards (Lime Green / Neon)
    DailyRewards = {
        Top = Color3.fromRGB(152, 255, 0),
        Bottom = Color3.fromRGB(80, 208, 0),
        TopHighlight = Color3.fromRGB(224, 255, 176),
        DamierColor = Color3.fromRGB(53, 128, 0),
        DivDark = Color3.fromRGB(37, 96, 0),
    },
}

-- ====================================================
-- CARD BACKGROUND GRADIENTS (FOR GAMEPASSES, DAILY, ETC.)
-- ====================================================
CheckUITheme.CardGradients = {
    -- Double Money Purple
    Purple = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(176, 32, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(112, 0, 224)),
    },
    -- Auto Collect / Daily Sky Blue
    Cyan = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 210, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 120, 255)),
    },
    -- Products / Rebirth Multiplier Lime
    Lime = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 255, 25)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(105, 225, 0)),
    },
    -- Daily Day 5 Magenta
    Magenta = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(208, 0, 224)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(128, 0, 160)),
    },
    -- Daily Day 6 Golden Amber
    Amber = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 170, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(224, 96, 0)),
    },
    -- Day 7 Featured Rainbow / Spectrum Sequence
    Rainbow = ColorSequence.new{
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 30, 80)),   -- Crimson Pink
        ColorSequenceKeypoint.new(0.18, Color3.fromRGB(255, 140, 0)),  -- Orange
        ColorSequenceKeypoint.new(0.35, Color3.fromRGB(255, 230, 0)),  -- Yellow
        ColorSequenceKeypoint.new(0.52, Color3.fromRGB(40, 230, 50)),   -- Green
        ColorSequenceKeypoint.new(0.70, Color3.fromRGB(0, 210, 255)),   -- Cyan
        ColorSequenceKeypoint.new(0.85, Color3.fromRGB(90, 60, 255)),   -- Blue-Violet
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(220, 0, 230)),   -- Magenta
    },
}

CheckUITheme.Typography = {
    Font = Enum.Font.GothamBlack,
    HeaderTitleSize = 38,
    HeaderStrokeSize = 3.2,
    SectionHeaderSize = 24,
    SectionHeaderStrokeSize = 2.8,
    ButtonLabelSize = 26,
    ButtonStrokeSize = 2.8,
    CardTitleSize = 24,
    CardStrokeSize = 2.8,
    SubtitleSize = 14,
    SubtitleStrokeSize = 2.0,
    CloseXSize = 29,
    CloseXStrokeSize = 3.0,
    ProgressTextSize = 22,
    ProgressStrokeSize = 2.6,
    DayLabelSize = 26,
    DayLabelStrokeSize = 3.0,
}

return CheckUITheme
