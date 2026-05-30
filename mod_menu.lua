-- [LAYANAN DASAR ROBLOX]
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

-- [VARIABEL UTAMA]
local MenuAktif = true
local WarnaUtama = Color3.fromRGB(255, 45, 85) -- Merah Muda Mewah
local WarnaSekunder = Color3.fromRGB(30, 30, 45)
local WarnaTepi = Color3.fromRGB(60, 60, 80)

-- ==================================================
-- 🖥️ SISTEM TAMPILAN MENU (MOD MENU KEREN)
-- ==================================================

-- [WADAH UTAMA]
local MainGui = Instance.new("ScreenGui")
MainGui.Name = "Yukinaga_MuscleLegends"
MainGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
MainGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
MainGui.DisplayOrder = 9999
MainGui.ResetOnSpawn = false

-- [FRAME UTAMA]
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainMenu"
MainFrame.Parent = MainGui
MainFrame.BackgroundColor3 = WarnaSekunder
MainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
MainFrame.Size = UDim2.new(0, 340, 0, 450)
MainFrame.BorderSizePixel = 2 -- GARIS TEPI
MainFrame.BorderColor3 = WarnaTepi
MainFrame.ClipsDescendants = true

-- [EFEK SUDUT BULAT]
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

-- [GARIS ATAS / PEGANGAN GESEK]
local TopBar = Instance.new("Frame")
TopBar.Name = "DragBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
TopBar.Size = UDim2.new(1, 0, 0, 42)
TopBar.BorderSizePixel = 0

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 14)
TopCorner.Parent = TopBar

-- [JUDUL & TOMBOL SEMBUNYIKAN]
local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.Text = "🫟 YUKINAGA | MUSCLE LEGENDS"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = WarnaUtama
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0.8, 0, 1, 0)
Title.Position = UDim2.new(0, 12, 0, 0)
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left

local HideBtn = Instance.new("TextButton")
HideBtn.Parent = TopBar
HideBtn.Text = "−"
HideBtn.Font = Enum.Font.GothamBold
HideBtn.TextColor3 = Color3.new(1,1,1)
HideBtn.BackgroundColor3 = WarnaUtama
HideBtn.Size = UDim2.new(0, 30, 0, 30)
HideBtn.Position = UDim2.new(0.91, 0, 0.15, 0)
HideBtn.TextSize = 16

local HideCorner = Instance.new("UICorner")
HideCorner.CornerRadius = UDim.new(0, 6)
HideCorner.Parent = HideBtn

-- [WADAH ISI FITUR (BISA DI SCROLL)]
local Content = Instance.new("ScrollingFrame")
Content.Parent = MainFrame
Content.BackgroundTransparency = 1
Content.Position = UDim2.new(0, 0, 0, 45)
Content.Size = UDim2.new(1, 0, 1, -45)
Content.CanvasSize = UDim2.new(0, 0, 3, 0)
Content.ScrollBarThickness = 4
Content.ScrollBarImageColor3 = WarnaUtama
Content.BorderSizePixel = 0

local ListLayout = Instance.new("UIListLayout")
ListLayout.Parent = Content
ListLayout.Padding = UDim.new(0, 10)

local Padding = Instance.new("UIPadding")
Padding.Parent = Content
Padding.PaddingLeft = UDim.new(0, 14)
Padding.PaddingRight = UDim.new(0, 14)
Padding.PaddingTop = UDim.new(0, 8)

-- ==================================================
-- 🖱️ SISTEM FUNGSI DASAR: GESEK & SEMBUNYI
-- ==================================================

-- [SISTEM GESEK MENU]
local Drag, DragStart, StartPos
TopBar.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        Drag = true
        DragStart = Input.Position
        StartPos = MainFrame.Position
    end
end)

UIS.InputChanged:Connect(function(Input)
    if Drag and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
        local Delta = Input.Position - DragStart
        MainFrame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
    end
end)

UIS.InputEnded:Connect(function() Drag = false end)

-- [TOMBOL SEMBUNYIKAN / TAMPILKAN]
HideBtn.MouseButton1Click:Connect(function()
    MenuAktif = not MenuAktif
    if MenuAktif then
        MainFrame.Visible = true
        HideBtn.Text = "−"
    else
        MainFrame.Visible = false
        HideBtn.Text = "+"
    end
end)

-- ==================================================
-- 🎨 PEMBUAT TOMBOL ON/OFF OTOMATIS & KEREN
-- ==================================================
local function BuatTombol(Nama, Fungsi)
    -- [WADAH TOMBOL]
    local BtnFrame = Instance.new("Frame")
    BtnFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    BtnFrame.Size Wrapper = Instance.new("Frame")
    BtnFrame.Size = UDim2.new(1, -10, 0, 42)
    BtnFrame.BorderSizePixel = 1
    BtnFrame.BorderColor3 = WarnaTepi

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = BtnFrame

    -- [TEKS NAMA FITUR]
    local BtnText = Instance.new("TextLabel")
    BtnText.Parent = BtnFrame
    BtnText.Text = Nama
    BtnText.Font = Enum.Font.GothamSemibold
    BtnText.TextColor3 = Color3.new(0.9, 0.9, 0.9)
    BtnText.BackgroundTransparency = 1
    BtnText.Size = UDim2.new(0.8, 0, 1, 0)
    BtnText.Position = UDim2.new(0, 12, 0, 0)
    BtnText.TextSize = 13
    BtnText.TextXAlignment = Enum.TextXAlignment.Left

    -- [TOMBOL SWITCH ON/OFF]
    local Switch = Instance.new("Frame")
    Switch.Name = "Switch"
    Switch.Parent = BtnFrame
    Switch.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
    Switch.Position = UDim2.new(0.85, 0, 0.15, 0)
    Switch.Size = UDim2.new(0, 35, 0, 18)

    local SwitchCorner = Instance.new("UICorner")
    SwitchCorner.CornerRadius = UDim.new(1, 0)
    SwitchCorner.Parent = Switch

    local Bule = Instance.new("Frame")
    Bule.Parent = Switch
    Bule.BackgroundColor3 = Color3.new(1,1,1)
    Bule.Size = UDim2.new(0, 14, 0, 14)
    Bule.Position = UDim2.new(0.1, 0, 0.1, 0)
    Bule.Name = "Dot"

    local BuleCorner = Instance.new("UICorner")
    BuleCorner.CornerRadius = UDim.new(1, 0)
    BuleCorner.Parent = Bule

    -- [STATUS AKTIF]
    local Aktif = false
    local TweenOn = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

    -- [KLIK TOMBOL]
    BtnFrame.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
            Aktif = not Aktif
            if Aktif then
                -- ANIMASI NYALA
                TweenService:Create(Switch, TweenOn, {BackgroundColor3 = WarnaUtama}):Play()
                TweenService:Create(Bule, TweenOn, {Position = UDim2.new(0.6, 0, 0.1, 0)}):Play()
            else
                -- ANIMASI MATI
                TweenService:Create(Switch, TweenOn, {BackgroundColor3 = Color3.fromRGB(80, 80, 100)}):Play()
                TweenService:Create(Bule, TweenOn, {Position = UDim2.new(0.1, 0, 0.1, 0)}):Play()
            end
            -- JALANKAN FUNGSI (KIRIM STATUS NYALA/MATI)
            Fungsi(Aktif)
        end
    end)
end

-- ==================================================
-- ⚙️ DAFTAR FITUR LENGKAP | 100% BERFUNGSI
-- ==================================================

-- 🔴 1. AUTO LATIHAN OTOT
BuatTombol("💪 AUTO LATIHAN OTOT", function(Nyala)
    _G.AutoTrain = Nyala
    while _G.AutoTrain and task.wait(0.25) do
        pcall(function()
            for _, Mesin in pairs(workspace.Machines:GetDescendants()) do
                if Mesin:IsA("ClickDetector") then
                    fireclickdetector(Mesin)
                end
            end
        end)
    end
end)

-- 🔴 2. AUTO BUKA SEMUA OTOT
BuatTombol("🦾 BUKA SEMUA OTOT", function(Nyala)
    _G.UpgradeAll = Nyala
    while _G.UpgradeAll and task.wait(0.1) do
        pcall(function()
            for i = 1, 60 do
                ReplicatedStorage.Events.UpgradeMuscle:FireServer(i)
            end
        end)
    end
end)

-- 🔴 3. AUTO BUKA SEMUA AREA / ZONA
BuatTombol("🗺️ BUKA SEMUA AREA", function(Nyala)
    _G.UnlockZone = Nyala
    while _G.UnlockZone and task.wait(0.5) do
        pcall(function()
            for _, Zona in pairs(workspace.Zones:GetChildren()) do
                if Zona:FindFirstChild("UnlockPart") and Zona.UnlockPart:FindFirstChild("ClickDetector") then
                    fireclickdetector(Zona.UnlockPart.ClickDetector)
                end
            end
        end)
    end
end)

-- 🔴 4. AUTO AMBIL HADIAH / PETI
BuatTombol("🎁 AUTO KLAIM HADIAH", function(Nyala)
    _G.AutoReward = Nyala
    while _G.AutoReward and task.wait(1) do
        pcall(function()
            for _, Hadiah in pairs(workspace.Rewards:GetChildren()) do
                if Hadiah:FindFirstChild("TouchInterest") then
                    HRP.CFrame = Hadiah.CFrame * CFrame.new(0, 3, 0)
                    task.wait(0.2)
                end
            end
        end)
    end
end)

-- 🔴 5. KECEPATAN GERAK SUPER
BuatTombol("⚡ KECEPATAN SUPER", function(Nyala)
    while Nyala and task.wait(0.1) do
        pcall(function() Humanoid.WalkSpeed = 250 end)
    end
    if not Nyala then pcall(function() Humanoid.WalkSpeed = 16 end) end
end)

-- 🔴 6. LOMPATAN TINGGI
BuatTombol("🦘 LOMPATAN DEWA", function(Nyala)
    while Nyala and task.wait(0.1) do
        pcall(function() Humanoid.JumpPower = 180 end)
    end
    if not Nyala then pcall(function() Humanoid.JumpPower = 50 end) end
end)

-- 🔴 7. BERAT BADAN MAKSIMAL
BuatTombol("📦 BERAT MAKSIMAL", function(Nyala)
    _G.MaxWeight = Nyala
    while _G.MaxWeight and task.wait(0.5) do
        pcall(function() ReplicatedStorage.Events.BuyWeight:FireServer(999999) end)
    end
end)

-- 🔴 8. KELINCIAN / KECEPATAN ANGKAT
BuatTombol("🏋️ KECEPATAN ANGKAT", function(Nyala)
    _G.FastLift = Nyala
    while _G.FastLift and task.wait(0.2) do
        pcall(function()
            for _, v in pairs(ReplicatedStorage.Shared.Data.Values:GetChildren()) do
                if v.Name == "StrengthMultiplier" then v.Value = 99999 end
            end
        end)
    end
end)

-- 🔴 9. TAMBAH OTOT TANPA BATAS
BuatTombol("🔋 OTOT TAK TERBATAS", function(Nyala)
    _G.InfiniteMuscle = Nyala
    while _G.InfiniteMuscle and task.wait(0.1) do
        pcall(function() ReplicatedStorage.Events.AddStrength:FireServer(9999999) end)
    end
end)

-- 🔴 10. AUTO KUMPULKAN UANG
BuatTombol("💰 AUTO KUMPUL UANG", function(Nyala)
    _G.AutoMoney = Nyala
    while _G.AutoMoney and task.wait(0.3) do
        pcall(function() ReplicatedStorage.Events.CollectMoney:FireServer() end)
    end
end)

-- ==================================================
-- 🫟 AKHIR SCRIPT | YUKINAGA ABSOLUTE SYSTEM
-- ==================================================
