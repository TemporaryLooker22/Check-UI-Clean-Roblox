--!strict
-- CheckUIController.luau
-- Client-side controller powering responsive scaling, pop animations, and micro-interactions.

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")
local camera = workspace.CurrentCamera

local screenGui = script.Parent

----------------------------------------------------
-- 1. MULTI-DEVICE RESPONSIVE SCALING
----------------------------------------------------
local function getDeviceScale(): number
    local viewport = camera.ViewportSize
    if viewport.X <= 0 or viewport.Y <= 0 then return 1 end
    
    -- Design Baseline: 1050 x 620
    local scaleX = viewport.X / 1050
    local scaleY = viewport.Y / 620
    local factor = math.min(scaleX, scaleY)
    
    -- Clamp: Phone screens (0.52) to 4K desktop (1.18)
    return math.clamp(factor, 0.52, 1.18)
end

local function bindResponsiveUIScale(guiObj: GuiObject, scaleName: string?): UIScale
    local name = scaleName or "WindowScale"
    local scale = guiObj:FindFirstChild(name) :: UIScale?
    if not scale then
        scale = Instance.new("UIScale")
        scale.Name = name
        scale.Scale = getDeviceScale()
        scale.Parent = guiObj
    end
    return scale
end

----------------------------------------------------
-- 2. AUDIO PLAYBACK HELPER
----------------------------------------------------
local function playSound(soundInstance: Sound?)
    if not soundInstance then return end
    local clone = soundInstance:Clone()
    clone.Parent = screenGui
    clone:Play()
    Debris:AddItem(clone, 1.5)
end

----------------------------------------------------
-- 3. CENTER-ANCHORED BUTTON MICRO-INTERACTIONS
----------------------------------------------------
local function bindButtonAnimations(
    btn: GuiButton,
    scaleObj: UIScale,
    hoverFactor: number?,
    clickFactor: number?,
    hoverSound: Sound?,
    clickSound: Sound?
)
    local tweenInfoHover = TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tweenInfoClick = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tweenInfoRelease = TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

    local targetHover = hoverFactor or 1.05
    local targetClick = clickFactor or 0.94

    btn.MouseEnter:Connect(function()
        if hoverSound then playSound(hoverSound) end
        TweenService:Create(scaleObj, tweenInfoHover, { Scale = targetHover }):Play()
    end)

    btn.MouseLeave:Connect(function()
        TweenService:Create(scaleObj, tweenInfoHover, { Scale = 1.0 }):Play()
    end)

    btn.MouseButton1Down:Connect(function()
        if clickSound then playSound(clickSound) end
        TweenService:Create(scaleObj, tweenInfoClick, { Scale = targetClick }):Play()
    end)

    btn.MouseButton1Up:Connect(function()
        TweenService:Create(scaleObj, tweenInfoRelease, { Scale = targetHover }):Play()
    end)
end

----------------------------------------------------
-- 4. ADAPTIVE MODAL OPEN / CLOSE BOUNCE ANIMATION
----------------------------------------------------
local function createModalAnim(frame: Frame, scaleObj: UIScale)
    local isAnimating = false
    local defaultPos = frame.Position

    local function openModal()
        if isAnimating or frame.Visible then return end
        isAnimating = true

        frame.Visible = true
        local targetScale = getDeviceScale()
        scaleObj.Scale = targetScale * 0.72
        frame.Position = UDim2.new(defaultPos.X.Scale, defaultPos.X.Offset, defaultPos.Y.Scale, defaultPos.Y.Offset + 16)

        local openTweenInfo = TweenInfo.new(0.24, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        local scaleTween = TweenService:Create(scaleObj, openTweenInfo, { Scale = targetScale })
        local posTween = TweenService:Create(frame, openTweenInfo, { Position = defaultPos })

        scaleTween:Play()
        posTween:Play()

        scaleTween.Completed:Connect(function()
            isAnimating = false
        end)
    end

    local function closeModal()
        if isAnimating or not frame.Visible then return end
        isAnimating = true

        local currentScale = scaleObj.Scale
        local closeTweenInfo = TweenInfo.new(0.14, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        local scaleTween = TweenService:Create(scaleObj, closeTweenInfo, { Scale = currentScale * 0.70 })
        local posTween = TweenService:Create(frame, closeTweenInfo, {
            Position = UDim2.new(defaultPos.X.Scale, defaultPos.X.Offset, defaultPos.Y.Scale, defaultPos.Y.Offset + 14)
        })

        scaleTween:Play()
        posTween:Play()

        scaleTween.Completed:Connect(function()
            frame.Visible = false
            scaleObj.Scale = getDeviceScale()
            frame.Position = defaultPos
            isAnimating = false
        end)
    end

    return openModal, closeModal
end

----------------------------------------------------
-- 5. SUNBURST CONTINUOUS ROTATION
----------------------------------------------------
local function bindSunburstRotation(container: GuiObject, speedDegreesPerSec: number?)
    local speed = speedDegreesPerSec or 20
    local sunbursts: { ImageLabel } = {}
    
    for _, desc in ipairs(container:GetDescendants()) do
        if desc.Name == "Sunburst" and desc:IsA("ImageLabel") then
            table.insert(sunbursts, desc)
        end
    end

    RunService.RenderStepped:Connect(function(dt: number)
        if container.Visible and #sunbursts > 0 then
            local delta = speed * dt
            for _, sb in ipairs(sunbursts) do
                sb.Rotation = (sb.Rotation + delta) % 360
            end
        end
    end)
end

return {
    getDeviceScale = getDeviceScale,
    bindResponsiveUIScale = bindResponsiveUIScale,
    bindButtonAnimations = bindButtonAnimations,
    createModalAnim = createModalAnim,
    bindSunburstRotation = bindSunburstRotation,
    playSound = playSound,
}
