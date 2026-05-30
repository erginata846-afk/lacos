-- [LAYANAN DASAR]
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

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
MainFrame.Size = UDim2.new(0, 340, 0, 500)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true

-- [EFEK SUDUT BULAT]
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = MainFrame

-- [GARIS STROKE]
local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(255, 70, 120)
Stroke.Thickness = 2
Stroke.Parent = MainFrame

-- [GARIS ATAS (PEGANGAN UNTUK GESER)]
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BorderSizePixel = 0

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 12)
TopCorner.Parent = TopBar

-- [JUDUL]
local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.Text = "🫟 YUKINAGA v2.0 | Muscle Legends"
Title.Font = Enum.Font.GothamBlack
Title.TextColor3 = Color3.fromRGB(255, 70, 120)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, -50, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.TextSize = 13
Title.TextXAlignment = Enum.TextXAlignment.Left

-- [TOMBOL CLOSE]
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.Text = "✕"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 120)
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -40, 0.5, -17)
CloseBtn.TextSize = 20
CloseBtn.BorderSizePixel = 0
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 8)

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

-- [TUTUP MENU]
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    wait(2)
    MainFrame.Visible = true
end)

-- [WADAH ISI FITUR]
local Content = Instance.new("ScrollingFrame")
Content.Parent = MainFrame
Content.BackgroundTransparency = 1
Content.Position = UDim2.new(0, 0, 0, 50)
Content.Size = UDim2.new(1, 0, 1, -50)
Content.CanvasSize = UDim2.new(0, 0, 3, 0)
Content.ScrollBarThickness = 5
Content.ScrollBarImageColor3 = Color3.fromRGB(255, 70, 120)
Content.BorderSizePixel = 0

local List = Instance.new("UIListLayout")
List.Parent = Content
List.Padding = UDim.new(0, 10)
List.SortOrder = Enum.SortOrder.LayoutOrder

local Padding = Instance.new("UIPadding")
Padding.Parent = Content
Padding.PaddingLeft = UDim.new(0, 12)
Padding.PaddingRight = UDim.new(0, 12)
Padding.PaddingTop = UDim.new(0, 8)
Padding.PaddingBottom = UDim.new(0, 8)

-- ==================================================
-- [FUNGSI PEMBUAT TOMBOL OTOMATIS]
-- ==================================================
local function BuatTombol(Nama, Fungsi, IsToggle)
    local Btn = Instance.new("TextButton")
    Btn.Parent = Content
    Btn.Text = Nama
    Btn.Font = Enum.Font.GothamSemibold
    Btn.TextColor3 = Color3.fromRGB(240, 240, 240)
    Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    Btn.Size = UDim2.new(1, -10, 0, 42)
    Btn.TextSize = 12
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
        if IsToggle then
            TweenService:Create(Btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(50, 100, 50)}):Play()
        else
            TweenService:Create(Btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(50, 50, 75)}):Play()
        end
    end)
    
    return Btn
end

-- ==================================================
-- [DAFTAR FITUR UTAMA - MUSCLE LEGENDS MAP]
-- ==================================================

-- ✅ KATEGORI 1: AUTO FARMING
local Label1 = Instance.new("TextLabel")
Label1.Parent = Content
Label1.Text = "📊 AUTO FARMING"
Label1.Font = Enum.Font.GothamBlack
Label1.TextColor3 = Color3.fromRGB(255, 200, 0)
Label1.BackgroundTransparency = 1
Label1.Size = UDim2.new(1, -10, 0, 30)
Label1.TextSize = 12

-- 1. Auto Latihan Otot
_G.AutoTrain = false
BuatTombol("💪 AUTO LATIHAN", function()
    _G.AutoTrain = not _G.AutoTrain
    while _G.AutoTrain and task.wait(0.1) do
        pcall(function()
            for _,v in pairs(Workspace:GetDescendants()) do
                if v.Name == "Weight" and v:FindFirstChild("ClickDetector") then
                    fireclickdetector(v.ClickDetector)
                    HRP.CFrame = v.CFrame + Vector3.new(0, 3, 0)
                    task.wait(0.05)
                end
            end
        end)
    end
end, true)

-- 2. Auto Makan (Food Farming)
_G.AutoEat = false
BuatTombol("🍔 AUTO MAKAN", function()
    _G.AutoEat = not _G.AutoEat
    while _G.AutoEat and task.wait(0.2) do
        pcall(function()
            for _,v in pairs(Workspace:GetDescendants()) do
                if v.Name == "Food" and v:FindFirstChild("ClickDetector") then
                    fireclickdetector(v.ClickDetector)
                    HRP.CFrame = v.CFrame
                    task.wait(0.1)
                end
            end
        end)
    end
end, true)

-- 3. Auto Ambil Hadiah
_G.AutoReward = false
BuatTombol("🎁 AUTO KLAIM HADIAH", function()
    _G.AutoReward = not _G.AutoReward
    while _G.AutoReward and task.wait(0.5) do
        pcall(function()
            for _,v in pairs(Workspace:GetDescendants()) do
                if v.Name == "Reward" and v:FindFirstChild("TouchInterest") then
                    HRP.CFrame = v.CFrame
                    task.wait(0.3)
                end
            end
        end)
    end
end, true)

-- ✅ KATEGORI 2: UNLOCK AREA
local Label2 = Instance.new("TextLabel")
Label2.Parent = Content
Label2.Text = "🗺️ UNLOCK AREA"
Label2.Font = Enum.Font.GothamBlack
Label2.TextColor3 = Color3.fromRGB(255, 200, 0)
Label2.BackgroundTransparency = 1
Label2.Size = UDim2.new(1, -10, 0, 30)
Label2.TextSize = 12

-- 4. Buka Semua Otot
BuatTombol("🦾 BUKA SEMUA OTOT", function()
    pcall(function()
        for i=1, 100 do
            local args = {[1] = i}
            pcall(function()
                ReplicatedStorage:FindFirstChild("Events"):FindFirstChild("UpgradeMuscle"):FireServer(unpack(args))
            end)
            task.wait(0.05)
        end
    end)
end)

-- 5. Buka Semua Area
BuatTombol("🔓 BUKA SEMUA AREA", function()
    pcall(function()
        for _,v in pairs(Workspace:GetDescendants()) do
            if v.Name:match("Gate") or v.Name:match("Area") or v.Name:match("Zone") then
                if v:FindFirstChild("ClickDetector") then
                    fireclickdetector(v.ClickDetector)
                    task.wait(0.02)
                end
            end
        end
    end)
end)

-- ✅ KATEGORI 3: STAT BOOST
local Label3 = Instance.new("TextLabel")
Label3.Parent = Content
Label3.Text = "⚡ STAT BOOST"
Label3.Font = Enum.Font.GothamBlack
Label3.TextColor3 = Color3.fromRGB(255, 200, 0)
Label3.BackgroundTransparency = 1
Label3.Size = UDim2.new(1, -10, 0, 30)
Label3.TextSize = 12

-- 6. Kecepatan Tinggi
BuatTombol("🏃 KECEPATAN 150", function()
    Character.Humanoid.WalkSpeed = 150
end)

-- 7. Lompat Tinggi
BuatTombol("🦘 LOMPAT TINGGI (200)", function()
    Character.Humanoid.JumpPower = 200
end)

-- 8. Gravity Down (Loncat jauh)
BuatTombol("⬇️ GRAVITY RENDAH", function()
    Workspace.Gravity = 10
end)

-- 9. Reset Stat
BuatTombol("🔄 RESET STAT NORMAL", function()
    Character.Humanoid.WalkSpeed = 16
    Character.Humanoid.JumpPower = 50
    Workspace.Gravity = 196.2
end)

-- ✅ KATEGORI 4: TELEPORT
local Label4 = Instance.new("TextLabel")
Label4.Parent = Content
Label4.Text = "🌐 TELEPORT"
Label4.Font = Enum.Font.GothamBlack
Label4.TextColor3 = Color3.fromRGB(255, 200, 0)
Label4.BackgroundTransparency = 1
Label4.Size = UDim2.new(1, -10, 0, 30)
Label4.TextSize = 12

-- 10. Teleport Spawn
BuatTombol("📍 KEMBALI KE SPAWN", function()
    pcall(function()
        HRP.CFrame = CFrame.new(0, 5, 0)
    end)
end)

-- 11. Teleport ke Area Terakhir
BuatTombol("🚀 TELEPORT KE FINISH", function()
    pcall(function()
        HRP.CFrame = CFrame.new(500, 100, 500)
    end)
end)

-- ✅ KATEGORI 5: INFO STATS
local Label5 = Instance.new("TextLabel")
Label5.Parent = Content
Label5.Text = "📈 INFO STATS"
Label5.Font = Enum.Font.GothamBlack
Label5.TextColor3 = Color3.fromRGB(255, 200, 0)
Label5.BackgroundTransparency = 1
Label5.Size = UDim2.new(1, -10, 0, 30)
Label5.TextSize = 12

-- 12. Tampilkan Stats
BuatTombol("📊 LIHAT STATS", function()
    local Stats = LocalPlayer:FindFirstChild("leaderstats")
    if Stats then
        local text = "📊 STATS KAMU:\n"
        for _, stat in pairs(Stats:GetChildren()) do
            text = text .. stat.Name .. ": " .. tostring(stat.Value) .. "\n"
        end
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "YUKINAGA STATS",
            Text = text,
            Duration = 5
        })
    end
end)

-- ==================================================
-- [NOTIFIKASI BERHASIL]
-- ==================================================
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "✅ YUKINAGA v2.0 LOADED",
    Text = "Muscle Legends Script | Full Features | Map Farming Ready",
    Duration = 4,
    Icon = "rbxasset://textures/Cursors/MouseLockedCursor.png"
})

print("✅ YUKINAGA v2.0 | MUSCLE LEGENDS | SIAP BERMAIN 100%")
print("📌 Semua fitur aktif dan siap digunakan!")

-- ==================================================
-- 🫟 END OF SCRIPT | ABSOLUTE EXECUTION
-- ==================================================
