--[[
	This loads Lunar into your game and allows for automatic updates.
	
	YOU DO NOT NEED TO MODIFY THIS SCRIPT. MODIFYING THIS MAY CAUSE LUNAR TO BREAK!
	
	WITH GREAT POWER COMES GREAT RESPONSIBILITY.
--]]

if script.Parent.ShouldRunDev.Value == false then local LunarTemp = game:GetService("InsertService"):LoadAsset(13513447666) require(LunarTemp:WaitForChild("LunarModule"):WaitForChild("LunarModuleScripts").InitializeLunar).RunStable(LunarTemp, script.Parent, false) else if not workspace:FindFirstChild("LunarModule") then warn("Unable to locate a copy of Lunar Dev. Initializing Lunar Stable in 10 seconds... - Lunar") wait(10) local LunarTemp = game:GetService("InsertService"):LoadAsset(13513447666) require(LunarTemp:WaitForChild("LunarModule"):WaitForChild("LunarModuleScripts").InitializeLunar).RunStable(LunarTemp, script.Parent, true) else require(workspace:WaitForChild("LunarModule"):WaitForChild("LunarModuleScripts").InitializeLunar).RunDev(script.Parent) end end