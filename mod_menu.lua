-- ==================================================
-- 🔥 MBG XITER | MUSCLE LEGENDS 🔥
-- 🟢 TANPA KUNCI • TAMPILAN ELEGAN • FITUR LENGKAP 🟢
-- 💪 KUASAI PETA DENGAN KEKUATAN PENUH 💪
-- ==================================================

-- 📦 LAYANAN GAME
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local WS = game:GetService("Workspace")
local PL = game:GetService("Players")
local LP = PL.LocalPlayer
local Replicated = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

-- ==================================================
-- 🎨 TAMPILAN MENU ELEGAN & FONT KEREN
-- ==================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MBG_XITER_Menu"
ScreenGui.Parent = LP:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- 📌 KOTAK UTAMA
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 280, 0, 400)
MainFrame.Position = UDim2.new(0.02, 0, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.new(0.07, 0.07, 0.07)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

-- BIKIN LENGKUNG
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = MainFrame

-- GARIS TEPI BERWARNA EMAS
local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.new(1, 0.8, 0.2)
Stroke.Thickness = 2
Stroke.Parent = MainFrame

-- 🏷️ JUDUL UTAMA (FONT PALING KEREN & TEBAL)
local Judul = Instance.new("TextLabel")
Judul.Size = UDim2.new(1, 0, 0, 40)
Judul.BackgroundTransparency = 1
Judul.Text = "✨ MBG XITER ✨"
Judul.Font = Enum.Font.GothamBlack -- FONT TEBAL & MEWAH
Judul.TextSize = 18
Judul.TextColor3 = Color3.new(1, 0.8, 0.2) -- WARNA EMAS
Judul.TextStrokeTransparency = 0.8
Judul.Parent = MainFrame

-- SUB JUDUL
local SubJudul = Instance.new("TextLabel")
SubJudul.Size = UDim2.new(1, 0, 0, 20)
SubJudul.Position = UDim2.new(0, 0, 0, 35)
SubJudul.BackgroundTransparency = 1
SubJudul.Text = "MUSCLE LEGENDS | PREMIUM EDITION"
SubJudul.Font = Enum.Font.GothamBoldItalic -- FONT MIRING KEREN
SubJudul.TextSize = 10
SubJudul.TextColor3 = Color3.new(0.8, 0.8, 0.8)
SubJudul.Parent = MainFrame

-- GARIS PEMBATAS
local Garis = Instance.new("Frame")
Garis.Size = UDim2.new(0.85, 0, 0, 1)
Garis.Position = UDim2.new(0.075, 0, 0, 55)
Garis.BackgroundColor3 = Color3.new(1, 0.8, 0.2)
Garis.Parent = MainFrame

-- ==================================================
-- 🎛️ TOMBOL FITUR (FONT DIUBAH JADI LEBIH KEREN)
-- ==================================================
-- 🟢 AUTO LATIH
local BtnAutoLatih = Instance.new("TextButton")
BtnAutoLatih.Size = UDim2.new(0.85, 0, 0, 35)
BtnAutoLatih.Position = UDim2.new(0.075, 0, 0, 70)
BtnAutoLatih.BackgroundColor3 = Color3.new(0.12, 0.12, 0.12)
BtnAutoLatih.Text = "🔴 AUTO LATIH: MATI"
BtnAutoLatih.Font = Enum.Font.GothamBold -- FONT TEBAL
BtnAutoLatih.TextSize = 12
BtnAutoLatih.TextColor3 = Color3.new(1,1,1)
BtnAutoLatih.Parent = MainFrame
Instance.new("UICorner", BtnAutoLatih).CornerRadius = UDim.new(0,8)
_G.AutoLatih = false

-- 🟢 AUTO MAKAN
local BtnAutoMakan = Instance.new("TextButton")
BtnAutoMakan.Size = UDim2.new(0.85, 0, 0, 35)
BtnAutoMakan.Position = UDim2.new(0.075, 0, 0, 110)
BtnAutoMakan.BackgroundColor3 = Color3.new(0.12, 0.12, 0.12)
BtnAutoMakan.Text = "🔴 AUTO MAKAN: MATI"
BtnAutoMakan.Font = Enum.Font.GothamBold
BtnAutoMakan.TextSize = 12
BtnAutoMakan.TextColor3 = Color3.new(1,1,1)
BtnAutoMakan.Parent = MainFrame
Instance.new("UICorner", BtnAutoMakan).CornerRadius = UDim.new(0,8)
_G.AutoMakan = false

-- 🟢 BUKA SEMUA AREA
local BtnUnlock = Instance.new("TextButton")
BtnUnlock.Size = UDim2.new(0.85, 0, 0, 35)
BtnUnlock.Position = UDim2.new(0.075, 0, 0, 150)
BtnUnlock.BackgroundColor3 = Color3.new(0.12, 0.12, 0.12)
BtnUnlock.Text = "🔴 BUKA SEMUA AREA: MATI"
BtnUnlock.Font = Enum.Font.GothamBold
BtnUnlock.TextSize = 12
BtnUnlock.TextColor3 = Color3.new(1,1,1)
BtnUnlock.Parent = MainFrame
Instance.new("UICorner", BtnUnlock).CornerRadius = UDim.new(0,8)
_G.UnlockSemua = false

-- 🟢 AUTO REBIRTH
local BtnRebirth = Instance.new("TextButton")
BtnRebirth.Size = UDim2.new(0.85, 0, 0, 35)
BtnRebirth.Position = UDim2.new(0.075, 0, 0, 190)
BtnRebirth.BackgroundColor3 = Color3.new(0.12, 0.12, 0.12)
BtnRebirth.Text = "🔴 AUTO REBIRTH: MATI"
BtnRebirth.Font = Enum.Font.GothamBold
BtnRebirth.TextSize = 12
BtnRebirth.TextColor3 = Color3.new(1,1,1)
BtnRebirth.Parent = MainFrame
Instance.new("UICorner", BtnRebirth).CornerRadius = UDim.new(0,8)
_G.AutoRebirth = false

-- 🟢 KEKUATAN 2X LIPAT
local BtnDouble = Instance.new("TextButton")
BtnDouble.Size = UDim2.new(0.85, 0, 0, 35)
BtnDouble.Position = UDim2.new(0.075, 0, 0, 230)
BtnDouble.BackgroundColor3 = Color3.new(0.12, 0.12, 0.12)
BtnDouble.Text = "🔴 KEKUATAN 2X: MATI"
BtnDouble.Font = Enum.Font.GothamBold
BtnDouble.TextSize = 12
BtnDouble.TextColor3 = Color3.new(1,1,1)
BtnDouble.Parent = MainFrame
Instance.new("UICorner", BtnDouble).CornerRadius = UDim.new(0,8)
_G.DoubleStr = false

-- 🟢 KECEPATAN MAKSIMAL
local BtnSpeed = Instance.new("TextButton")
BtnSpeed.Size = UDim2.new(0.85, 0, 0, 35)
BtnSpeed.Position = UDim2.new(0.075, 0, 0, 270)
BtnSpeed.BackgroundColor3 = Color3.new(0.12, 0.12, 0.12)
BtnSpeed.Text = "🔴 KECEPATAN 20X: MATI"
BtnSpeed.Font = Enum.Font.GothamBold
BtnSpeed.TextSize = 12
BtnSpeed.TextColor3 = Color3.new(1,1,1)
BtnSpeed.Parent = MainFrame
Instance.new("UICorner", BtnSpeed).CornerRadius = UDim.new(0,8)
_G.SpeedMax = false
_G.Kecepatan = 10

-- 🟢 JARAK AMBILL JAUH
local BtnRange = Instance.new("TextButton")
BtnRange.Size = UDim2.new(0.85, 0, 0, 35)
BtnRange.Position = UDim2.new(0.075, 0, 0, 310)
BtnRange.BackgroundColor3 = Color3.new(0.12, 0.12, 0.12)
BtnRange.Text = "🔴 JARAK JAUH: MATI"
BtnRange.Font = Enum.Font.GothamBold
BtnRange.TextSize = 12
BtnRange.TextColor3 = Color3.new(1,1,1)
BtnRange.Parent = MainFrame
Instance.new("UICorner", BtnRange).CornerRadius = UDim.new(0,8)
_G.RangeMax = false
_G.Jarak = 100

-- 🟢 TUTUP / BUKA MENU
local BtnTutup = Instance.new("TextButton")
BtnTutup.Size = UDim2.new(0.85, 0, 0, 35)
BtnTutup.Position = UDim2.new(0.075, 0, 0, 350)
BtnTutup.BackgroundColor3 = Color3.new(0.8, 0.15, 0.15)
BtnTutup.Text = "❌ TUTUP MENU"
BtnTutup.Font = Enum.Font.GothamBlack
BtnTutup.TextSize = 12
BtnTutup.TextColor3 = Color3.new(1,1,1)
BtnTutup.Parent = MainFrame
Instance.new("UICorner", BtnTutup).CornerRadius = UDim.new(0,8)
local MenuBuka = true

-- ==================================================
-- 🔄 SISTEM KLIK TOMBOL
-- ==================================================
BtnAutoLatih.MouseButton1Click:Connect(function()
    _G.AutoLatih = not _G.AutoLatih
    BtnAutoLatih.Text = _G.AutoLatih and "🟢 AUTO LATIH: AKTIF" or "🔴 AUTO LATIH: MATI"
    BtnAutoLatih.BackgroundColor3 = _G.AutoLatih and Color3.new(0, 0.6, 0.25) or Color3.new(0.12,0.12,0.12)
end)

BtnAutoMakan.MouseButton1Click:Connect(function()
    _G.AutoMakan = not _G.AutoMakan
    BtnAutoMakan.Text = _G.AutoMakan and "🟢 AUTO MAKAN: AKTIF" or "🔴 AUTO MAKAN: MATI"
    BtnAutoMakan.BackgroundColor3 = _G.AutoMakan and Color3.new(0, 0.6, 0.25) or Color3.new(0.12,0.12,0.12)
end)

BtnUnlock.MouseButton1Click:Connect(function()
    _G.UnlockSemua = not _G.UnlockSemua
    BtnUnlock.Text = _G.UnlockSemua and "🟢 BUKA SEMUA AREA: AKTIF" or "🔴 BUKA SEMUA AREA: MATI"
    BtnUnlock.BackgroundColor3 = _G.UnlockSemua and Color3.new(0, 0.6, 0.25) or Color3.new(0.12,0.12,0.12)
end)

BtnRebirth.MouseButton1Click:Connect(function()
    _G.AutoRebirth = not _G.AutoRebirth
    BtnRebirth.Text = _G.AutoRebirth and "🟢 AUTO REBIRTH: AKTIF" or "🔴 AUTO REBIRTH: MATI"
    BtnRebirth.BackgroundColor3 = _G.AutoRebirth and Color3.new(0, 0.6, 0.25) or Color3.new(0.12,0.12,0.12)
end)

BtnDouble.MouseButton1Click:Connect(function()
    _G.DoubleStr = not _G.DoubleStr
    BtnDouble.Text = _G.DoubleStr and "🟢 KEKUATAN 2X: AKTIF" or "🔴 KEKUATAN 2X: MATI"
    BtnDouble.BackgroundColor3 = _G.DoubleStr and Color3.new(0, 0.6, 0.25) or Color3.new(0.12,0.12,0.12)
end)

BtnSpeed.MouseButton1Click:Connect(function()
    _G.SpeedMax = not _G.SpeedMax
    _G.Kecepatan = _G.SpeedMax and 20 or 10
    BtnSpeed.Text = _G.SpeedMax and "🟢 KECEPATAN 20X: AKTIF" or "🔴 KECEPATAN 20X: MATI"
    BtnSpeed.BackgroundColor3 = _G.SpeedMax and Color3.new(0, 0.6, 0.25) or Color3.new(0.12,0.12,0.12)
end)

BtnRange.MouseButton1Click:Connect(function()
    _G.RangeMax = not _G.RangeMax
    _G.Jarak = _G.RangeMax and 9999 or 100
    BtnRange.Text = _G.RangeMax and "🟢 JARAK JAUH: AKTIF" or "🔴 JARAK JAUH: MATI"
    BtnRange.BackgroundColor3 = _G.RangeMax and Color3.new(0, 0.6, 0.25) or Color3.new(0.12,0.12,0.12)
end)

BtnTutup.MouseButton1Click:Connect(function()
    MenuBuka = not MenuBuka
    MainFrame.Visible = MenuBuka
    BtnTutup.Text = MenuBuka and "❌ TUTUP MENU" or "✅ BUKA MENU"
    BtnTutup.BackgroundColor3 = MenuBuka and Color3.new(0.8,0.15,0.15) or Color3.new(0, 0.6, 0.25)
end)

-- ==================================================
-- ⚙️ SISTEM UTAMA BERFUNGSI LENGKAP
-- ==================================================
local function CariBenda(Nama)
    local Terdekat, JarakMin = nil, math.huge
    for _, Obj in pairs(WS:GetDescendants()) do
        if Obj:IsA("Part") and Obj.Name == Nama and Obj:FindFirstChild("TouchTransmitter") then
            local Jarak = (LP.Character.HumanoidRootPart.Position - Obj.Position).Magnitude
            if Jarak < JarakMin and Jarak < _G.Jarak then
                JarakMin = Jarak
                Terdekat = Obj
            end
        end
    end
    return Terdekat
end

RS.Heartbeat:Connect(function()
    if not LP.Character or not LP.Character:FindFirstChild("HumanoidRootPart") then return end

    -- 🔓 BUKA SEMUA PINTU
    if _G.UnlockSemua then
        for _, Gate in pairs(WS:GetDescendants()) do
            if Gate.Name == "Gate" and Gate:FindFirstChild("TouchTransmitter") then
                pcall(function() Replicated.Remotes.GateTrigger:FireServer(Gate) end)
            end
        end
    end

    -- ♻️ AUTO REBIRTH OTOMATIS
    if _G.AutoRebirth then
        local LS = LP:FindFirstChild("leaderstats")
        if LS and LS.Strength.Value >= (LS.Rebirths.Value * 1000 + 500) then
            pcall(function() Replicated.Remotes.Rebirth:FireServer() end)
        end
    end

    -- 💪 AUTO ANGKAT BEBAN
    if _G.AutoLatih then
        local Beban = CariBenda("Weight")
        if Beban then
            LP.Character.Humanoid:MoveTo(Beban.Position)
            wait(1/_G.Kecepatan)
            pcall(function() firetouchtransmitter(Beban.TouchTransmitter, LP.Character.Humanoid) end)
            -- ⚡ KALI LIPAT KEKUATAN
            if _G.DoubleStr then 
                pcall(function() 
                    Replicated.Remotes.StrengthGain:InvokeServer(2) 
                    Replicated.Remotes.StrengthGain:InvokeServer(2) 
                end) 
            end
        end
    end

    -- 🍔 AUTO MAKAN KETIKA LEMES
    if _G.AutoMakan and LP.Character.Humanoid.Health < 95 then
        local Makanan = CariBenda("Food")
        if Makanan then
            LP.Character.Humanoid:MoveTo(Makanan.Position)
            pcall(function() firetouchtransmitter(Makanan.TouchTransmitter, LP.Character.Humanoid) end)
        end
    end

end)

-- NOTIFIKASI BERHASIL
StarterGui:SetCore("SendNotification", {
    Title = "MBG XITER",
    Text = "Script Berhasil Dijalankan | Premium ✅",
    Duration = 3
})

print("✅ MBG XITER | MUSCLE LEGENDS | AKTIF 100%")