# Check-UI — Complete Roblox Cartoon & Simulator UI Design System

> **The definitive design specification and component architecture for high-engagement, non-generic Roblox cartoon, simulator, and tycoon interfaces.**  
> Crafted with mathematical precision, strict GothamBlack typography, physical 3D bevels, multi-palette thematic hierarchy, and universal multi-device responsive scaling.

---

## Table of Contents
1. [Visual Showcase: The 5 Canonical Simulator Menus](#1-visual-showcase-the-5-canonical-simulator-menus)
2. [Design Philosophy & Core Tenets](#2-design-philosophy--core-tenets)
3. [Thematic Matrix: The 5 Header Archetypes](#3-thematic-matrix-the-5-header-archetypes)
4. [The Button State Triad & Specialized Buttons](#4-the-button-state-triad--specialized-buttons)
5. [Card Backgrounds & The Rainbow Day 7 Sequence](#5-card-backgrounds--the-rainbow-day-7-sequence)
6. [Component Blueprints & Proportions](#6-component-blueprints--proportions)
   - [6.1 The 3D Beveled Square Close Button `[X]`](#61-the-3d-beveled-square-close-button-x)
   - [6.2 Header Action Button (`Skip`)](#62-header-action-button-skip)
   - [6.3 2-Tier 3D Header Shadow Divider](#63-2-tier-3d-header-shadow-divider)
   - [6.4 Seamless Fading Damier (Checkerboard)](#64-seamless-fading-damier-checkerboard)
   - [6.5 Rebirth Comparison Flow (`Tier 1 ➡ Tier 2`)](#65-rebirth-comparison-flow-tier-1--tier-2)
   - [6.6 Progression Bar (Rebirth / Quests)](#66-progression-bar-rebirth--quests)
   - [6.7 Daily Rewards 7-Day Matrix (3x2 + Rainbow Day 7)](#67-daily-rewards-7-day-matrix-3x2--rainbow-day-7)
   - [6.8 Recessed Containers & Sub-boxes](#68-recessed-containers--sub-boxes)
7. [Typography Hierarchy & Rules](#7-typography-hierarchy--rules)
8. [Center-Anchored Animation Architecture](#8-center-anchored-animation-architecture)
9. [Universal Responsive Engine (`UIScale`)](#9-universal-responsive-engine-uiscale)
10. [CheckUIIcons Registry (1,022 HD Icons)](#10-checkuiicons-registry-1022-hd-icons)

---

## 1. Visual Showcase: The 5 Canonical Simulator Menus

The Check-UI Design System is grounded in the 5 iconic interface archetypes that power top-grossing Roblox simulators (such as *Pet Simulator 99*, *Blade Ball*, and *Anime Champions*):

```
+---------------------------------------------------------------------------------------+
| 1. SHOP MENU           | Magenta/Crimson Header | ~Gamepass~ & ~Products~ Sections    |
|                        | Purple & Cyan Cards    | Lime Buy Buttons with Robux Hex     |
+------------------------+------------------------+-------------------------------------+
| 2. CODES MENU          | Cyan/Electric Header   | Subtitle Instructions               |
|                        | Dark Input Box         | Lime "Redeem" Button                |
+------------------------+------------------------+-------------------------------------+
| 3. REBIRTH MENU        | Royal Purple Header    | Golden "Skip" Header Action Button  |
|                        | Tier Comparison Flow   | Orange-to-Gold Progression Bar      |
+------------------------+------------------------+-------------------------------------+
| 4. SETTINGS MENU       | Metallic Silver Header | Recessed Setting Rows               |
|                        | Lime "SFX On" Toggle   | Magenta "Music On" Toggle           |
+------------------------+------------------------+-------------------------------------+
| 5. DAILY REWARDS MENU  | Lime Neon Green Header | 3x2 Grid (Cyan, Purple, Amber)      |
|                        | Button State Triad     | Full-Height RAINBOW Day 7 Card      |
+---------------------------------------------------------------------------------------+
```

Every single modal shares:
- Solid slate blue canvas (`#3B5866`) with charcoal outer border (`#181E22`, 3.5px).
- Strict `Enum.Font.GothamBlack` typography with contextual black outlines.
- Signature 3D beveled square close button `[X]` (`38x38px`).
- 2-tier 3D header shadow divider bar (thematic dark line + pure black line).
- Seamless vertical fading checkerboard texture (no cutoff lines).
- Universal responsive scaling clamped between `0.52` and `1.18`.

---

## 2. Design Philosophy & Core Tenets

### The 8 Non-Negotiable Check-UI Commandments

```
[1] Strict GothamBlack   --> Only Enum.Font.GothamBlack is permitted for text.
[2] 100% Opaque Slate    --> Window canvas is ALWAYS Color3.fromRGB(59, 88, 102) (#3B5866).
[3] 3D Beveled Depth     --> Every button has a 3-4px dark extrusion bottom bevel.
[4] Signature Close [X]  --> 38x38 square with #730010 base, shifted crimson face, pastel stroke.
[5] 2-Tier Header Shadow --> Dark theme accent line (3px) + pure black line (3px).
[6] Seamless Damier Fade --> Full height texture overlay with 4-point vertical transparency.
[7] Center-Anchored Tweens-> AnchorPoint = (0.5, 0.5) + child UIScale for uniform expansion.
[8] Button State Triad   --> Claim (Lime), Claimed (Silver Metallic), Locked (Crimson Red).
```

---

## 3. Thematic Matrix: The 5 Header Archetypes

Each menu uses an unmistakable color identity, while preserving identical 60px height, white top highlight, fading damier, and 2-tier bottom shadow divider:

| Menu Archetype | Gradient Top | Gradient Bottom | Top Highlight | Damier Color | Dark Divider |
|:---|:---|:---|:---|:---|:---|
| **Shop** | `#FF1496` (`255, 20, 150`) | `#E10019` (`225, 0, 25`) | `#FFC8E1` | `#960014` | `#7D0012` |
| **Codes** | `#00CDFF` (`0, 205, 255`) | `#0082F5` (`0, 130, 245`) | `#B4F0FF` | `#004B96` | `#00326E` |
| **Settings** | `#FFFFFF` (`255, 255, 255`) | `#D7DEE8` (`215, 222, 232`)| `#FFFFFF` | `#6E7887` | `#5A6470` |
| **Rebirth** | `#A000FF` (`160, 0, 255`) | `#6000C8` (`96, 0, 200`) | `#E0A0FF` | `#600090` | `#500078` |
| **Daily Rewards** | `#98FF00` (`152, 255, 0`) | `#50D000` (`80, 208, 0`) | `#E0FFB0` | `#358000` | `#256000` |

---

## 4. The Button State Triad & Specialized Buttons

Check-UI defines a comprehensive button architecture where every state communicates its interactive capability through physical color depth:

```
                      +---------------------------------------+
                      | CHECK-UI BUTTON ARCHITECTURE MATRIX   |
+---------------------+-------------------+-------------------+-------------------+-------------------+
| Button Role         | Gradient (Top/Btm)| 3D Bottom Bevel   | Inner Highlight   | Damier Color      |
+---------------------+-------------------+-------------------+-------------------+-------------------+
| CLAIM / BUY / REDEEM| #B4FF19 -> #69E100| #0F780F (Green)   | #EBFF82 (Pastel)  | #28A014 (30% op)  |
| CLAIMED / OFF       | #D8DEE4 -> #94A0B0| #485260 (Slate)   | #FFFFFF (White)   | #606870 (35% op)  |
| LOCKED / DESTRUCTIVE| #FF2050 -> #D00020| #700010 (Burgundy)| #FFB0C8 (Pink)    | #900018 (35% op)  |
| SKIP (Header Action)| #FFD000 -> #FF8C00| #994C00 (Amber)   | #FFF0A0 (Yellow)  | #B06000 (35% op)  |
| MUSIC ON / TOGGLE   | #FF1480 -> #D40055| #780A2D (Magenta) | #FFB0D0 (Pastel)  | #A00040 (35% op)  |
+---------------------+-------------------+-------------------+-------------------+-------------------+
```

### Anatomic Layers of Every Check-UI Button:
1. **Base Frame / Button**: `BackgroundColor3 = Color3.fromRGB(255, 255, 255)` with `UICorner` (4px).
2. **Outer Border**: `UIStroke` (thickness `2.8px`, pure black `#000000`, `ApplyStrokeMode.Border`).
3. **Color Gradient**: `UIGradient` (rotation `90°`, top vibrant color to deeper bottom tone).
4. **3D Bottom Extrusion Bevel**: `Frame` at `(0, 0, 1, -3)` with `Size = (1, 0, 0, 3)`.
5. **Inner Highlight Stroke**: `Frame` at `(0.5, 0, 0.5, 0)` with `Size = (1, -4, 1, -4)`, `AnchorPoint = (0.5, 0.5)`, carrying a `1.2px` pastel stroke.
6. **Seamless Fading Damier**: Full-height `ImageLabel` with 4-point vertical `UIGradient` transparency.
7. **Centered GothamBlack Label**: White text with `2.8px` black stroke.
8. **Micro-Interaction Scale**: Child `UIScale` named `ButtonScale`.

---

## 5. Card Backgrounds & The Rainbow Day 7 Sequence

### 5.1 Themed Card Gradients
- **Purple Card** (Double Money, Day 4): `#B020FF` (`176, 32, 255`) to `#7000E0` (`112, 0, 224`)
- **Cyan Card** (Auto Collect, Days 1-3): `#00D2FF` (`0, 210, 255`) to `#0078FF` (`0, 120, 255`)
- **Lime Card** (Products 1k/10k/100k, Rebirth Multipliers): `#B4FF19` (`180, 255, 25`) to `#69E100` (`105, 225, 0`)
- **Magenta Card** (Day 5): `#D000E0` (`208, 0, 224`) to `#8000A0` (`128, 0, 160`)
- **Amber Card** (Day 6): `#FFAA00` (`255, 170, 0`) to `#E06000` (`224, 96, 0`)

### 5.2 The Signature Day 7 Rainbow / Spectrum Sequence
The Day 7 Featured Card uses a diagonal multi-stop `ColorSequence` to produce an iridescent neon rainbow effect:

```lua
CheckUITheme.CardGradients.Rainbow = ColorSequence.new{
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 30, 80)),   -- Crimson Pink
    ColorSequenceKeypoint.new(0.18, Color3.fromRGB(255, 140, 0)),  -- Radiant Orange
    ColorSequenceKeypoint.new(0.35, Color3.fromRGB(255, 230, 0)),  -- Golden Yellow
    ColorSequenceKeypoint.new(0.52, Color3.fromRGB(40, 230, 50)),   -- Bright Green
    ColorSequenceKeypoint.new(0.70, Color3.fromRGB(0, 210, 255)),   -- Electric Cyan
    ColorSequenceKeypoint.new(0.85, Color3.fromRGB(90, 60, 255)),   -- Deep Blue-Violet
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(220, 0, 230)),   -- Vibrant Magenta
}
```
*Note: Always rotate the gradient by `45°` on the Day 7 card, and overlay a rotating sunburst (`20°/s`).*

---

## 6. Component Blueprints & Proportions

### 6.1 The 3D Beveled Square Close Button `[X]`
```
+------------------------------------+  <-- CloseBtn (38x38, Base: #730010, Outer Stroke: 2.8px)
| +--------------------------------+ |
| |                                | |  <-- Face (Size: (1, 0, 1, -4), Shifted Up)
| |   +------------------------+   | |      Gradient: #FF7DAF -> #FF1428
| |   |                        |   | |  <-- InnerBorder (1.2px stroke, #FFD2EB)
| |   |           X            |   | |  <-- TextLabel "X" (29px GothamBlack, 3.0px stroke)
| |   |                        |   | |
| |   +------------------------+   | |
| +--------------------------------+ |
| ================================== |  <-- SepLine (1px #46000A)
| ////////////////////////////////// |  <-- 3D Bottom Bevel (4px height extrusion)
+------------------------------------+
```

### 6.2 Header Action Button (`Skip`)
Positioned inside the Header, immediately to the left of the `[X]` Close Button:
- **Size**: `84px` wide x `36-38px` high.
- **Position**: `UDim2.new(1, -86, 0.5, -2)`.
- **AnchorPoint**: `Vector2.new(0.5, 0.5)`.
- **Palette**: Golden Amber (`#FFD000` to `#FF8C00`), bevel `#994C00`, inner stroke `#FFF0A0`.

### 6.3 2-Tier 3D Header Shadow Divider
Positioned at the bottom of every 60px header:
```
Header (Height: 60px)
+----------------------------------------------------+
| Title (GothamBlack 38px)          [Skip]  [X]      |
+----------------------------------------------------+
| ================================================== |  <-- DivDark (3px, Dark Thematic Accent)
| ################################################## |  <-- DivBlack (3px, Pure Black #000000)
```

### 6.4 Seamless Fading Damier (Checkerboard)
- **Asset ID**: `rbxassetid://385956923`
- **ScaleType**: `Enum.ScaleType.Tile`
- **TileSize**: `UDim2.new(0, 18, 0, 18)` (buttons), `(0, 22, 0, 22)` (cards), `(0, 26, 0, 26)` (headers).
- **Transparency Sequence (Vertical UIGradient at 90°)**:
  ```lua
  NumberSequence.new{
      NumberSequenceKeypoint.new(0.00, 1.00), -- 100% transparent at top edge
      NumberSequenceKeypoint.new(0.30, 0.82), -- subtle onset
      NumberSequenceKeypoint.new(0.70, 0.35), -- clearly visible squares
      NumberSequenceKeypoint.new(1.00, 0.10)  -- solid textured bottom
  }
  ```

### 6.5 Rebirth Comparison Flow (`Tier 1 ➡ Tier 2`)
- **Structure**: Two side-by-side green cards (`Lime` gradient + damier + 2.8px black border).
  - Left Card: Top label `Rebirth 1` (18px), Value `X1 Money` (26px).
  - Center Arrow: `➡` (34px, white text `#EBF5FF` with 3.0px black stroke).
  - Right Card: Top label `Rebirth 2` (18px), Value `X1.3 Money` (26px).

### 6.6 Progression Bar (Rebirth / Quests)
- **Trough**: Recessed container (`#141E24`), 2px dark border (`#0C1216`).
- **Fill**: Orange-to-Gold gradient (`#FFC800` to `#FF6A00`), 2px bottom extrusion bevel (`#993C00`).
- **Label**: Centered GothamBlack text (e.g. `58% Completed`) with 2.6px black outline.

### 6.7 Daily Rewards 7-Day Matrix (3x2 + Rainbow Day 7)
- **Left Grid (Days 1 to 6)**: 3 columns x 2 rows of 140x170px cards.
  - Card Header: `DAY 1` through `DAY 6` (GothamBlack 22px).
  - Icon: Centered item/player icon (72x72px, `ScaleType.Fit`).
  - Item Label: `ITEM NAME!` (15px).
  - Bottom State Button: `CLAIMED` (Silver), `CLAIM` (Lime), `LOCKED` (Red).
- **Right Card (Day 7 Featured)**: Spans both rows (148px wide x 348px high).
  - Diagonal 45° Rainbow Gradient + rotating Sunburst.
  - Title: `DAY 7` in golden yellow (`#FFF032`) 32px GothamBlack.
  - Featured Model: Large 120x120px display.
  - Label: `ITEM NAME!` (20px).
  - Button: `LOCKED` (34px height).

---

## 7. Typography Hierarchy & Rules

Only **`Enum.Font.GothamBlack`** is permitted.

| UI Element | Font Size | Text Color | Stroke Thickness | Stroke Color | Alignment |
|:---|:---|:---|:---|:---|:---|
| **Header Title** | `38 px` | `#FFFFFF` | `3.2 px` | `#000000` | Left (`Offset = 18px`) |
| **Section Header** (`~Gamepass~`) | `24 px` | `#FFFFFF` | `2.8 px` | `#000000` | Center |
| **Close Button 'X'** | `29 px` | `#FFFFFF` | `3.0 px` | `#000000` | Center |
| **Header Button ('Skip')** | `24 px` | `#FFFFFF` | `2.8 px` | `#000000` | Center |
| **Card Title / Amount** (`10,000`)| `24 px` | `#FFFFFF` | `2.8 px` | `#000000` | Center / Left |
| **Primary Action Label** | `26 px` | `#FFFFFF` | `2.8 px` | `#000000` | Center |
| **State Button Label** (`CLAIM`) | `20 px` | `#FFFFFF` | `2.6 px` | `#000000` | Center |
| **Progression Bar Percentage** | `22 px` | `#FFFFFF` | `2.6 px` | `#000000` | Center |
| **Subtitle / Instructions** | `13 - 14 px`| `#E1EBF5`| `1.8 - 2.0 px` | `#000000` | Center |

---

## 8. Center-Anchored Animation Architecture

**Every interactive element MUST scale from its geometric center.**

```lua
-- MANDATORY configuration:
element.AnchorPoint = Vector2.new(0.5, 0.5)
element.Position = UDim2.new(X_SCALE, X_OFFSET, Y_SCALE, Y_OFFSET)

local scaleObj = Instance.new("UIScale")
scaleObj.Name = "ButtonScale"
scaleObj.Scale = 1
scaleObj.Parent = element
```

### Micro-Interaction Tweens:
- **Hover In**: Scale to `1.05` in `0.08s` (`Quad.Out`), play hover sound.
- **Hover Out**: Scale to `1.00` in `0.08s` (`Quad.Out`).
- **Mouse Down**: Scale to `0.94` in `0.05s` (`Quad.Out`), play click sound.
- **Mouse Up / Release**: Scale to `1.05` in `0.12s` (`Back.Out`).

---

## 9. Universal Responsive Engine (`UIScale`)

```lua
local camera = workspace.CurrentCamera

local function getDeviceScale(): number
    local viewport = camera.ViewportSize
    if viewport.X <= 0 or viewport.Y <= 0 then return 1 end
    
    -- Design baseline: 1050 x 620
    local scaleX = viewport.X / 1050
    local scaleY = viewport.Y / 620
    local factor = math.min(scaleX, scaleY)
    
    -- Clamped between small phones (0.52) and large monitors (1.18)
    return math.clamp(factor, 0.52, 1.18)
end
```

---

## 10. CheckUIIcons Registry (1,022 HD Icons)

Check-UI ships with **1,022 production-grade HD icons (256px)** pre-uploaded to Roblox as `rbxassetid://` assets across 10 categories:
- **Animal** (12), **Currency** (110), **Exclusive** (32), **Food** (48), **Item** (326), **Main** (236), **Nature** (86), **Player** (74), **Social** (24), **UI** (74).

```lua
local Icons = require(game.ReplicatedStorage.CheckUI.CheckUIIcons)
local cashIcon = Icons.Currency.Cash.Golden_Cash_1st
local swordIcon = Icons.Get("Item/Sword/Sword 1st")
local results = Icons.Search("diamond")
```
