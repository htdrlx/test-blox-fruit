local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local GUI_NAME = "XCrazyClick"
local SPEED = 300

pcall(function()
    local old = CoreGui:FindFirstChild(GUI_NAME)
    if old then old:Destroy() end
end)
pcall(function()
    local old = LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild(GUI_NAME)
    if old then old:Destroy() end
end)

local guiParent = CoreGui
if not pcall(function() CoreGui:GetChildren() end) then
    guiParent = LocalPlayer:WaitForChild("PlayerGui")
end

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = GUI_NAME
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = guiParent

-- Main Frame (nhỏ gọn)
local Frame = Instance.new("Frame")
Frame.Name = "Main"
Frame.Size = UDim2.new(0, 220, 0, 130)
Frame.Position = UDim2.new(0.5, -110, 0.08, 0)
Frame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)

local stroke = Instance.new("UIStroke", Frame)
stroke.Color = Color3.fromRGB(0, 170, 255)
stroke.Thickness = 1.5

-- Title bar
local TitleBar = Instance.new("Frame", Frame)
TitleBar.Size = UDim2.new(1, 0, 0, 22)
TitleBar.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
TitleBar.BorderSizePixel = 0
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 8)

local TitleFix = Instance.new("Frame", TitleBar) -- che góc dưới của titlebar
TitleFix.Size = UDim2.new(1, 0, 0.5, 0)
TitleFix.Position = UDim2.new(0, 0, 0.5, 0)
TitleFix.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
TitleFix.BorderSizePixel = 0

local TitleLabel = Instance.new("TextLabel", TitleBar)
TitleLabel.Size = UDim2.new(1, 0, 1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "✦ XCrazyClick"
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 12
TitleLabel.TextColor3 = Color3.new(1,1,1)

-- Toggle Button (nhỏ)
local ToggleBtn = Instance.new("TextButton", Frame)
ToggleBtn.Size = UDim2.new(0, 100, 0, 22)
ToggleBtn.Position = UDim2.new(0, 6, 0, 28)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ToggleBtn.Text = "CAM TP: TẮT"
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 11
ToggleBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
ToggleBtn.AutoButtonColor = true
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 5)
Instance.new("UIStroke", ToggleBtn).Color = Color3.fromRGB(255, 80, 80)

-- FPS Label
local FpsLabel = Instance.new("TextLabel", Frame)
FpsLabel.Size = UDim2.new(0, 100, 0, 22)
FpsLabel.Position = UDim2.new(0, 114, 0, 28)
FpsLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
FpsLabel.Text = "FPS: --"
FpsLabel.Font = Enum.Font.GothamBold
FpsLabel.TextSize = 11
FpsLabel.TextColor3 = Color3.fromRGB(0, 220, 120)
Instance.new("UICorner", FpsLabel).CornerRadius = UDim.new(0, 5)

-- Speed Label
local SpeedLabel = Instance.new("TextLabel", Frame)
SpeedLabel.Size = UDim2.new(1, -12, 0, 18)
SpeedLabel.Position = UDim2.new(0, 6, 0, 58)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "⚡ Speed: " .. SPEED
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.TextSize = 11
SpeedLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Speed Slider Track
local SliderTrack = Instance.new("Frame", Frame)
SliderTrack.Size = UDim2.new(1, -12, 0, 6)
SliderTrack.Position = UDim2.new(0, 6, 0, 82)
SliderTrack.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", SliderTrack).CornerRadius = UDim.new(1, 0)

local SliderFill = Instance.new("Frame", SliderTrack)
SliderFill.Size = UDim2.new(SPEED / 1000, 0, 1, 0) -- max = 1000
SliderFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Instance.new("UICorner", SliderFill).CornerRadius = UDim.new(1, 0)

local SliderKnob = Instance.new("TextButton", SliderTrack)
SliderKnob.Size = UDim2.new(0, 14, 0, 14)
SliderKnob.Position = UDim2.new(SPEED / 1000, -7, 0.5, -7)
SliderKnob.BackgroundColor3 = Color3.new(1,1,1)
SliderKnob.Text = ""
SliderKnob.AutoButtonColor = false
Instance.new("UICorner", SliderKnob).CornerRadius = UDim.new(1, 0)

-- Speed buttons (- / +)
local BtnMinus = Instance.new("TextButton", Frame)
BtnMinus.Size = UDim2.new(0, 26, 0, 20)
BtnMinus.Position = UDim2.new(0, 6, 0, 100)
BtnMinus.BackgroundColor3 = Color3.fromRGB(35,35,35)
BtnMinus.Text = " - "
BtnMinus.Font = Enum.Font.GothamBold
BtnMinus.TextSize = 13
BtnMinus.TextColor3 = Color3.fromRGB(255,100,100)
Instance.new("UICorner", BtnMinus).CornerRadius = UDim.new(0, 4)

local BtnPlus = Instance.new("TextButton", Frame)
BtnPlus.Size = UDim2.new(0, 26, 0, 20)
BtnPlus.Position = UDim2.new(0, 36, 0, 100)
BtnPlus.BackgroundColor3 = Color3.fromRGB(35,35,35)
BtnPlus.Text = " + "
BtnPlus.Font = Enum.Font.GothamBold
BtnPlus.TextSize = 13
BtnPlus.TextColor3 = Color3.fromRGB(0,220,120)
Instance.new("UICorner", BtnPlus).CornerRadius = UDim.new(0, 4)

local TweenLabel = Instance.new("TextLabel", Frame)
TweenLabel.Size = UDim2.new(0, 130, 0, 20)
TweenLabel.Position = UDim2.new(0, 68, 0, 100)
TweenLabel.BackgroundTransparency = 1
TweenLabel.Text = "Tween: --"
TweenLabel.Font = Enum.Font.Gotham
TweenLabel.TextSize = 11
TweenLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
TweenLabel.TextXAlignment = Enum.TextXAlignment.Left

-- ============ Logic ============
local Enabled = false
local Moving = false
local MoveConnection, NoclipConnection

local function UpdateSpeedUI()
    SpeedLabel.Text = "⚡ Speed: " .. SPEED
    local pct = math.clamp(SPEED / 1000, 0, 1)
    SliderFill.Size = UDim2.new(pct, 0, 1, 0)
    SliderKnob.Position = UDim2.new(pct, -7, 0.5, -7)
end

BtnMinus.MouseButton1Click:Connect(function()
    SPEED = math.max(10, SPEED - 50)
    UpdateSpeedUI()
end)

BtnPlus.MouseButton1Click:Connect(function()
    SPEED = math.min(1000, SPEED + 50)
    UpdateSpeedUI()
end)

-- Slider drag
local dragging = false
SliderKnob.MouseButton1Down:Connect(function() dragging = true end)
game:GetService("UserInputService").InputEnded:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)
RunService.RenderStepped:Connect(function()
    if dragging then
        local trackPos = SliderTrack.AbsolutePosition.X
        local trackSize = SliderTrack.AbsoluteSize.X
        local mouseX = Mouse.X
        local pct = math.clamp((mouseX - trackPos) / trackSize, 0, 1)
        SPEED = math.floor(pct * 1000 / 10) * 10
        if SPEED < 10 then SPEED = 10 end
        UpdateSpeedUI()
    end
end)

-- FPS counter
local lastFps = 0
local fpsTimer = 0
RunService.RenderStepped:Connect(function(dt)
    fpsTimer = fpsTimer + dt
    if fpsTimer >= 0.4 then
        local fps = math.floor(1 / dt)
        local color = fps >= 55 and Color3.fromRGB(0,220,120)
            or fps >= 30 and Color3.fromRGB(255,200,0)
            or Color3.fromRGB(255,60,60)
        FpsLabel.Text = "FPS: " .. fps
        FpsLabel.TextColor3 = color
        fpsTimer = 0
    end
end)

local function GetCharacter()
    local Character = LocalPlayer.Character
    if not Character then return end
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local HRP = Character:FindFirstChild("HumanoidRootPart")
    if not Humanoid or not HRP then return end
    return Character, Humanoid, HRP
end

local function StopMove()
    if MoveConnection then MoveConnection:Disconnect() MoveConnection = nil end
    if NoclipConnection then NoclipConnection:Disconnect() NoclipConnection = nil end
    Moving = false
    TweenLabel.Text = "Tween: --"
end

local ToggleBtnStroke = Instance.new("UIStroke", ToggleBtn)
ToggleBtnStroke.Color = Color3.fromRGB(255, 80, 80)

ToggleBtn.MouseButton1Click:Connect(function()
    Enabled = not Enabled
    if Enabled then
        ToggleBtn.Text = "CAM TP: BẬT"
        ToggleBtn.TextColor3 = Color3.fromRGB(0, 170, 255)
        ToggleBtnStroke.Color = Color3.fromRGB(0, 170, 255)
    else
        ToggleBtn.Text = "CAM TP: TẮT"
        ToggleBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
        ToggleBtnStroke.Color = Color3.fromRGB(255, 80, 80)
        StopMove()
    end
end)

Mouse.Button1Down:Connect(function()
    if not Enabled or Moving then return end
    local Character, Humanoid, HRP = GetCharacter()
    if not Character then return end

    local Camera = workspace.CurrentCamera
    local targetPosition = Mouse.Hit.Position + Vector3.new(0, 3, 0)
    local startPosition = HRP.Position
    local rotation = HRP.CFrame - HRP.Position
    local startCFrame = CFrame.new(startPosition) * rotation
    local targetCFrame = CFrame.new(targetPosition) * rotation
    local distance = (startPosition - targetPosition).Magnitude
    local duration = math.max(distance / SPEED, 0.08)

    Moving = true
    TweenLabel.Text = string.format("Tween: %.2fs", duration)

    local oldCameraType = Camera.CameraType
    local oldCameraSubject = Camera.CameraSubject
    Camera.CameraType = Enum.CameraType.Custom
    Camera.CameraSubject = HRP

    local oldAutoRotate = Humanoid.AutoRotate
    Humanoid.AutoRotate = false

    NoclipConnection = RunService.Stepped:Connect(function()
        if not Character.Parent then return end
        for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end)

    HRP.AssemblyLinearVelocity = Vector3.zero
    HRP.AssemblyAngularVelocity = Vector3.zero

    local startTime = os.clock()
    MoveConnection = RunService.RenderStepped:Connect(function()
        if not Moving then return end
        if not Character.Parent or not HRP.Parent or Humanoid.Health <= 0 then
            StopMove() return
        end

        local elapsed = os.clock() - startTime
        local alpha = math.clamp(elapsed / duration, 0, 1)
        local remaining = math.max(duration - elapsed, 0)

        TweenLabel.Text = string.format("Tween: %.2fs", remaining)

        HRP.CFrame = startCFrame:Lerp(targetCFrame, alpha)
        HRP.AssemblyLinearVelocity = Vector3.zero
        HRP.AssemblyAngularVelocity = Vector3.zero

        if Camera.CameraSubject ~= HRP then Camera.CameraSubject = HRP end

        if alpha >= 1 then
            HRP.CFrame = targetCFrame
            HRP.AssemblyLinearVelocity = Vector3.zero
            HRP.AssemblyAngularVelocity = Vector3.zero
            StopMove()
            Humanoid.AutoRotate = oldAutoRotate
            Camera.CameraType = oldCameraType
            Camera.CameraSubject = oldCameraSubject
        end
    end)
end)

LocalPlayer.CharacterAdded:Connect(function() StopMove() end)
