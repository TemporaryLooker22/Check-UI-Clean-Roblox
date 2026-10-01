---
name: check-ui-clean-roblox
description: >-
  Ultra-complete Design System and implementation skill for creating production-grade,
  cartoon/simulator UI in Roblox Studio (Check-UI standard). Enforces strict GothamBlack typography,
  solid slate canvas (#3b5866), 3D beveled square close buttons, 2-tier header drop shadow dividers,
  seamless vertical checkerboard gradients, continuous rotating sunbursts, multi-device responsive UIScale engine,
  the 5 canonical simulator menu archetypes (Shop, Codes, Rebirth, Settings, Daily Rewards),
  Button State Triad (Claim, Claimed, Locked, Skip), and 1022 production-ready HD icons via CheckUIIcons registry.
---

# Check-UI — Clean Roblox UI Design System & Implementation Skill

## 1. Skill Overview & Purpose

**Check-UI** is the definitive design system standard for modern Roblox cartoon, simulator, and tycoon games (inspired by top-tier titles like Pet Simulator 99, Anime Champions, and Blade Ball).

This skill equips any AI agent or human developer with the exact mathematical proportions, color formulas, component architectures, Luau implementations, and responsive scaling mechanisms required to produce pixel-perfect, cohesive, and non-generic Roblox interfaces.

### Core Tenets (Non-Negotiable Rules)
1. **Zero AI Slop / Generic Looks**: Every frame must have intentional cartoon depth, high-contrast borders, pastel highlight strokes, and tactile micro-interactions.
2. **Strict Typography**: Every title, label, counter, button, and text box **must** use `Enum.Font.GothamBlack` with black outline `UIStroke` (thickness proportional to font size: 2.0px to 3.5px).
3. **Solid Canvas (`#3b5866`)**: Never make window backgrounds semi-transparent. Always use solid slate blue `Color3.fromRGB(59, 88, 102)` with `UICorner` (4px) and outer `UIStroke` (3.5px, `#181e22`).
4. **Signature 3D Beveled Square Close Button `[X]`**: Exact 38x38px square with a dark burgundy bottom bevel extrusion (`#730010`), shifted face with vibrant crimson/pink gradient (`#ff7daf` to `#ff1428`), inner pastel stroke highlight, GothamBlack "X", and centered `UIScale`.
5. **2-Tier 3D Header Shadow Divider**: Every header must end with a 2-line separator: an upper 3px dark thematic accent bar + a lower 3px solid black bar.
6. **Seamless Checkerboard (Damier) Fade**: Full-height texture overlay (`rbxassetid://385956923`) with a vertical `UIGradient` transparency sequence (`1 -> 0.82 -> 0.35 -> 0.10`) to eliminate hard cutoff lines.
7. **Aspect Ratio Preservation**: Icons must **never** be stretched. Always set `ScaleType = Enum.ScaleType.Fit`.
8. **Universal Responsive Scaling**: All modal windows and HUDs must be governed by dynamic `UIScale` responsive calculations based on `camera.ViewportSize` (baseline `1050 x 620`, clamped `[0.52, 1.18]`).
9. **Center-Anchored Interactions**: ALL hover, click, and scale animations MUST originate from the exact geometric center via `AnchorPoint = Vector2.new(0.5, 0.5)` + child `UIScale`.
10. **The 5 Canonical Menu Archetypes**: All game interfaces should follow one of the 5 canonical specifications: Shop, Codes, Rebirth, Settings, or Daily Rewards.

---

## 2. Palette & Visual Constants

### 2.1 Universal Theme Colors

| Element | Color3 (RGB) | Hex | Purpose / Notes |
|:---|:---|:---|:---|
| **Window Background** | `59, 88, 102` | `#3B5866` | Solid, opaque cartoon slate blue canvas |
| **Outer Border Stroke** | `24, 30, 34` | `#181E22` | 3.5px outer window outline (`ApplyStrokeMode.Border`) |
| **Card / Container BG** | `26, 44, 52` | `#1A2C34` | Recessed dark container for items, codes, settings |
| **Card Inner Highlight**| `75, 125, 145` | `#4B7D91` | 1.2px inner highlight stroke (transparency 0.4) |
| **Requirements Box** | `20, 34, 42` | `#14222A` | Recessed container for Rebirth/Quest requirements |
| **Requirements Border** | `85, 140, 160` | `#558CA0` | 1.2px solid highlight border for requirements box |
| **Close Btn Base (3D)** | `115, 0, 16` | `#730010` | 3D extrusion bottom bevel for `[X]` button |
| **Close Btn Sep Line** | `70, 0, 10` | `#46000A` | 1px horizontal separator line at bottom bevel |
| **Close Inner Highlight**| `255, 210, 235`| `#FFD2EB` | 1.2px pastel highlight stroke on close face |

### 2.2 The 5 Canonical Header Themes

Each modal possesses a distinct header gradient while sharing the identical 60px height, 2-tier 3D divider bar, top highlight, and fading damier:

```lua
-- 1. SHOP (Magenta / Crimson)
HeaderGradient = { Color3.fromRGB(255, 20, 150), Color3.fromRGB(225, 0, 25) }
TopHighlight   = Color3.fromRGB(255, 200, 225)
DamierColor    = Color3.fromRGB(150, 0, 20)
DivDarkColor   = Color3.fromRGB(125, 0, 18)

-- 2. CODES (Cyan / Electric Blue)
HeaderGradient = { Color3.fromRGB(0, 205, 255), Color3.fromRGB(0, 130, 245) }
TopHighlight   = Color3.fromRGB(180, 240, 255)
DamierColor    = Color3.fromRGB(0, 75, 150)
DivDarkColor   = Color3.fromRGB(0, 50, 110)

-- 3. SETTINGS (Silver / Metallic White)
HeaderGradient = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(215, 222, 232) }
TopHighlight   = Color3.fromRGB(255, 255, 255)
DamierColor    = Color3.fromRGB(110, 120, 135)
DivDarkColor   = Color3.fromRGB(90, 100, 112)

-- 4. REBIRTH (Royal Purple / Violet)
HeaderGradient = { Color3.fromRGB(160, 0, 255), Color3.fromRGB(96, 0, 200) }
TopHighlight   = Color3.fromRGB(224, 160, 255)
DamierColor    = Color3.fromRGB(96, 0, 144)
DivDarkColor   = Color3.fromRGB(80, 0, 120)

-- 5. DAILY REWARDS (Lime Neon Green)
HeaderGradient = { Color3.fromRGB(152, 255, 0), Color3.fromRGB(80, 208, 0) }
TopHighlight   = Color3.fromRGB(224, 255, 176)
DamierColor    = Color3.fromRGB(53, 128, 0)
DivDarkColor   = Color3.fromRGB(37, 96, 0)
```

### 2.3 The Button State Triad & Specialized Buttons

```lua
-- CLAIM / BUY / REDEEM (Lime Green)
ClaimGrad      = { Color3.fromRGB(180, 255, 25), Color3.fromRGB(105, 225, 0) }
ClaimBevel     = Color3.fromRGB(15, 120, 15)       -- #0F780F 3D bottom bevel
ClaimHighlight = Color3.fromRGB(235, 255, 130)     -- #EBFF82 Pastel lime stroke
ClaimDamier    = Color3.fromRGB(40, 160, 20)

-- CLAIMED / DISABLED (Metallic Silver)
ClaimedGrad      = { Color3.fromRGB(216, 222, 228), Color3.fromRGB(148, 160, 176) }
ClaimedBevel     = Color3.fromRGB(72, 82, 96)      -- #485260 Dark slate bevel
ClaimedHighlight = Color3.fromRGB(255, 255, 255)
ClaimedDamier    = Color3.fromRGB(96, 104, 112)

-- LOCKED / DESTRUCTIVE (Crimson Red)
LockedGrad      = { Color3.fromRGB(255, 32, 80), Color3.fromRGB(208, 0, 32) }
LockedBevel     = Color3.fromRGB(112, 0, 16)       -- #700010 Burgundy bevel
LockedHighlight = Color3.fromRGB(255, 176, 200)
LockedDamier    = Color3.fromRGB(144, 0, 24)

-- SKIP (Header Action Button - Golden Amber)
SkipGrad      = { Color3.fromRGB(255, 208, 0), Color3.fromRGB(255, 140, 0) }
SkipBevel     = Color3.fromRGB(153, 76, 0)         -- #994C00 Dark amber bevel
SkipHighlight = Color3.fromRGB(255, 240, 160)
SkipDamier    = Color3.fromRGB(176, 96, 0)

-- MUSIC ON / FEATURE (Hot Pink / Magenta)
MusicOnGrad      = { Color3.fromRGB(255, 20, 128), Color3.fromRGB(212, 0, 85) }
MusicOnBevel     = Color3.fromRGB(120, 10, 45)     -- #780A2D
MusicOnHighlight = Color3.fromRGB(255, 176, 208)
MusicOnDamier    = Color3.fromRGB(160, 0, 64)
```

### 2.4 Card Background Gradients (Including Day 7 Rainbow)

```lua
-- Cyan Card (Auto Collect, Daily Days 1-3):
ColorSequence.new(Color3.fromRGB(0, 210, 255), Color3.fromRGB(0, 120, 255))

-- Purple Card (Double Money, Daily Day 4):
ColorSequence.new(Color3.fromRGB(176, 32, 255), Color3.fromRGB(112, 0, 224))

-- Lime Card (Products, Rebirth Multipliers):
ColorSequence.new(Color3.fromRGB(180, 255, 25), Color3.fromRGB(105, 225, 0))

-- Magenta Card (Daily Day 5):
ColorSequence.new(Color3.fromRGB(208, 0, 224), Color3.fromRGB(128, 0, 160))

-- Amber Card (Daily Day 6):
ColorSequence.new(Color3.fromRGB(255, 170, 0), Color3.fromRGB(224, 96, 0))

-- Day 7 Signature Rainbow / Spectrum Sequence (Rotation = 45 deg):
ColorSequence.new{
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 30, 80)),
    ColorSequenceKeypoint.new(0.18, Color3.fromRGB(255, 140, 0)),
    ColorSequenceKeypoint.new(0.35, Color3.fromRGB(255, 230, 0)),
    ColorSequenceKeypoint.new(0.52, Color3.fromRGB(40, 230, 50)),
    ColorSequenceKeypoint.new(0.70, Color3.fromRGB(0, 210, 255)),
    ColorSequenceKeypoint.new(0.85, Color3.fromRGB(90, 60, 255)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(220, 0, 230)),
}
```

### 2.5 Verified Asset IDs

- **Checkerboard Texture (Damier)**: `rbxassetid://385956923`
- **Faded Sunburst Bloom**: `rbxassetid://130563114903838`
- **Cash Stacks Icon**: `rbxassetid://88694661500877`
- **Character / Player Icon**: `rbxassetid://77589096360120`
- **White Robux Icon**: `rbxassetid://132185731364109`
- **Hover SFX**: `rbxassetid://6895079853`
- **Click SFX**: `rbxassetid://6895079853`

---

## 3. Component Construction Recipes

### 3.1 Signature 3D Beveled Square Close Button `[X]`

```lua
local function createCloseButton(header)
    local CloseBtn = Instance.new("ImageButton")
    CloseBtn.Name = "CloseButton"
    CloseBtn.Size = UDim2.new(0, 38, 0, 38)
    CloseBtn.Position = UDim2.new(1, -34, 0.5, -2)
    CloseBtn.AnchorPoint = Vector2.new(0.5, 0.5)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(115, 0, 16) -- Dark 3D bevel base
    CloseBtn.BorderSizePixel = 0
    CloseBtn.AutoButtonColor = false
    CloseBtn.ClipsDescendants = false
    CloseBtn.ZIndex = 25
    CloseBtn.Parent = header

    local closeStroke = Instance.new("UIStroke")
    closeStroke.Color = Color3.fromRGB(0, 0, 0)
    closeStroke.Thickness = 2.8
    closeStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    closeStroke.Parent = CloseBtn

    -- Upper Face (Shifted up by 4px to reveal bottom bevel)
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
    xStroke.Thickness = 3.0
    xStroke.Parent = closeX

    local closeScale = Instance.new("UIScale")
    closeScale.Name = "ButtonScale"
    closeScale.Scale = 1
    closeScale.Parent = CloseBtn

    return CloseBtn
end
```

### 3.2 Header Action Button (`Skip`)

```lua
local function createHeaderButton(header, text, offsetRight)
    local btn = Instance.new("ImageButton")
    btn.Name = text .. "Button"
    btn.Size = UDim2.new(0, 84, 0, 36)
    btn.Position = UDim2.new(1, offsetRight or -86, 0.5, -2)
    btn.AnchorPoint = Vector2.new(0.5, 0.5)
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.ClipsDescendants = true
    btn.ZIndex = 25
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
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 208, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 140, 0))
    }
    grad.Rotation = 90
    grad.Parent = btn

    local bevel = Instance.new("Frame")
    bevel.Name = "Bevel"
    bevel.Size = UDim2.new(1, 0, 0, 3)
    bevel.Position = UDim2.new(0, 0, 1, -3)
    bevel.BackgroundColor3 = Color3.fromRGB(153, 76, 0)
    bevel.BorderSizePixel = 0
    bevel.ZIndex = 26
    bevel.Parent = btn

    local innerHighlight = Instance.new("Frame")
    innerHighlight.Size = UDim2.new(1, -4, 1, -4)
    innerHighlight.Position = UDim2.new(0.5, 0, 0.5, 0)
    innerHighlight.AnchorPoint = Vector2.new(0.5, 0.5)
    innerHighlight.BackgroundTransparency = 1
    innerHighlight.BorderSizePixel = 0
    innerHighlight.ZIndex = 27
    innerHighlight.Parent = btn

    local innerStroke = Instance.new("UIStroke")
    innerStroke.Color = Color3.fromRGB(255, 240, 160)
    innerStroke.Thickness = 1.2
    innerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    innerStroke.Parent = innerHighlight

    local label = Instance.new("TextLabel")
    label.Text = text
    label.Font = Enum.Font.GothamBlack
    label.TextSize = 24
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.ZIndex = 28
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
```

### 3.3 Progression Bar (Orange-to-Gold Fill with Recessed Trough)

```lua
local function createProgressBar(parent, progress, text, size, position)
    local trough = Instance.new("Frame")
    trough.Name = "ProgressTrough"
    trough.Size = size
    trough.Position = position
    trough.AnchorPoint = Vector2.new(0.5, 0)
    trough.BackgroundColor3 = Color3.fromRGB(20, 30, 36)
    trough.BorderSizePixel = 0
    trough.ClipsDescendants = true
    trough.ZIndex = 24
    trough.Parent = parent

    local tStroke = Instance.new("UIStroke")
    tStroke.Color = Color3.fromRGB(12, 18, 22)
    tStroke.Thickness = 2.0
    tStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    tStroke.Parent = trough

    local fill = Instance.new("Frame")
    fill.Name = "ProgressFill"
    local pct = math.clamp(progress, 0, 1)
    fill.Size = UDim2.new(pct, 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    fill.BorderSizePixel = 0
    fill.ZIndex = 25
    fill.Parent = trough

    local fillGrad = Instance.new("UIGradient")
    fillGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 106, 0))
    }
    fillGrad.Rotation = 90
    fillGrad.Parent = fill

    local bevel = Instance.new("Frame")
    bevel.Size = UDim2.new(1, 0, 0, 2)
    bevel.Position = UDim2.new(0, 0, 1, -2)
    bevel.BackgroundColor3 = Color3.fromRGB(153, 60, 0)
    bevel.BorderSizePixel = 0
    bevel.ZIndex = 26
    bevel.Parent = fill

    local label = Instance.new("TextLabel")
    label.Text = text or (string.format("%d%% Completed", math.floor(pct * 100)))
    label.Font = Enum.Font.GothamBlack
    label.TextSize = 22
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Position = UDim2.new(0.5, 0, 0.5, 0)
    label.AnchorPoint = Vector2.new(0.5, 0.5)
    label.BackgroundTransparency = 1
    label.ZIndex = 27
    label.Parent = trough

    local lStroke = Instance.new("UIStroke")
    lStroke.Color = Color3.fromRGB(0, 0, 0)
    lStroke.Thickness = 2.6
    lStroke.Parent = label

    return trough
end
```

---

## 4. Multi-Device Responsive Scaling Engine

```lua
local camera = workspace.CurrentCamera

local function getDeviceScale()
    local viewport = camera.ViewportSize
    if viewport.X <= 0 or viewport.Y <= 0 then return 1 end
    -- Baseline resolution: 1050 x 620
    local scaleX = viewport.X / 1050
    local scaleY = viewport.Y / 620
    local factor = math.min(scaleX, scaleY)
    -- Clamped between 0.52 (smartphones) and 1.18 (desktop)
    return math.clamp(factor, 0.52, 1.18)
end

local function updateAllDeviceScales()
    local currentScale = getDeviceScale()
    for _, gui in ipairs(playerGui:GetChildren()) do
        if gui:IsA("ScreenGui") then
            for _, frame in ipairs(gui:GetChildren()) do
                local sc = frame:FindFirstChild("WindowScale")
                if sc and sc:IsA("UIScale") and frame.Visible then
                    sc.Scale = currentScale
                end
            end
        end
    end
end

camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateAllDeviceScales)
```

---

## 5. Center-Anchored Animation Rules & Micro-Interactions

### 5.1 The Center-Anchor Mandate
ALL interactive elements MUST use `AnchorPoint = Vector2.new(0.5, 0.5)`. Scaling then animates uniformly from the visual center.

```lua
local function bindButtonAnimations(btn, scaleObj, hoverFactor, clickFactor)
    assert(btn.AnchorPoint == Vector2.new(0.5, 0.5),
        "[Check-UI] Button '" .. btn.Name .. "' must have AnchorPoint (0.5, 0.5)!")

    local tweenInfoHover = TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tweenInfoClick = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tweenInfoRelease = TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

    btn.MouseEnter:Connect(function()
        playSound(hoverSound)
        TweenService:Create(scaleObj, tweenInfoHover, { Scale = hoverFactor or 1.05 }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(scaleObj, tweenInfoHover, { Scale = 1.0 }):Play()
    end)
    btn.MouseButton1Down:Connect(function()
        playSound(clickSound)
        TweenService:Create(scaleObj, tweenInfoClick, { Scale = clickFactor or 0.94 }):Play()
    end)
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(scaleObj, tweenInfoRelease, { Scale = hoverFactor or 1.05 }):Play()
    end)
end
```

---

## 6. Continuous Rotating Sunbursts

```lua
local SUNBURST_SPEED = 20 -- degrees per second
RunService.RenderStepped:Connect(function(dt)
    if modalWindow.Visible then
        local delta = SUNBURST_SPEED * dt
        for _, sb in ipairs(sunbursts) do
            sb.Rotation = (sb.Rotation + delta) % 360
        end
    end
end)
```

---

## 7. CheckUIIcons — Production HD Icon Registry (1,022 Icons)

Check-UI ships with **1,022 production-grade HD icons (256px)** pre-uploaded as `rbxassetid://` across 10 categories:
- **Animal** (12), **Currency** (110), **Exclusive** (32), **Food** (48), **Item** (326), **Main** (236), **Nature** (86), **Player** (74), **Social** (24), **UI** (74).

```lua
local CheckUIIcons = require(game.ReplicatedStorage.CheckUI.CheckUIIcons)

-- Direct lookup
local cash = CheckUIIcons.Currency.Cash.Golden_Cash_1st
local player = CheckUIIcons.Player.Player.Player_1st

-- Path lookup
local sword = CheckUIIcons.Get("Item/Sword/Sword 1st")

-- Fuzzy search
local results = CheckUIIcons.Search("diamond")
```

---

## 8. Implementation Checklist

When building any Check-UI interface:
- [ ] **Font**: ALL text uses `Enum.Font.GothamBlack` — no exceptions
- [ ] **Canvas**: Window background is solid `#3B5866` with `BackgroundTransparency = 0`
- [ ] **Close Button**: Uses the exact 38x38 3D beveled square recipe from §3.1
- [ ] **Header Divider**: 2-tier shadow (thematic dark line 3px + pure black 3px)
- [ ] **Damier**: Full-height with 4-point vertical `UIGradient` (no horizontal cutoffs)
- [ ] **Icons**: `ScaleType = Enum.ScaleType.Fit` — never stretched
- [ ] **AnchorPoints**: ALL interactive elements use `AnchorPoint = (0.5, 0.5)` with centered `UIScale`
- [ ] **Button State Triad**: Uses the appropriate color/bevel for `Claim` (Lime), `Claimed` (Silver), `Locked` (Red)
- [ ] **Responsive**: Governed by dynamic `UIScale` based on `ViewportSize` [0.52, 1.18]
- [ ] **Sunbursts**: Rotating at 20°/sec, paused when hidden
- [ ] **Bevels**: 3px dark bottom extrusion on all buttons
