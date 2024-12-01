local ReplicatedStorage = game:GetService("ReplicatedStorage")

game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Wait()
	require(game:GetService("ReplicatedStorage"):WaitForChild("LunarModule"):WaitForChild("LunarModuleScripts").InitializeLunar).RunDeploy(plr)
end)