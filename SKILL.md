---
name: check-ui-clean-roblox
description: >-
  Ultra-complete Design System and implementation skill for creating production-grade,
  cartoon/simulator UI in Roblox Studio (Check-UI standard). Enforces strict GothamBlack typography,
  solid slate canvas (#3b5866), 3D beveled square close buttons, 2-tier header drop shadow dividers,
  seamless vertical checkerboard gradients, continuous rotating sunbursts, multi-device responsive UIScale engine,
  and 1022 production-ready HD icons via CheckUIIcons registry.
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
9. **Center-Anchored Interactions**: ALL hover, click, and scale animations MUST originate from the exact geometric center of the element. See [Section 5](#5-center-anchored-animation-rules--micro-interactions).

---

## 2. Palette & Visual Constants

### 2.1 Universal Theme Colors

| Element | Color3 (RGB) | Hex | Purpose / Notes |
| :--- | :--- | :--- | :--- |
| **Window Background** | `59, 88, 102` | `#3B5866` | Solid, opaque cartoon slate blue canvas |
| **Outer Border Stroke** | `24, 30, 34` | `#181E22` | 3.5px outer window outline (`ApplyStrokeMode.Border`) |
| **Card / Container BG** | `26, 44, 52` | `#1A2C34` | Recessed dark container for items, codes, settings |
| **Card Inner Highlight**| `75, 125, 145` | `#4B7D91` | 1.2px inner highlight stroke (transparency 0.4) |
| **Close Btn Base (3D)** | `115, 0, 16` | `#730010` | 3D extrusion bottom bevel for `[X]` button |
| **Close Btn Sep Line**  | `70, 0, 10` | `#46000A` | 1px horizontal separator line at bottom bevel |
| **Green Button Bevel**  | `15, 120, 15` | `#0F780F` | 3px bottom 3D bevel for Buy / Redeem / SFX On |
| **Pink Button Bevel**   | `120, 10, 45` | `#780A2D` | 3px bottom 3D bevel for Music On / Destructive |
| **Off Button Bevel**    | `28, 30, 34` | `#1C1E22` | 3px bottom bevel when toggle is Off |

### 2.2 Header Themes

Each modal possesses a distinct header gradient while sharing the identical 60px height, 2-tier 3D divider bar, top highlight, and fading damier:

```lua
-- SHOP (Magenta / Crimson)
HeaderGradient = { Color3.fromRGB(255, 20, 150), Color3.fromRGB(225, 0, 25) }
TopHighlight   = Color3.fromRGB(255, 200, 225)
DamierColor    = Color3.fromRGB(150, 0, 20)
DivDarkColor   = Color3.fromRGB(125, 0, 18)

-- CODES (Cyan / Electric Blue)
HeaderGradient = { Color3.fromRGB(0, 205, 255), Color3.fromRGB(0, 130, 245) }
TopHighlight   = Color3.fromRGB(180, 240, 255)
DamierColor    = Color3.fromRGB(0, 75, 150)
DivDarkColor   = Color3.fromRGB(0, 50, 110)

-- SETTINGS (Silver / Metallic White)
HeaderGradient = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(215, 222, 232) }
TopHighlight   = Color3.fromRGB(255, 255, 255)
DamierColor    = Color3.fromRGB(110, 120, 135)
DivDarkColor   = Color3.fromRGB(90, 100, 112)
```

### 2.3 Verified Asset IDs

- **Checkerboard Texture (Damier)**: `rbxassetid://385956923`
- **Faded Sunburst Bloom**: `rbxassetid://130563114903838`
- **Cash Stacks Icon**: `rbxassetid://88694661500877`
- **Character / Player Icon**: `rbxassetid://77589096360120`
- **White Robux Icon**: `rbxassetid://132185731364109`
- **Hover SFX**: `rbxassetid://6895079853`
- **Click SFX**: `rbxassetid://6895079853` (or custom sound)

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

### 3.2 Action / Buy / Redeem Button with 3D Bevel & Seamless Damier

```lua
local function create3DButton(props)
    -- props: { Name, Size, Position, AnchorPoint, Parent, Text, TextSize, BaseColor, BevelColor, HighlightColor, DamierColor, ZIndex }
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
        ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 255, 25)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(105, 225, 0))
    }
    grad.Rotation = 90
    grad.Parent = btn

    -- 3D Extrusion Bevel Frame at bottom
    local bevel = Instance.new("Frame")
    bevel.Name = "Frame"
    bevel.Size = UDim2.new(1, 0, 0, 3)
    bevel.Position = UDim2.new(0, 0, 1, -3)
    bevel.BackgroundColor3 = props.BevelColor or Color3.fromRGB(15, 120, 15)
    bevel.BorderSizePixel = 0
    bevel.ZIndex = (props.ZIndex or 25) + 1
    bevel.Parent = btn

    -- Inner Pastel Highlight Stroke
    local innerHighlight = Instance.new("Frame")
    innerHighlight.Name = "InnerHighlight"
    innerHighlight.Size = UDim2.new(1, -4, 1, -4)
    innerHighlight.Position = UDim2.new(0.5, 0, 0.5, 0)
    innerHighlight.AnchorPoint = Vector2.new(0.5, 0.5)
    innerHighlight.BackgroundTransparency = 1
    innerHighlight.BorderSizePixel = 0
    innerHighlight.ZIndex = (props.ZIndex or 25) + 2
    innerHighlight.Parent = btn

    local innerStroke = Instance.new("UIStroke")
    innerStroke.Name = "InnerStroke"
    innerStroke.Color = props.HighlightColor or Color3.fromRGB(235, 255, 130)
    innerStroke.Thickness = 1.2
    innerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    innerStroke.Parent = innerHighlight

    -- Seamless Fading Damier (No horizontal cutoff lines!)
    local damier = Instance.new("ImageLabel")
    damier.Name = "Checkerboard"
    damier.Size = UDim2.new(1, 0, 1, 0)
    damier.Position = UDim2.new(0, 0, 0, 0)
    damier.BackgroundTransparency = 1
    damier.Image = "rbxassetid://385956923"
    damier.ScaleType = Enum.ScaleType.Tile
    damier.TileSize = UDim2.new(0, 18, 0, 18)
    damier.ImageColor3 = props.DamierColor or Color3.fromRGB(40, 160, 20)
    damier.ImageTransparency = 0.3
    damier.ZIndex = (props.ZIndex or 25) + 1
    damier.Parent = btn

    local damierGrad = Instance.new("UIGradient")
    damierGrad.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.3, 0.82),
        NumberSequenceKeypoint.new(0.7, 0.35),
        NumberSequenceKeypoint.new(1, 0.10)
    }
    damierGrad.Rotation = 90
    damierGrad.Parent = damier

    -- Label
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Text = props.Text or "Click"
    label.Font = Enum.Font.GothamBlack
    label.TextSize = props.TextSize or 26
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.ZIndex = (props.ZIndex or 25) + 3
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

---

## 4. Multi-Device Responsive Scaling Engine

To guarantee pixel-perfect rendering across mobile phones, tablets, PCs, and 4K monitors:

```lua
local camera = workspace.CurrentCamera

local function getDeviceScale()
    local viewport = camera.ViewportSize
    if viewport.X <= 0 or viewport.Y <= 0 then return 1 end
    -- Baseline resolution: 1050 x 620
    local scaleX = viewport.X / 1050
    local scaleY = viewport.Y / 620
    local factor = math.min(scaleX, scaleY)
    -- Clamped between 0.52 (small smartphones) and 1.18 (desktop / large monitors)
    return math.clamp(factor, 0.52, 1.18)
end

local function updateAllDeviceScales()
    local currentScale = getDeviceScale()
    if leftHUDScale then leftHUDScale.Scale = currentScale end
    if currencyHUDScale then currencyHUDScale.Scale = currentScale end
    if mainFrame.Visible then windowScale.Scale = currentScale end
    if settingsFrame.Visible then settingsScale.Scale = currentScale end
    if shopFrame.Visible then shopScaleWindow.Scale = currentScale end
end

camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateAllDeviceScales)
```

---

## 5. Center-Anchored Animation Rules & Micro-Interactions

### 5.1 The Center-Anchor Mandate (Non-Negotiable)

**ALL hover, click, press, and scale animations MUST originate from the exact geometric center of the element.** This is achieved by combining two mandatory properties:

```lua
-- MANDATORY for EVERY interactive element (buttons, cards, icons, modals):
element.AnchorPoint = Vector2.new(0.5, 0.5)  -- Pivot at exact center
element.Position = UDim2.new(X_SCALE, X_OFFSET, Y_SCALE, Y_OFFSET) -- Positioned BY its center
```

Then attach a `UIScale` child which will scale from the anchor point (center):

```lua
local uiScale = Instance.new("UIScale")
uiScale.Name = "ButtonScale"  -- or "CardScale", "IconScale", etc.
uiScale.Scale = 1
uiScale.Parent = element
```

### 5.2 Why Center-Anchored? (Mathematical Explanation)

Roblox's `UIScale` scales from the element's `AnchorPoint`. If `AnchorPoint = (0, 0)` (top-left default), scaling grows the element downward-right, creating a visually asymmetric "stretching" effect. By setting `AnchorPoint = (0.5, 0.5)`, the element expands equally in all 4 directions from its visual center, producing the industry-standard "pop" effect seen in Pet Simulator 99 and Blade Ball.

```
  ❌ AnchorPoint (0, 0):              ✅ AnchorPoint (0.5, 0.5):
  +--------+                          +--------+
  |████████| → Scale 1.1 →            |████████| → Scale 1.1 →
  +--------+                          +--------+
  +----------+                         +----------+
  |██████████|  (grows down-right)     |██████████|  (grows uniformly from center)
  |██████████|                         +----------+
  +----------+
```

### 5.3 Animation Binding Pattern

```lua
local function bindButtonAnimations(btn, scaleObj, hoverFactor, clickFactor)
    -- PRECONDITION: btn.AnchorPoint MUST be Vector2.new(0.5, 0.5)
    -- PRECONDITION: scaleObj is a UIScale parented to btn
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

### 5.4 Pop Modal Open / Close (Center-Origin)

```lua
-- Open: Scale starts at targetScale * 0.72 with Y + 16px offset
-- Tweens to targetScale in 0.24s with EasingStyle.Back.Out
-- Close: Tweens to currentScale * 0.70 with Y + 14px offset
-- in 0.14s with EasingStyle.Back.In, then sets Visible = false
```

### 5.5 Tween Values Quick Reference

| Event | Target Scale | Duration | Easing | Sound |
|:---|:---|:---|:---|:---|
| **Hover In** | `1.05` | `0.08s` | `Quad.Out` | HoverSound |
| **Hover Out** | `1.00` | `0.08s` | `Quad.Out` | — |
| **Mouse Down** | `0.94` | `0.05s` | `Quad.Out` | ClickSound |
| **Mouse Up** | `1.05` | `0.12s` | `Back.Out` | — |
| **Modal Open** | `targetScale` from `targetScale * 0.72` | `0.24s` | `Back.Out` | — |
| **Modal Close** | `currentScale * 0.70` | `0.14s` | `Back.In` | — |

---

## 6. Continuous Rotating Sunbursts

```lua
local sunbursts = {}
for _, desc in ipairs(shopFrame:GetDescendants()) do
    if desc.Name == "Sunburst" and desc:IsA("ImageLabel") then
        table.insert(sunbursts, desc)
    end
end

local SUNBURST_SPEED = 20 -- degrees per second (smooth, relaxed)
RunService.RenderStepped:Connect(function(dt)
    if shopFrame.Visible then
        local delta = SUNBURST_SPEED * dt
        for _, sb in ipairs(sunbursts) do
            sb.Rotation = (sb.Rotation + delta) % 360
        end
    end
end)
```

---

## 7. CheckUIIcons — Production HD Icon Registry (1,022 Icons)

### 7.1 Overview

The `CheckUIIcons` module provides instant access to **1,022 production-grade HD icons (256px)** across **10 categories** and **130 subcategories**, all pre-uploaded to Roblox as `rbxassetid://` assets. No more placeholder icons, no more uploading manually.

### 7.2 Installation

Place `src/CheckUIIcons.luau` as a `ModuleScript` inside `ReplicatedStorage.CheckUI`:

```
ReplicatedStorage
└── CheckUI
    ├── CheckUITheme          (ModuleScript)
    ├── CheckUIComponents     (ModuleScript)
    ├── CheckUIController     (ModuleScript)
    └── CheckUIIcons          (ModuleScript) ← 1,022 icons registry
```

### 7.3 Usage

```lua
local CheckUIIcons = require(game.ReplicatedStorage.CheckUI.CheckUIIcons)

-- Direct table access (fastest, no overhead):
local coinIcon = CheckUIIcons.Currency.Coin.Golden_Coin_1st
-- Result: "rbxassetid://..." (ready to use as Image property)

-- Path-based lookup via Get():
local swordIcon = CheckUIIcons.Get("Item/Sword/Sword 1st")

-- Fuzzy search via Search():
local results = CheckUIIcons.Search("crown")
-- Returns: { { Path = "Item/Crown/Crown 1st", AssetId = "rbxassetid://..." }, ... }

-- Apply to an ImageLabel:
local icon = Instance.new("ImageLabel")
icon.Image = CheckUIIcons.Currency.Cash.Golden_Cash_1st
icon.ScaleType = Enum.ScaleType.Fit  -- MANDATORY: Never stretch icons!
```

### 7.4 Complete Icon Catalog

**Total: 1,022 icons | 10 categories | 130 subcategories**

#### 🐾 Animal (12 icons, 3 subcategories)
| Subcategory | Count | Sample Icon | Sample Asset ID |
|:---|:---|:---|:---|
| **Bunny** | 4 | `Bunny_1st` | `rbxassetid://107471473111631` |
| **Cat** | 4 | `Cat_1st` | `rbxassetid://126233304381053` |
| **Dog** | 4 | `Dog_1st` | `rbxassetid://94720044097792` |

#### 💰 Currency (110 icons, 8 subcategories)
| Subcategory | Count | Sample Icon | Sample Asset ID |
|:---|:---|:---|:---|
| **Cash** | 10 | `Blue_Cash_1st` | `rbxassetid://84261505275861` |
| **Coin** | 20 | `Golden_Coin_1st` | via `CheckUIIcons.Currency.Coin.Golden_Coin_1st` |
| **Crystal** | 10 | `Blue_Crystal_1st` | via `CheckUIIcons.Currency.Crystal.Blue_Crystal_1st` |
| **Diamond** | 20 | `Blue_Diamond_1st` | via `CheckUIIcons.Currency.Diamond.Blue_Diamond_1st` |
| **Ingot** | 14 | `Golden_Ingot_1st` | via `CheckUIIcons.Currency.Ingot.Golden_Ingot_1st` |
| **Premium** | 20 | via direct access | via `CheckUIIcons.Currency.Premium` |
| **Robux** | 8 | via direct access | via `CheckUIIcons.Currency.Robux` |
| **Ticket** | 8 | via direct access | via `CheckUIIcons.Currency.Ticket` |

#### ⭐ Exclusive (32 icons, 8 subcategories)
| Subcategory | Count | Sample |
|:---|:---|:---|
| **Angel Heart** | 4 | `Angel_Heart_1st` → `rbxassetid://93345130450401` |
| **Aura** | 4 | via `CheckUIIcons.Exclusive.Aura` |
| **Aura 2** | 4 | via `CheckUIIcons.Exclusive["Aura 2"]` |
| **Magical Teleport** | 4 | via `CheckUIIcons.Exclusive.Magical_Teleport` |
| **Toilet with Head** | 4 | via `CheckUIIcons.Exclusive.Toilet_with_Head` |
| **Trail** | 4 | via `CheckUIIcons.Exclusive.Trail` |
| **Tung** | 4 | via `CheckUIIcons.Exclusive.Tung` |
| **VIP** | 4 | via `CheckUIIcons.Exclusive.VIP` |

#### 🍔 Food (48 icons, 9 subcategories)
`Avocado` · `Bait (Fishing)` · `Blueberry` · `Burger` · `Carrot` · `Cookie` · `Lemon` · `Pancake` · `Pizza`

#### 🛠️ Item (326 icons, 38 subcategories) — **Largest category**
`Axe` · `Backpack` · `Balloon` · `Bomb` · `Book` · `Box` · `Bubble Gum` · `Calendar` · `Chest` · `Clock` · `Coil` · `Cracked Egg` · `Credit Card` · `Crown` · `Dice` · `Egg` · `Gift` · `Gum` · `Hammer` · `Key` · `Location Pin` · `Lock` · `Lucky Block` · `Magnet` · `Medal` · `Newspaper` · `Pencil` · `Potion` · `Rocket` · `Scroll` · `Shield` · `Shoe` · `Shovel` · `Sword` · `Target` · `Teleporter` · `Torch` · `Trophy`

#### 🏠 Main (236 icons, 27 subcategories) — **UI essentials**
`Broken Heart` · `Codes` · `Downgrade` · `Fire` · `Fire 2` · `Heart` · `House` · `Hoverboard` · `Lighting` · `Magnifying Glass` · `Music OFF` · `Music ON` · `Paw` · `Rebirth and Auto Open` · `Save` · `Settings` · `Shopping Bag` · `Shopping Cart` · `Sound OFF` · `Sound ON` · `Star` · `Stats` · `Trade` · `Trash Can` · `Upgrade` · `Verify` · `Wheel`

#### 🌿 Nature (86 icons, 11 subcategories)
`Apple` · `Banana` · `Cloud` · `Cloud 2` · `Clover` · `Leaf` · `Orange` · `Planet` · `Strawberry` · `Thunderstorm` · `Wheat`

#### 👤 Player (74 icons, 9 subcategories)
`4 Players` · `Add Player` · `Arm` · `Friend` · `Full Body` · `Player` · `RIP` · `Skull` · `Smiling Face With Horns`

#### 💬 Social (24 icons, 4 subcategories)
`Discord` · `Guilded` · `Twitter` · `X`

#### 🖱️ UI (74 icons, 13 subcategories)
`Chat` · `Checkmark` · `Checkmark Button` · `Close Button` · `Cursor` · `Exclamation Mark` · `Info` · `Minus` · `Plus` · `Question Mark` · `Skip` · `Warning` · `X`

### 7.5 Icon Naming Convention

Each icon follows a consistent naming pattern within its subcategory:

```
{Variant} {Name} {Edition} {Qualifier}
```

Examples:
- `Blue_Cash_1st` — Blue variant, Cash icon, 1st edition
- `Blue_Cash_1st_Outline` — Same with outline style
- `Golden_Coin_2nd` — Golden variant, Coin icon, 2nd edition
- `Cash_Black` — Black monochrome variant
- `Cash_White` — White monochrome variant

Most icons have 4 variants: **Standard**, **Standard Outline**, **Golden**, **Golden Outline**.

### 7.6 Quick Lookup Examples

```lua
local Icons = require(game.ReplicatedStorage.CheckUI.CheckUIIcons)

-- Shop tab icons
local shopBag   = Icons.Main.Shopping_Bag.Shopping_Bag_1st
local shopCart   = Icons.Main.Shopping_Cart.Shopping_Cart_1st

-- Settings icons
local sfxOn      = Icons.Main.Sound_ON.Sound_ON_1st
local sfxOff     = Icons.Main.Sound_OFF.Sound_OFF_1st
local musicOn    = Icons.Main.Music_ON.Music_ON_1st
local musicOff   = Icons.Main.Music_OFF.Music_OFF_1st
local settings   = Icons.Main.Settings.Settings_1st

-- Codes UI
local codesIcon  = Icons.Main.Codes.Codes_1st
local verify     = Icons.Main.Verify.Verify_1st

-- Currency displays
local cash       = Icons.Currency.Cash.Golden_Cash_1st
local coin       = Icons.Currency.Coin.Golden_Coin_1st
local diamond    = Icons.Currency.Diamond.Golden_Diamond_1st

-- Player / social
local player     = Icons.Player.Player.Player_1st
local discord    = Icons.Social.Discord.Gamepad_1st

-- UI elements
local close      = Icons.UI.Close_Button.Close_Button_1st
local checkmark  = Icons.UI.Checkmark.Checkmark_1st
local warning    = Icons.UI.Warning.Warning_1st

-- Fuzzy search for all "star" icons
local starIcons  = Icons.Search("star")
for _, result in ipairs(starIcons) do
    print(result.Path, result.AssetId)
end
```

---

## 8. Implementation Checklist

When building any Check-UI compliant interface, verify:

- [ ] **Font**: ALL text uses `Enum.Font.GothamBlack` — no exceptions
- [ ] **Canvas**: Window background is solid `#3B5866` with `BackgroundTransparency = 0`
- [ ] **Close Button**: Uses the exact 38x38 3D beveled square recipe from §3.1
- [ ] **Header Divider**: Has 2-tier shadow (dark accent + pure black) at bottom of header
- [ ] **Damier**: Full-height `Size = (1, 0, 1, 0)` with 4-point vertical `UIGradient` — never a partial height cutoff
- [ ] **Icons**: `ScaleType = Enum.ScaleType.Fit` — never stretched
- [ ] **AnchorPoints**: ALL interactive elements use `AnchorPoint = (0.5, 0.5)` with centered `UIScale`
- [ ] **Responsive**: `UIScale` driven by `camera.ViewportSize` with baseline `1050x620`, clamped `[0.52, 1.18]`
- [ ] **Animations**: All tweens target `UIScale.Scale` from center anchor — no Position-based animations for scale effects
- [ ] **Sunbursts**: Rotating at 20°/sec via `RenderStepped`, paused when menu is hidden
- [ ] **Strokes**: Outer borders `2.8-3.5px` black, inner highlights `1.2px` pastel
- [ ] **Bevels**: 3px dark bottom extrusion on all buttons
