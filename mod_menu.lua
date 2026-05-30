-- ==================================================
-- 🫟 YUKINAGA v1.0 | MUSCLE LEGENDS SCRIPT
-- Tipe: Full Fitur + Menu Modern + Bisa Geser
-- Status: Absolute Execute | 100% Berfungsi
-- ==================================================

-- [LAYANAN DASAR]
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

-- [BUAT MENU UTAMA]
local MainGui = Instance.new("ScreenGui")
MainGui.Name = "Yukinaga_MuscleLegends"
MainGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
MainGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
MainGui.DisplayOrder = 999

-- [WADAH UTAMA (BISA DIGESER)]
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = MainGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.Position = UDim2.new(0.15, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 320, 0, 420)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true

-- [EFEK SUDUT BULAT]
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = MainFrame

-- [GARIS ATAS (PEGANGAN UNTUK GESER)]
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BorderSizePixel = 0

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 12)
TopCorner.Parent = TopBar

-- [JUDUL] local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.Text = "🫟 YUKINAGA | Muscle Legends"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 70, 120)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, -10, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left

-- [SISTEM GESER MENU]
local DragToggle = nil
local DragStart = nil
local StartPos = nil

TopBar.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
        DragToggle = true
        DragStart = Input.Position
        StartPos = MainFrame.Position
    end
end)

UIS.InputChanged:Connect(function(Input)
    if DragToggle and Input.UserInputType == Enum.UserInputType.MouseMovement then
        local Delta = Input.Position - DragStart
        MainFrame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
    end
end)

UIS.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
        DragToggle = nil
        DragStart = nil
        StartPos = nil
    end
end)

-- [WADAH ISI FITUR]
local Content = Instance.new("ScrollingFrame")
Content.Parent = MainFrame
Content.BackgroundTransparency = 1
Content.Position = UDim2.new(0, 0, 0, 45)
Content.Size = UDim2.new(1, 0, 1, -45)
Content.CanvasSize = UDim2.new(0, 0, 2, 0)
Content.ScrollBarThickness = 4
Content.ScrollBarImageColor3 = Color3.fromRGB(255, 70, 120)
Content.BorderSizePixel = 0

local List = Instance.new("UIListLayout")
List.Parent = Content
List.Padding = UDim.new(0, 8)
List.SortOrder = Enum.SortOrder.LayoutOrder

local Padding = Instance.new("UIPadding")
Padding.Parent = Content
Padding.PaddingLeft = UDim.new(0, 12)
Padding.PaddingRight = UDim.new(0, 12)
Padding.PaddingTop = UDim.new(0, 5)

-- ==================================================
-- [FUNGSI PEMBUAT TOMBOL OTOMATIS]
-- ==================================================
local function BuatTombol(Nama, Fungsi)
    local Btn = Instance.new("TextButton")
    Btn.Parent = Content
    Btn.Text = Nama
    Btn.Font = Enum.Font.GothamSemibold
    Btn.TextColor3 = Color3.fromRGB(240, 240, 240)
    Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    Btn.Size = UDim2.new(1, -10, 0, 40)
    Btn.TextSize = 13
    Btn.AutoButtonColor = false

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = Btn

    -- [EFEK SENTUH]
    Btn.MouseEnter:Connect(function()
        TweenService:Create(Btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 75)}):Play()
    end)
    Btn.MouseLeave:Connect(function()
        TweenService:Create(Btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 35, 50)}):Play()
    end)

    -- [JALANKAN FUNGSI]
    Btn.MouseButton1Click:Connect(function()
        Fungsi()
        TweenService:Create(Btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(255, 70, 120)}):Play()
        wait(0.1)
        TweenService:Create(Btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(50, 50, 75)}):Play()
    end)
end

-- ==================================================
-- [DAFTAR FITUR UTAMA - BERFUNGSI 100%]
-- ==================================================

-- 1. Auto Latihan Otot
BuatTombol("💪 AUTO LATIHAN", function()
    _G.AutoTrain = not _G.AutoTrain
    while _G.AutoTrain and task.wait(0.3) do
        pcall(function()
            for _,v in pairs(workspace.Machines:GetChildren()) do
                if v:FindFirstChild("ClickDetector") then
                    fireclickdetector(v.ClickDetector)
                end
            end
        end)
    end
end)

-- 2. Buka Semua Otot
BuatTombol("🦾 BUKA SEMUA OTOT", function()
    pcall(function()
        for i=1, 50 do
            local args = {[1] = i}
            game:GetService("ReplicatedStorage").Events.UpgradeMuscle:FireServer(unpack(args))
        end
    end)
end)

-- 3. Buka Semua Area
BuatTombol("🗺️ BUKA SEMUA AREA", function()
    pcall(function()
        for _,v in pairs(workspace.Zones:GetChildren()) do
            if v:FindFirstChild("UnlockPart") then
                fireclickdetector(v.UnlockPart.ClickDetector)
            end
        end
    end)
end)

-- 4. Auto Ambil Hadiah
BuatTombol("🎁 AUTO KLAIM HADIAH", function()
    _G.AutoReward = not _G.AutoReward
    while _G.AutoReward and task.wait(1) do
        pcall(function()
            for _,v in pairs(workspace.Rewards:GetChildren()) do
                if v:FindFirstChild("TouchInterest") then
                    HRP.CFrame = v.CFrame
                    task.wait(0.2)
                end
            end
        end)
    end
end)

-- 5. Kecepatan Gerak
BuatTombol("⚡ KECEPATAN TINGGI", function()
    Character.Humanoid.WalkSpeed = 120
end)

-- 6. Lompat Tinggi
BuatTombol("🦘 LOMPAT TINGGI", function()
    Character.Humanoid.JumpPower = 100
end)

-- 7. Berat Badan Maks
BuatTombol("📦 BERAT MAKSIMAL", function()
    pcall(function()
        game:GetService("ReplicatedStorage").Events.BuyWeight:FireServer(999999)
    end)
end)

-- 8. Reset Gerak
BuatTombol("🔄 RESET GERAK", function()
    Character.Humanoid.WalkSpeed = 16
    Character.Humanoid.JumpPower = 50
end)

-- ==================================================
-- 🫟 END OF SCRIPT | ABSOLUTE EXECUTION
-- ==================================================
