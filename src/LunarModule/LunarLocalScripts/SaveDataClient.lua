local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local data = plr:WaitForChild("LunarSettings")
local PlayerGui = plr:WaitForChild("PlayerGui")
local LunarGUI = PlayerGui:WaitForChild("LunarGUI")
local LunarModule = ReplicatedStorage:WaitForChild("LunarModule")
--local AutosaveFrame = PlayerGui:WaitForChild("GUI"):WaitForChild("AutosaveFrame")
--local CashEarnedFrame = PlayerGui:WaitForChild("GUI"):WaitForChild("CashEarnedFrame")
--local SaveDataStatus = ReplicatedStorage.Events.SaveDataStatus
local Values = LunarModule.Values
local Events = LunarModule.Events
local RestoreSaveData = Events.RestoreSaveData
local PublishSaveData = Events.PublishSaveData
local ToggleAutosaves = Values.ToggleAutosaves
local ToggleAutosavesInternal = Values.ToggleAutosavesInternal
local SaveCompleted = Values.SaveCompleted
local SaveCompletedInternal = Values.SaveCompletedInternal

local function RestoreSaveDataFunction()
	if not game:IsLoaded() then
		game.Loaded:Wait()
	end
	
	Values.CommandPrefix.Value = data.Values.CommandPrefix.Value
	Values.PlayerRank.Value = data.Values.PlayerRank.Value
	
	LunarGUI.MainFrame.SettingsFrame.OptionsArea.CommandPrefix.TextBox.Text = Values.CommandPrefix.Value
	
	for i,Command in pairs(LunarGUI.MainFrame.CommandsFrame.CommandArea:GetChildren()) do
		if Command.ClassName == "ImageLabel" then
			Command.CommandName.Text = LunarGUI.MainFrame.SettingsFrame.OptionsArea.CommandPrefix.TextBox.Text..Command.CommandName.Text:sub(2)
		end
	end
	
	print("Data restored! - Lunar")
end

RestoreSaveData.OnClientEvent:Connect(RestoreSaveDataFunction)

--SaveDataStatus.OnClientEvent:Connect(function(SuccStatus, IsAddCash)
--	if SuccStatus then
--		AutosaveFrame.AutosaveSucc.Image = "rbxassetid://12376002465"
--	else
--		AutosaveFrame.AutosaveSucc.Image = "rbxassetid://12376002832"
--	end
--	AutosaveFrame.AutosaveSucc.Visible = true
--	wait(3)
--	if IsAddCash then
--		AutosaveFrame:TweenPosition(UDim2.new(0, -82, 0, 40), "InOut", "Quad", 1, false)
--		CashEarnedFrame:TweenPosition(UDim2.new(0, -82, 0, 78), "InOut", "Quad", 1, false)
--	else
--		AutosaveFrame:TweenPosition(UDim2.new(0, -82, 0, 40), "InOut", "Quad", 1, false)
--	end
--	wait(1)
--	AutosaveFrame.AutosaveSucc.Image = ""
--	AutosaveFrame.AutosaveSucc.Visible = false
--	AutosaveFrame.Visible = false
--	if IsAddCash then
--		CashEarnedFrame.CashEarned.Text = ""
--		CashEarnedFrame.Visible = false
--	end
--	ReplicatedStorage.Values.SaveCompletedInternal.Value = true
--	repeat wait() until ReplicatedStorage.Values.SaveCompletedInternal.Value == false
--end)

Events.TriggerBackup.OnInvoke = function()
	if SaveCompleted.Value == true then
		repeat wait() until SaveCompleted.Value == false
	end
	--PlayerGui.GUI.AutosaveFrame.Visible = true
	--PlayerGui.GUI.AutosaveFrame:TweenPosition(UDim2.new(0, 0, 0, 40), "InOut", "Quad", 1, false)
	wait(1)
	print("Sent a request to the server to backup data. - Lunar")
	PublishSaveData:FireServer(Values.CommandPrefix.Value, Values.PlayerRank.Value)
	repeat wait() until SaveCompletedInternal.Value == true
	SaveCompletedInternal.Value = false
	SaveCompleted.Value = true
	wait(1)
	SaveCompleted.Value = false
end

coroutine.resume(coroutine.create(function()
	local function AutoSave()
		if ToggleAutosavesInternal.Value == true and ToggleAutosaves.Value == true then
			if SaveCompleted.Value == true then
				repeat wait() until SaveCompleted.Value == false
			end
			repeat wait() until SaveCompleted.Value == false
			--PlayerGui.GUI.AutosaveFrame.Visible = true
			--PlayerGui.GUI.AutosaveFrame:TweenPosition(UDim2.new(0, 0, 0, 40), "InOut", "Quad", 1, false)
			wait(1)
			print("Sent a request to the server to auto-save data. - Lunar")
			PublishSaveData:FireServer(Values.CommandPrefix.Value, Values.PlayerRank.Value)
			repeat wait() until SaveCompletedInternal.Value == true
			SaveCompletedInternal.Value = false
			SaveCompleted.Value = true
			wait(1)
			SaveCompleted.Value = false
		end
	end

	while true do
		wait(60)
		AutoSave()
	end
end))