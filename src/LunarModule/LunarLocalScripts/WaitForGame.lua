local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LunarModule = ReplicatedStorage:WaitForChild("LunarModule")
local WaitForGame = LunarModule.Events.WaitForGame

WaitForGame.OnClientInvoke = function()
	if not game:IsLoaded() then
		game.Loaded:Wait()
	end
end