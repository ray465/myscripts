local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("TUI GUI", "Ocean")

local collecting = Window:NewTab("Collecting")
local auto = Window:NewTab("Auto")
local misc = Window:NewTab("Misc")
local collecting = collecting:NewSection("Collectors")
local auto = auto:NewSection("Autos")
local misc = misc:NewSection("Misc")
collecting:NewButton("Collect Chests", "Gets every chest on the map", function()
while wait() do
local path = workspace.chests
local char = game.Players.LocalPlayer.Character

for i,v in pairs(path:GetChildren()) do
   char.HumanoidRootPart.CFrame = v.CFrame
   task.wait(1)
   fireproximityprompt(v.ProximityPrompt)
end

path.ChildAdded:Connect(function(v)
   char.HumanoidRootPart.CFrame = v.CFrame
   task.wait(1)
   fireproximityprompt(v.ProximityPrompt)    
end)
end
end)
collecting:NewButton("Collect Other Objects", "Collects Other Items", function()
    while wait() do
local path = workspace.other
local char = game.Players.LocalPlayer.Character

for i,v in pairs(path:GetChildren()) do
   char.HumanoidRootPart.CFrame = v.CFrame
   task.wait(1)
   fireproximityprompt(v.ProximityPrompt)
end

path.ChildAdded:Connect(function(v)
   char.HumanoidRootPart.CFrame = v.CFrame
   task.wait(1)
   fireproximityprompt(v.ProximityPrompt)    
end)
end
end)
misc:NewButton("Anti-Fog", "Removes fog", function()
    while true do
wait()
game.Lighting.FogEnd = 1000000
wait()
end
end)
misc:NewButton("FullBright", "Makes it brighter", function()
if not _G.FullBrightExecuted then

	_G.FullBrightEnabled = false

	_G.NormalLightingSettings = {
		Brightness = game:GetService("Lighting").Brightness,
		ClockTime = game:GetService("Lighting").ClockTime,
		FogEnd = game:GetService("Lighting").FogEnd,
		GlobalShadows = game:GetService("Lighting").GlobalShadows,
		Ambient = game:GetService("Lighting").Ambient
	}

	game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
		if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
			_G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Brightness = 1
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
		if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
			_G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").ClockTime = 12
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
		if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
			_G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").FogEnd = 786543
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
		if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
			_G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").GlobalShadows = false
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
		if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
			_G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
		end
	end)

	game:GetService("Lighting").Brightness = 1
	game:GetService("Lighting").ClockTime = 12
	game:GetService("Lighting").FogEnd = 786543
	game:GetService("Lighting").GlobalShadows = false
	game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)

	local LatestValue = true
	spawn(function()
		repeat
			wait()
		until _G.FullBrightEnabled
		while wait() do
			if _G.FullBrightEnabled ~= LatestValue then
				if not _G.FullBrightEnabled then
					game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
					game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
					game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
					game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
					game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
				else
					game:GetService("Lighting").Brightness = 1
					game:GetService("Lighting").ClockTime = 12
					game:GetService("Lighting").FogEnd = 786543
					game:GetService("Lighting").GlobalShadows = false
					game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
				end
				LatestValue = not LatestValue
			end
		end
	end)
end

_G.FullBrightExecuted = true
_G.FullBrightEnabled = not _G.FullBrightEnabled
end)
auto:NewButton("Auto Delete Oil", "Removes oil from inventory", function()
    while wait() do
for _, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v:IsA("Tool") and v.Name == "Oil Cup" then
v:Destroy()
end
end
end
end)
auto:NewButton("Auto Delete Blood", "Removes blood from inventory", function()
    while wait() do
for _, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v:IsA("Tool") and v.Name == "Blood Cup" then
v:Destroy()
end
end
end
end)
auto:NewButton("Auto Delete Wood", "Removes wood from inventory", function()
    while wait() do
for _, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v:IsA("Tool") and v.Name == "Wood" then
v:Destroy()
end
end
end
end)
auto:NewButton("Auto Delete Gold", "Removes gold from inventory", function()
    while wait() do
for _, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v:IsA("Tool") and v.Name == "Gold" then
v:Destroy()
end
end
end
end)
auto:NewButton("Auto Delete Metal", "Removes metal from inventory", function()
    while wait() do
for _, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v:IsA("Tool") and v.Name == "Metal" then
v:Destroy()
end
end
end
end)
auto:NewButton("Auto Delete Rope", "Removes rope from inventory", function()
    while wait() do
for _, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v:IsA("Tool") and v.Name == "Rope" then
v:Destroy()
end
end
end
end)
misc:NewButton("Anti-Afk", "Makes it so you don't get kicked", function()
    local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
end)
auto:NewButton("Auto Delete Stone", "Removes stone from inventory", function()
    while wait() do
for _, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v:IsA("Tool") and v.Name == "Stone" then
v:Destroy()
end
end
end
end)
misc:NewButton("No Chest Grab Wait", "Grab Chests Instantly", function()
   while wait() do
for i, v in pairs(workspace:GetDescendants()) do
if v.ClassName == "ProximityPrompt" then
v.HoldDuration = 0
end
end
end
end)
misc:NewButton("Infinite Yield", "Useful CMDs", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)