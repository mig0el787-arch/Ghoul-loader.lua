-- ===== LOADER SAFE =====
if not game:IsLoaded() then
	game.Loaded:Wait()
end

local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local player = Players.LocalPlayer

-- ===== MUSIC CLEAN =====
pcall(function()
	local s = Instance.new("Sound")
	s.SoundId = "rbxassetid://1843529274" -- música clean
	s.Volume = 1.5
	s.Looped = true
	s.Parent = SoundService
	s:Play()
end)

-- ===== SCREEN LOADER =====
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "GhoulLoader"

local bg = Instance.new("Frame", gui)
bg.Size = UDim2.fromScale(1,1)
bg.BackgroundColor3 = Color3.fromRGB(10,10,10)

local barBG = Instance.new("Frame", bg)
barBG.Size = UDim2.new(0.6,0,0.03,0)
barBG.Position = UDim2.new(0.2,0,0.8,0)
barBG.BackgroundColor3 = Color3.fromRGB(40,40,40)

local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(170,0,255)

local text = Instance.new("TextLabel", bg)
text.Size = UDim2.new(1,0,0.05,0)
text.Position = UDim2.new(0,0,0.85,0)
text.BackgroundTransparency = 1
text.TextColor3 = Color3.new(1,1,1)
text.TextScaled = true
text.Text = "Carregando 0%"

for i = 1,100 do
	bar.Size = UDim2.new(i/100,0,1,0)
	text.Text = "Carregando "..i.."%"
	task.wait(0.03)
end

gui:Destroy()

-- ===== LOAD HUB =====
loadstring(game:HttpGet("https://raw.githubusercontent.com/mig0el787-arch/Ghoul-hub/main/Ghoul_hub.lua"))()
