local InitializeLunar = {}

function InitializeLunar.RunStable(TempModel, LunarFolder, DevStatus)
	print("Initializing Lunar Stable... - Lunar")
	
	local LunarTemp = Instance.new("Folder")
	LunarTemp.Name = "LunarTemp"
	LunarTemp.Parent = workspace
	
	script.Parent = LunarTemp
	TempModel:Destroy()
	
	local LunarModel = game:GetService("InsertService"):LoadAsset(13513447666)
	local LunarModule = LunarModel:WaitForChild("LunarModule")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local LunarServerScripts = LunarModule.LunarServerScripts
	local LunarModuleScripts = LunarModule.LunarModuleScripts
	
	LunarModuleScripts:WaitForChild("InitializeLunar"):Destroy()
	script.Parent = LunarModuleScripts
	LunarTemp:Destroy()

	LunarModule.Parent = ReplicatedStorage
	LunarModel:Destroy()
	LunarServerScripts.Parent = game.ServerScriptService

	for i,Script in pairs(LunarServerScripts:GetChildren()) do
		Script.Enabled = true
	end

	for i,plr in pairs(game.Players:GetChildren()) do
		if not plr:WaitForChild("PlayerGui"):FindFirstChild("LunarGUI") then
			local LunarModule = ReplicatedStorage:WaitForChild("LunarModule")
			local Events = LunarModule.Events
			local ShowNotificationFrameRemote = Events.ShowNotificationFrameRemote
			local FSLunarSettings = Events.FSLunarSettings
			local WaitForGame = Events.WaitForGame
			local LunarLocalScripts = LunarModule.LunarLocalScripts:Clone()
			local PlaySoundRemote = Events.PlaySoundRemote
			local LunarGUI = LunarModule.LunarGUI:Clone()
			LunarGUI.Parent = plr:WaitForChild("PlayerGui")
			LunarLocalScripts.Parent = LunarGUI
			
			for i,Script in pairs(LunarLocalScripts:GetChildren()) do
				Script.Enabled = true
			end
			
			WaitForGame:InvokeClient(plr)
			if DevStatus == nil or DevStatus == false then
				FSLunarSettings:Invoke(plr, "ServerStart")
			elseif DevStatus == true then
				FSLunarSettings:Invoke(plr, "DevModeFailed")
			end
			PlaySoundRemote:FireClient(plr, "LunarStart")
			ShowNotificationFrameRemote:FireClient(plr, "Welcome back, "..plr.DisplayName.."! Your rank is: "..plr:WaitForChild("LunarSettings").Values.PlayerRank.Value.."!")
			
			if DevStatus == nil or DevStatus == false then
				print("Deployed Lunar for '"..plr.Name.."'. [ServerStart] - Lunar")
			elseif DevStatus == true then
				print("Deployed Lunar for '"..plr.Name.."'. [DevModeFailed] - Lunar")
			end
		end
	end
	
	LunarFolder:Destroy()
	
	print("Initialized Lunar "..LunarModule.Values.VerNum.Value.." Stable. - Lunar")
end

function InitializeLunar.RunDev(LunarFolder)
	print("Initializing Lunar Dev... - Lunar")
	
	local LunarModule = workspace:WaitForChild("LunarModule")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Events = LunarModule.Events
	local ShowNotificationFrameRemote = Events.ShowNotificationFrameRemote
	local WaitForGame = Events.WaitForGame
	local FSLunarSettings = Events.FSLunarSettings
	local LunarServerScripts = LunarModule.LunarServerScripts

	LunarModule.Parent = ReplicatedStorage
	LunarServerScripts.Name = "LunarServerScripts"
	LunarServerScripts.Parent = game.ServerScriptService
	
	for i,Script in pairs(LunarServerScripts:GetChildren()) do
		Script.Enabled = true
	end

	for i,plr in pairs(game.Players:GetChildren()) do
		if not plr:WaitForChild("PlayerGui"):FindFirstChild("LunarGUI") then
			local LunarModule = ReplicatedStorage:WaitForChild("LunarModule")
			local LunarLocalScripts = LunarModule.LunarLocalScripts:Clone()
			local PlaySoundRemote = Events.PlaySoundRemote
			local LunarGUI = LunarModule.LunarGUI:Clone()
			LunarGUI.Parent = plr:WaitForChild("PlayerGui")
			LunarLocalScripts.Parent = LunarGUI

			for i,Script in pairs(LunarLocalScripts:GetChildren()) do
				Script.Enabled = true
			end
			
			WaitForGame:InvokeClient(plr)
			FSLunarSettings:Invoke(plr, "ServerStart")
			PlaySoundRemote:FireClient(plr, "LunarStart")
			ShowNotificationFrameRemote:FireClient(plr, "Welcome back, "..plr.DisplayName.."! Your rank is: "..plr:WaitForChild("LunarSettings").Values.PlayerRank.Value.."!")

			print("Deployed Lunar for '"..plr.Name.."'. [ServerStart] - Lunar")
		end
	end
	
	LunarFolder:Destroy()
	
	print("Initialized Lunar "..LunarModule.Values.VerNum.Value.." Dev. - Lunar")
end

function InitializeLunar.RunDeploy(plr)
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local LunarModule = ReplicatedStorage:WaitForChild("LunarModule")
	local Events = LunarModule.Events
	local ShowNotificationFrameRemote = Events.ShowNotificationFrameRemote
	local WaitForGame = Events.WaitForGame
	local LunarLocalScripts = LunarModule.LunarLocalScripts:Clone()
	local PlaySoundRemote = Events.PlaySoundRemote
	local LunarGUI = LunarModule.LunarGUI:Clone()
	LunarGUI.Parent = plr:WaitForChild("PlayerGui")
	LunarLocalScripts.Parent = LunarGUI

	for i,Script in pairs(LunarLocalScripts:GetChildren()) do
		Script.Enabled = true
	end
	
	WaitForGame:InvokeClient(plr)
	PlaySoundRemote:FireClient(plr, "LunarStart")
	ShowNotificationFrameRemote:FireClient(plr, "Welcome back, "..plr.DisplayName.."! Your rank is: "..plr:WaitForChild("LunarSettings").Values.PlayerRank.Value.."!")

	print("Deployed Lunar for '"..plr.Name.."'. - Lunar")
end

--local loaderFolder = script.Parent.Parent
--local mainModule = require(3239236979)
--mainModule:Initialize(loaderFolder)
--loaderFolder:Destroy()

return InitializeLunar
