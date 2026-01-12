--// GHOUL HUB LOADER (ALL-IN-ONE)

------------------------
-- SERVICES
------------------------
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

------------------------
-- MUSIC (TOCA DE VERDADE)
------------------------
local music = Instance.new("Sound")
music.SoundId = "rbxassetid://SEU_ID_DE_MUSICA"
music.Volume = 2
music.Looped = true
music.Parent = SoundService
music:Play()

------------------------
-- LOADER SCREEN
------------------------
local loaderGui = Instance.new("ScreenGui", PlayerGui)
loaderGui.IgnoreGuiInset = true

local loader = Instance.new("Frame", loaderGui)
loader.Size = UDim2.fromScale(1,1)
loader.BackgroundColor3 = Color3.fromRGB(20,0,30)

task.delay(2.5, function()
	loaderGui:Destroy()
end)

------------------------
-- FLOATING BUTTON
------------------------
local floatGui = Instance.new("ScreenGui", PlayerGui)

local floatBtn = Instance.new("ImageButton", floatGui)
floatBtn.Size = UDim2.fromOffset(70,70)
floatBtn.Position = UDim2.fromScale(0.08,0.5)
floatBtn.BackgroundColor3 = Color3.fromRGB(130,0,190)
floatBtn.Image = "rbxassetid://ID_DA_FOTO_DO_GHOUL"
Instance.new("UICorner", floatBtn).CornerRadius = UDim.new(1,0)

-- DRAG
local dragging, dragStart, startPos
floatBtn.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = i.Position
		startPos = floatBtn.Position
	end
end)

UIS.InputChanged:Connect(function(i)
	if dragging and (i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseMovement) then
		local delta = i.Position - dragStart
		floatBtn.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

UIS.InputEnded:Connect(function()
	dragging = false
end)

------------------------
-- HUB GUI
------------------------
local hubGui = Instance.new("ScreenGui", PlayerGui)
hubGui.Enabled = false

local main = Instance.new("Frame", hubGui)
main.Size = UDim2.fromOffset(520,330)
main.Position = UDim2.fromScale(0.5,0.5)
main.AnchorPoint = Vector2.new(0.5,0.5)
main.BackgroundColor3 = Color3.fromRGB(15,15,15)
Instance.new("UICorner", main).CornerRadius = UDim.new(0,14)

-- SIDEBAR
local side = Instance.new("Frame", main)
side.Size = UDim2.new(0,120,1,0)
side.BackgroundColor3 = Color3.fromRGB(245,245,245)

-- CONTENT
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0,120,0,0)
content.Size = UDim2.new(1,-120,1,0)
content.BackgroundTransparency = 1

------------------------
-- TOGGLE HUB
------------------------
floatBtn.MouseButton1Click:Connect(function()
	hubGui.Enabled = not hubGui.Enabled
end)

------------------------
-- EXEMPLO DE FUNÇÃO
------------------------
local function createButton(text,y,callback)
	local b = Instance.new("TextButton", content)
	b.Size = UDim2.fromOffset(200,40)
	b.Position = UDim2.fromOffset(30,y)
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextSize = 14
	b.BackgroundColor3 = Color3.fromRGB(120,0,180)
	b.TextColor3 = Color3.new(1,1,1)
	b.MouseButton1Click:Connect(callback)
end

createButton("Close Hub",30,function()
	hubGui.Enabled = false
end)
