local DataStoreService = game:GetService("DataStoreService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataStore = DataStoreService:GetDataStore("LunarDataStore")
local LunarModule = ReplicatedStorage:WaitForChild("LunarModule")
local Players = game:GetService("Players")
local RestoreSaveData = LunarModule.Events.RestoreSaveData
local SaveDataStatus = LunarModule.Events.SaveDataStatus
local FSLunarSettings = LunarModule.Events.FSLunarSettings

local function StartLunarSettings(player, InfoCode)
	--Folders
	
	local dataFolder = Instance.new("Folder")
	dataFolder.Name = "LunarSettings"
	dataFolder.Parent = player
	
	local Values = Instance.new("Folder")
	Values.Name = "Values"
	Values.Parent = dataFolder
	
	--Values
	
	local CommandPrefix = Instance.new("StringValue")
	CommandPrefix.Name = "CommandPrefix"
	CommandPrefix.Parent = Values
	CommandPrefix.Value = ";"
	
	local PlayerRank = Instance.new("StringValue")
	PlayerRank.Name = "PlayerRank"
	PlayerRank.Parent = Values
	PlayerRank.Value = "Unranked"
	
	local ToggleAutosaves = Instance.new("BoolValue")
	ToggleAutosaves.Name = "ToggleAutosaves"
	ToggleAutosaves.Parent = Values
	ToggleAutosaves.Value = true

	local playerUserId = "Player_"..player.UserId

	--Load data

	local data
	local success, errormessage = pcall(function()
		data = DataStore:GetAsync(playerUserId)
	end)

	if success then
		CommandPrefix.Value = data.CommandPrefix
		PlayerRank.Value = data.PlayerRank
		ToggleAutosaves.Value = data.ToggleAutosaves
		
		RestoreSaveData:FireClient(player)
		
		if InfoCode == "ServerStart" then
			print("Sent request to '"..player.Name.."' to restore data. [ServerStart] - Lunar")
		elseif InfoCode == "DevModeFailed" then
			print("Sent request to '"..player.Name.."' to restore data. [DevModeFailed] - Lunar")
		else
			print("Sent request to '"..player.Name.."' to restore data. - Lunar")
		end
	end
end

FSLunarSettings.OnInvoke = StartLunarSettings
game.Players.PlayerAdded:Connect(StartLunarSettings)

game.Players.PlayerRemoving:Connect(function(player)
	local playerUserId = "Player_"..player.UserId

	local data = {
		CommandPrefix = player.LunarSettings.Values.CommandPrefix.Value;
		PlayerRank = player.LunarSettings.Values.PlayerRank.Value;
	}

	local success, errormessage = pcall(function()
		DataStore:SetAsync(playerUserId, data)
	end)

	if success then
		print("Data successfully saved! - Lunar")
	else
		warn("Data failed to save. Error: "..errormessage.." - Lunar")
	end
end)

LunarModule.Events:WaitForChild("PublishSaveData").OnServerEvent:Connect(function(player, CommandPrefixValue, PlayerRankValue)
	local playerUserId = "Player_"..player.UserId

	Players[""..player.Name..""].LunarSettings.Values.CommandPrefix.Value = CommandPrefixValue
	Players[""..player.Name..""].LunarSettings.Values.PlayerRank.Value = PlayerRankValue

	local data = {
		CommandPrefix = player.LunarSettings.Values.CommandPrefix.Value;
		PlayerRank = player.LunarSettings.Values.PlayerRank.Value;
	}

	local success, errormessage = pcall(function()
		DataStore:SetAsync(playerUserId, data)
	end)

	if success then
		print("Data successfully saved! - Lunar")
		--SaveDataStatus:FireClient(player, true, IsAddCash)
	else
		warn("Data failed to save. Error: "..errormessage.." - Lunar")
		--SaveDataStatus:FireClient(player, false, IsAddCash)
	end
end)