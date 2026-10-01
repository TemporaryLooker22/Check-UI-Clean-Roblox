--!strict
-- CheckUITheme.luau
-- Central design tokens and asset registry for the Check-UI Design System.

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
    CanvasBorder = Color3.fromRGB(24, 30, 34),      -- #181E22 Deep charcoal border
    
    -- Card Containers
    CardBackground = Color3.fromRGB(26, 44, 52),    -- #1A2C34 Recessed dark container
    CardHighlight = Color3.fromRGB(75, 125, 145),   -- #4B7D91 Subtle slate highlight
    CardBorder = Color3.fromRGB(0, 0, 0),           -- Pure black
    
    -- Close Button 3D Bevel
    CloseBase = Color3.fromRGB(115, 0, 16),         -- #730010 Dark burgundy extrusion
    CloseSepLine = Color3.fromRGB(70, 0, 10),        -- #46000A Separator line
    CloseHighlight = Color3.fromRGB(255, 210, 235), -- #FFD2EB Pastel pink highlight
    
    -- Action / Buy Buttons (Green)
    GreenGradientTop = Color3.fromRGB(180, 255, 25),
    GreenGradientBottom = Color3.fromRGB(105, 225, 0),
    GreenBevel = Color3.fromRGB(15, 120, 15),       -- #0F780F 3D bottom bevel
    GreenHighlight = Color3.fromRGB(235, 255, 130), -- #EBFF82 Lime highlight
    GreenDamier = Color3.fromRGB(40, 160, 20),
    
    -- Toggle / Secondary Buttons (Pink)
    PinkGradientTop = Color3.fromRGB(255, 55, 130),
    PinkGradientBottom = Color3.fromRGB(230, 10, 40),
    PinkBevel = Color3.fromRGB(120, 10, 45),        -- #780A2D 3D bottom bevel
    PinkHighlight = Color3.fromRGB(255, 190, 220),  -- #FFBEDC Pastel pink highlight
    PinkDamier = Color3.fromRGB(140, 10, 40),
    
    -- Disabled / Off Buttons
    OffGradientTop = Color3.fromRGB(80, 85, 90),
    OffGradientBottom = Color3.fromRGB(45, 50, 55),
    OffBevel = Color3.fromRGB(28, 30, 34),
    OffHighlight = Color3.fromRGB(140, 145, 150),
    OffDamier = Color3.fromRGB(30, 32, 35),
}

CheckUITheme.HeaderThemes = {
    Shop = {
        Top = Color3.fromRGB(255, 20, 150),
        Bottom = Color3.fromRGB(225, 0, 25),
        TopHighlight = Color3.fromRGB(255, 200, 225),
        DamierColor = Color3.fromRGB(150, 0, 20),
        DivDark = Color3.fromRGB(125, 0, 18),
    },
    Codes = {
        Top = Color3.fromRGB(0, 205, 255),
        Bottom = Color3.fromRGB(0, 130, 245),
        TopHighlight = Color3.fromRGB(180, 240, 255),
        DamierColor = Color3.fromRGB(0, 75, 150),
        DivDark = Color3.fromRGB(0, 50, 110),
    },
    Settings = {
        Top = Color3.fromRGB(255, 255, 255),
        Bottom = Color3.fromRGB(215, 222, 232),
        TopHighlight = Color3.fromRGB(255, 255, 255),
        DamierColor = Color3.fromRGB(110, 120, 135),
        DivDark = Color3.fromRGB(90, 100, 112),
    },
}

CheckUITheme.Typography = {
    Font = Enum.Font.GothamBlack,
    HeaderTitleSize = 38,
    HeaderStrokeSize = 3.2,
    ButtonLabelSize = 26,
    ButtonStrokeSize = 2.8,
    CardTitleSize = 24,
    CardStrokeSize = 2.8,
    SubtitleSize = 14,
    SubtitleStrokeSize = 2.0,
    CloseXSize = 29,
    CloseXStrokeSize = 3.0,
}

return CheckUITheme
