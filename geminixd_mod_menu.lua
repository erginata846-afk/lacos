-- ==================================================
-- 🔥 GEMINIXD MUSCLE LEGENDS | MOD MENU VIP 🔥
-- 🔐 SISTEM KEY AKTIFASI KHUSUS PEMBUAT 🔐
-- 💪 JADI DEWA OTOT DENGAN SATU KLIK 💪
-- ==================================================

-- ⚙️ PENGATURAN DASAR (JANGAN DIUBAH SEMBARANGAN) ⚙️
local KeyBenar = "GEMINIXD2026PRO"
local MenuAktif = false

-- 📦 LAYANAN GAME
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local WS = game:GetService("Workspace")
local PL = game:GetService("Players")
local LP = PL.LocalPlayer
local Replicated = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

-- ==================================================
-- 🎨 BIKIN TAMPILAN MOD MENU KEREN
-- ==================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GEMINIXD_ModMenu"
ScreenGui.Parent = LP:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 📌 KOTAK UTAMA
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 450)
MainFrame.Position = UDim2.new(0.02, 0, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.new(0.08, 0.08, 0.08)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

-- EFEK LENGKUNG & GLOW
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = MainFrame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.new(1, 0.2, 0.5)
Stroke.Thickness = 2
Stroke.Parent = MainFrame

-- 🏷️ JUDUL MENU
local Judul = Instance.new("TextLabel")
Judul.Size = UDim2.new(1, 0, 0, 40)
Judul.BackgroundTransparency = 1
Judul.Text = "🔥 GEMINIXD VIP MOD MENU 🔥"
Judul.Font = Enum.Font.GothamBold
Judul.TextSize = 14
Judul.TextColor3 = Color3.new(1, 0.8, 0.2)
Judul.Parent = MainFrame

-- ==================================================
-- 🔑 BAGIAN MASUKIN KUNCI / AKTIFASI
-- ==================================================
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(1, -20, 1, -50)
KeyFrame.Position = UDim2.new(0, 10, 0, 45)
KeyFrame.BackgroundTransparency = 1
KeyFrame.Visible = true
KeyFrame.Parent = MainFrame

-- TULISAN PERINTAH
local TeksMasuk = Instance.new("TextLabel")
TeksMasuk.Size = UDim2.new(1, 0, 0, 30)
TeksMasuk.BackgroundTransparency = 1
TeksMasuk.Text = "⚠️ MASUKKAN KUNCI AKSES DI BAWAH ⚠️"
TeksMasuk.Font = Enum.Font.GothamMedium
TeksMasuk.TextSize = 12
TeksMasuk.TextColor3 = Color3.new(1, 0.3, 0.3)
TeksMasuk.Parent = KeyFrame

-- KOLOM TULIS KUNCI
local InputKey = Instance.new("TextBox")
InputKey.Size = UDim2.new(1, -20, 0, 40)
InputKey.Position = UDim2.new(0, 10, 0, 40)
InputKey.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
InputKey.PlaceholderText = "Ketik Kunci Di Sini..."
InputKey.Font = Enum.Font.Gotham
InputKey.TextSize = 14
InputKey.TextColor3 = Color3.new(1,1,1)
InputKey.Parent = KeyFrame
Instance.new("UICorner", InputKey).CornerRadius = UDim.new(0,8)

-- TOMBOL KONFIRMASI
local TombolCek = Instance.new("TextButton")
TombolCek.Size = UDim2.new(1, -20, 0, 40)
TombolCek.Position = UDim2.new(0, 10, 0, 90)
TombolCek.BackgroundColor3 = Color3.new(0.2, 0.5, 1)
TombolCek.Text = "✅ AKTIFKAN FITUR"
TombolCek.Font = Enum.Font.GothamBold
TombolCek.TextSize = 14
TombolCek.TextColor3 = Color3.new(1,1,1)
TombolCek.Parent = KeyFrame
Instance.new("UICorner", TombolCek).CornerRadius = UDim.new(0,8)

-- TANDA PERINGATAN / HASIL
local HasilTeks = Instance.new("TextLabel")
HasilTeks.Size = UDim2.new(1, 0, 0, 30)
HasilTeks.Position = UDim2.new(0, 0, 0, 140)
HasilTeks.BackgroundTransparency = 1
HasilTeks.Text = ""
HasilTeks.Font = Enum.Font.GothamBold
HasilTeks.TextSize = 13
HasilTeks.Parent = KeyFrame

-- ==================================================
-- 🎛️ BAGIAN FITUR (AKAN MUNCUL SETELAH KEY BENAR)
-- ==================================================
local FiturFrame = Instance.new("Frame")
FiturFrame.Size = UDim2.new(1, -20, 1, -50)
FiturFrame.Position = UDim2.new(0, 10, 0, 45)
FiturFrame.BackgroundTransparency = 1
FiturFrame.Visible = false
FiturFrame.Parent = MainFrame

-- 🟢 TOMBOL FITUR 1: AUTO LATIH
local BtnAutoLatih = Instance.new("TextButton")
BtnAutoLatih.Size = UDim2.new(1, 0, 0, 35)
BtnAutoLatih.Position = UDim2.new(0, 0, 0, 10)
BtnAutoLatih.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
BtnAutoLatih.Text = "🔴 AUTO LATIH: MATI"
BtnAutoLatih.Font = Enum.Font.GothamBold
BtnAutoLatih.TextSize = 13
BtnAutoLatih.TextColor3 = Color3.new(1,1,1)
BtnAutoLatih.Parent = FiturFrame
Instance.new("UICorner", BtnAutoLatih).CornerRadius = UDim.new(0,6)
_G.AutoLatih = false

-- 🟢 TOMBOL FITUR 2: AUTO MAKAN
local BtnAutoMakan = Instance.new("TextButton")
BtnAutoMakan.Size = UDim2.new(1, 0, 0, 35)
BtnAutoMakan.Position = UDim2.new(0, 0, 0, 50)
BtnAutoMakan.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
BtnAutoMakan.Text = "🔴 AUTO MAKAN: MATI"
BtnAutoMakan.Font = Enum.Font.GothamBold
BtnAutoMakan.TextSize = 13
BtnAutoMakan.TextColor3 = Color3.new(1,1,1)
BtnAutoMakan.Parent = FiturFrame
Instance.new("UICorner", BtnAutoMakan).CornerRadius = UDim.new(0,6)
_G.AutoMakan = false

-- 🟢 TOMBOL FITUR 3: BUKA SEMUA PINTU
local BtnUnlock = Instance.new("TextButton")
BtnUnlock.Size = UDim2.new(1, 0, 0, 35)
BtnUnlock.Position = UDim2.new(0, 0, 0, 90)
BtnUnlock.BackgroundColor33 = Color3.new(0.2, 0.2, 0.2)
BtnUnlock.Text = "🔴 BUKA SEMUA AREA: MATI"
BtnUnlock.Font = Enum.Font.GothamBold
BtnUnlock.TextSize = 13
BtnUnlock.TextColor3 = Color3.new(1,1,1)
BtnUnlock.Parent = FiturFrame
Instance.new("UICorner", BtnUnlock).CornerRadius = UDim.new(0,6)
_G.UnlockSemua = false

-- 🟢 TOMBOL FITUR 4: AUTO REBIRTH
local BtnRebirth = Instance.new("TextButton")
BtnRebirth.Size = UDim2.new(1, 0, 0, 35)
BtnRebirth.Position = UDim2.new(0, 0, 0, 130)
BtnRebirth.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
BtnRebirth.Text = "🔴 AUTO REBIRTH: MATI"
BtnRebirth.Font = Enum.Font.GothamBold
BtnRebirth.TextSize = 13
BtnRebirth.TextColor3 = Color3.new(1,1,1)
BtnRebirth.Parent = FiturFrame
Instance.new("UICorner", BtnRebirth).CornerRadius = UDim.new(0,6)
_G.AutoRebirth = false

-- 🟢 TOMBOL FITUR 5: KEKUATAN 2X
local BtnDouble = Instance.new("TextButton")
BtnDouble.Size = UDim2.new(1, 0, 0, 35)
BtnDouble.Position = UDim2.new(0, 0, 0, 170)
BtnDouble.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
BtnDouble.Text = "🔴 KEKUATAN 2X: MATI"
BtnDouble.Font = Enum.Font.GothamBold
BtnDouble.TextSize = 13
BtnDouble.TextColor3 = Color3.new(1,1,1)
BtnDouble.Parent = FiturFrame
Instance.new("UICorner", BtnDouble).CornerRadius = UDim.new(0,6)
_G.DoubleStr = false

-- 🎚️ PENGATURAN KECEPATAN
local TeksCepat = Instance.new("TextLabel")
TeksCepat.Size = UDim2.new(1, 0, 0, 25)
TeksCepat.Position = UDim2.new(0, 0, 0, 220)
TeksCepat.BackgroundTransparency = 1
TeksCepat.Text = "⚡ KECEPATAN LATIH: 10x"
TeksCepat.Font = Enum.Font.GothamMedium
TeksCepat.TextSize = 12
TeksCepat.TextColor3 = Color3.new(1,1,1)
TeksCepat.Parent = FiturFrame
_G.Kecepatan = 10

-- ==================================================
-- 🔑 LOGIKA SISTEM KUNCI AKTIFASI
-- ==================================================
TombolCek.MouseButton1Click:Connect(function()
    if InputKey.Text == "" then
        HasilTeks.TextColor3 = Color3.new(1,0.2,0.2)
        HasilTeks.Text = "❌ Kunci tidak boleh kosong!"
        return
    end
    
    if InputKey.Text == KeyBenar then
        HasilTeks.TextColor3 = Color3.new(0.2,1,0.2)
        HasilTeks.Text = "✅ BERHASIL! MOD MENU DIBUKA!"
        wait(1)
        KeyFrame.Visible = false
        FiturFrame.Visible = true
        MenuAktif = true
        StarterGui:SetCore("SendNotification", {Title = "GEMINIXD", Text = "Akses diberikan Bos! Semua fitur siap pakai!", Duration = 5})
    else
        HasilTeks.TextColor3 = Color3.new(1,0.2,0.2)
        HasilTeks.Text = "❌ KUNCI SALAH / TIDAK VALID!"
        InputKey.Text = ""
    end
end)

-- ==================================================
-- 🔄 FUNGSI TOMBOL ON/OFF
-- ==================================================
BtnAutoLatih.MouseButton1Click:Connect(function()
    _G.AutoLatih = not _G.AutoLatih
    BtnAutoLatih.Text = _G.AutoLatih and "🟢 AUTO LATIH: AKTIF" or "🔴 AUTO LATIH: MATI"
    BtnAutoLatih.BackgroundColor3 = _G.AutoLatih and Color3.new(0, 0.6, 0.2) or Color3.new(0.2,0.2,0.2)
end)

BtnAutoMakan.MouseButton1Click:Connect(function()
    _G.AutoMakan = not _G.AutoMakan
    BtnAutoMakan.Text = _G.AutoMakan and "🟢 AUTO MAKAN: AKTIF" or "🔴 AUTO MAKAN: MATI"
    BtnAutoMakan.BackgroundColor3 = _G.AutoMakan and Color3.new(0, 0.6, 0.2) or Color3.new(0.2,0.2,0.2)
end)

BtnUnlock.MouseButton1Click:Connect(function()
    _G.UnlockSemua = not _G.UnlockSemua
    BtnUnlock.Text = _G.UnlockSemua and "🟢 BUKA SEMUA AREA: AKTIF" or "🔴 BUKA SEMUA AREA: MATI"
    BtnUnlock.BackgroundColor3 = _G.UnlockSemua and Color3.new(0, 0.6, 0.2) or Color3.new(0.2,0.2,0.2)
end)

BtnRebirth.MouseButton1Click:Connect(function()
    _G.AutoRebirth = not _G.AutoRebirth
    BtnRebirth.Text = _G.AutoRebirth and "🟢 AUTO REBIRTH: AKTIF" or "🔴 AUTO REBIRTH: MATI"
    BtnRebirth.BackgroundColor3 = _G.AutoRebirth and Color3.new(0, 0.6, 0.2) or Color3.new(0.2,0.2,0.2)
end)

BtnDouble.MouseButton1Click:Connect(function()
    _G.DoubleStr = not _G.DoubleStr
    BtnDouble.Text = _G.DoubleStr and "🟢 KEKUATAN 2X: AKTIF" or "🔴 KEKUATAN 2X: MATI"
    BtnDouble.BackgroundColor3 = _G.DoubleStr and Color3.new(0, 0.6, 0.2) or Color3.new(0.2,0.2,0.2)
end)

-- ==================================================
-- ⚙️ SISTEM UTAMA FUNGSI FITUR
-- ==================================================
local function CariBenda(Nama)
    local Terdekat, JarakMin = nil, math.huge
    for _, Obj in pairs(WS:GetDescendants()) do
        if Obj:IsA("Part") and Obj.Name == Nama and Obj:FindFirstChild("TouchTransmitter") then
            local Jarak = (LP.Character.HumanoidRootPart.Position - Obj.Position).Magnitude
            if Jarak < JarakMin then JarakMin = Jarak; Terdekat = Obj end
        end
    end
    return Terdekat
end

RS.Heartbeat:Connect(function()
    if not MenuAktif or not LP.Character or not LP.Character:FindFirstChild("HumanoidRootPart") then return end

    -- 🔓 BUKA SEMUA PINTU
    if _G.UnlockSemua then
        for _, Gate in pairs(WS:GetDescendants()) do
            if Gate.Name == "Gate" and Gate:FindFirstChild("TouchTransmitter") then
                pcall(function() Replicated.Remotes.GateTrigger:FireServer(Gate) end)
            end
        end
    end

    -- ♻️ AUTO REBIRTH
    if _G.AutoRebirth then
        local LS = LP:FindFirstChild("leaderstats")
        if LS and LS.Strength.Value >= (LS.Rebirths.Value * 1000 + 500) then
            pcall(function() Replicated.Remotes.Rebirth:FireServer() end)
        end
    end

    -- 💪 AUTO LATIH
    if _G.AutoLatih then
        local Beban = CariBenda("Weight")
        if Beban then
            LP.Character.Humanoid:MoveTo(Beban.Position)
            wait(1/_G.Kecepatan)
            pcall(function() firetouchtransmitter(Beban.TouchTransmitter, LP.Character.Humanoid) end)
            -- ⚡ KEKUATAN LIPAT
            if _G.DoubleStr then pcall(function() Replicated.Remotes.StrengthGain:InvokeServer(2) end) end
        end
    end

    -- 🍔 AUTO MAKAN
    if _G.AutoMakan and LP.Character.Humanoid.Health < 90 then
        local Makanan = CariBenda("Food")
        if Makanan then
            LP.Character.Humanoid:MoveTo(Makanan.Position)
            pcall(function() firetouchtransmitter(Makanan.TouchTransmitter, LP.Character.Humanoid) end)
        end
    end

end)

print("✅ GEMINIXD MOD MENU BERHASIL DIMUAT! | KUNCI: GEMINIXD2026PRO")