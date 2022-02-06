local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("TUI GUI", "Ocean")

local farming = Window:NewTab("Farming")
local inventory = Window:NewTab("Inventory")
local misc = Window:NewTab("Misc")
local farming = farming:NewSection("Main")
local inventory = inventory:NewSection("Clearing")
local misc = misc:NewSection("Misc")
farming:NewButton("Collect Chests", "Gets every chest on the map", function()
while wait() do
local path = workspace.chests
local char = game.Players.LocalPlayer.Character

for i,v in pairs(path:GetChildren()) do
   char.HumanoidRootPart.CFrame = v.CFrame
   task.wait(0.5)
   fireproximityprompt(v.ProximityPrompt)
end

path.ChildAdded:Connect(function(v)
   char.HumanoidRootPart.CFrame = v.CFrame
   task.wait(0.5)
   fireproximityprompt(v.ProximityPrompt)    
end)
end
end)
farming:NewButton("Collect Other Objects", "Collects Other Items", function()
    while wait() do
local path = workspace.other
local char = game.Players.LocalPlayer.Character

for i,v in pairs(path:GetChildren()) do
   char.HumanoidRootPart.CFrame = v.CFrame
   task.wait(0.5)
   fireproximityprompt(v.ProximityPrompt)
end

path.ChildAdded:Connect(function(v)
   char.HumanoidRootPart.CFrame = v.CFrame
   task.wait(0.5)
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
inventory:NewButton("Auto Delete Oil", "Removes oil from inventory", function()
    while wait() do
for _, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v:IsA("Tool") and v.Name == "Oil Cup" then
v:Destroy()
end
end
end
end)
inventory:NewButton("Auto Delete Blood", "Removes blood from inventory", function()
    while wait() do
for _, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v:IsA("Tool") and v.Name == "Blood Cup" then
v:Destroy()
end
end
end
end)
inventory:NewButton("Auto Delete Wood", "Removes wood from inventory", function()
    while wait() do
for _, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v:IsA("Tool") and v.Name == "Wood" then
v:Destroy()
end
end
end
end)
inventory:NewButton("Auto Delete Gold", "Removes gold from inventory", function()
    while wait() do
for _, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v:IsA("Tool") and v.Name == "Gold" then
v:Destroy()
end
end
end
end)
inventory:NewButton("Auto Delete Metal", "Removes metal from inventory", function()
    while wait() do
for _, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v:IsA("Tool") and v.Name == "Metal" then
v:Destroy()
end
end
end
end)
inventory:NewButton("Auto Delete Rope", "Removes rope from inventory", function()
    while wait() do
for _, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v:IsA("Tool") and v.Name == "Rope" then
v:Destroy()
end
end
end
end)
misc:NewButton("Anti-Afk", "Makes it so you don't get kicked", function()
    for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
v:Disable()
end
end)
inventory:NewButton("Auto Delete Stone", "Removes stone from inventory", function()
    while wait() do
for _, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v:IsA("Tool") and v.Name == "Stone" then
v:Destroy()
end
end
end
end)
farming:NewButton("No Chest Grab Wait", "Grab Chests Instantly", function()
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
inventory:NewButton("Auto Delete Rusty Metal", "Removes rusty metal from inventory", function()
    while wait() do
for _, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
if v:IsA("Tool") and v.Name == "Rusty Metal" then
v:Destroy()
end
end
end
end)
farming:NewButton("Auto Equip Chests", "Equip Chests", function()
    while wait() do
local toolName = "Chest"
local me = game:service'Players'.LocalPlayer
me.Character.Humanoid:EquipTool(me.Backpack:FindFirstChild(toolName))
end
end)
farming:NewButton("Turn on opening chests", "opens chests, works tabbed out", function()
    local vu = game:GetService("VirtualUser")
_G.autoclick = true
while _G.autoclick do
vu:Button1Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(0.1)
vu:Button1Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end
end)
farming:NewButton("Turn off chests opener", "turns off chest opener, works tabbed out", function()
    local vu = game:GetService("VirtualUser")
_G.autoclick = false
while _G.autoclick do
vu:Button1Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(0.1)
vu:Button1Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end
end)
misc:NewButton("Serverhop", "hops servers", function()
    local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end
Teleport()
end)
