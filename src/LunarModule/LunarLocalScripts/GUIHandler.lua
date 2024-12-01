local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")
local UserInputService = game:GetService("UserInputService")
local LunarModule = ReplicatedStorage:WaitForChild("LunarModule")
local LunarGUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("LunarGUI")
local LunarModuleScripts = LunarModule.LunarModuleScripts
local CommandsFrame = LunarGUI.MainFrame.CommandsFrame
local SettingsFrame = LunarGUI.MainFrame.SettingsFrame
local HomeFrame = LunarGUI.MainFrame.HomeFrame
local InfoFrame = LunarGUI.MainFrame.InfoFrame
local MainFrame = LunarGUI.MainFrame
local Assets = LunarModule.Assets
local Events = LunarModule.Events
local Values = LunarModule.Values
local TriggerBackup = Events.TriggerBackup
local DraggableObject	= require(LunarModuleScripts.DraggableObject)
local InfoFrameDrag = DraggableObject.new(game.Players.LocalPlayer.PlayerGui:WaitForChild("LunarGUI").MainFrame.InfoFrame)
local plr = game.Players.LocalPlayer
local content, isReady = game:GetService("Players"):GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size60x60)
InfoFrameDrag:Enable()

HomeFrame.WelcomePlayer.PlayerIcon.ImageLabel.Image = content
HomeFrame.WelcomePlayer.PlayerInfo.Text = plr.DisplayName.."\n\nRank: "..Values.PlayerRank.Value

MainFrame.PageSelectorFrame.AHomeButton.Activated:Connect(function()
	for i,Button in pairs(MainFrame.PageSelectorFrame:GetChildren()) do
		if Button.ClassName == "TextButton" and Button.Name ~= "AHomeButton" then
			Button.SelectedIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
		end
	end
	
	MainFrame.PageSelectorFrame.AHomeButton.SelectedIcon.TextColor3 = Color3.fromRGB(0, 164, 255)

	for i,Frame in pairs(MainFrame:GetChildren()) do
		if Frame.ClassName == "Frame" or Frame.ClassName == "ScrollingFrame" and Frame.Name ~= "HomeFrame" and Frame.Name ~= "TitleDivider" then
			Frame.Visible = false
		end
	end

	MainFrame.TitleDivider.Visible = true
	HomeFrame.Visible = true
end)

MainFrame.PageSelectorFrame.BCommandsButton.Activated:Connect(function()
	for i,Button in pairs(MainFrame.PageSelectorFrame:GetChildren()) do
		if Button.ClassName == "TextButton" and Button.Name ~= "BCommandsButton" then
			Button.SelectedIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
		end
	end

	MainFrame.PageSelectorFrame.BCommandsButton.SelectedIcon.TextColor3 = Color3.fromRGB(0, 164, 255)

	for i,Frame in pairs(MainFrame:GetChildren()) do
		if Frame.ClassName == "Frame" or Frame.ClassName == "ScrollingFrame" and Frame.Name ~= "CommandsFrame" and Frame.Name ~= "TitleDivider" then
			Frame.Visible = false
		end
	end

	MainFrame.TitleDivider.Visible = true
	CommandsFrame.Visible = true
end)

MainFrame.PageSelectorFrame.CSettingsButton.Activated:Connect(function()
	for i,Button in pairs(MainFrame.PageSelectorFrame:GetChildren()) do
		if Button.ClassName == "TextButton" and Button.Name ~= "CSettingsButton" then
			Button.SelectedIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
		end
	end

	MainFrame.PageSelectorFrame.CSettingsButton.SelectedIcon.TextColor3 = Color3.fromRGB(0, 164, 255)

	for i,Frame in pairs(MainFrame:GetChildren()) do
		if Frame.ClassName == "Frame" or Frame.ClassName == "ScrollingFrame" and Frame.Name ~= "SettingsFrame" and Frame.Name ~= "TitleDivider" then
			Frame.Visible = false
		end
	end
	
	MainFrame.TitleDivider.Visible = true
	SettingsFrame.Visible = true
end)

MainFrame.PageSelectorFrame.DInfoButton.Activated:Connect(function()
	for i,Button in pairs(MainFrame.PageSelectorFrame:GetChildren()) do
		if Button.ClassName == "TextButton" and Button.Name ~= "DInfoButton" then
			Button.SelectedIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
		end
	end

	MainFrame.PageSelectorFrame.DInfoButton.SelectedIcon.TextColor3 = Color3.fromRGB(0, 164, 255)
	
	for i,Frame in pairs(MainFrame:GetChildren()) do
		if Frame.ClassName == "Frame" or Frame.ClassName == "ScrollingFrame" and Frame.Name ~= "InfoFrame" and Frame.Name ~= "TitleDivider" then
			Frame.Visible = false
		end
	end

	MainFrame.TitleDivider.Visible = true
	InfoFrame.Visible = true
end)

UserInputService.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.Return then 
		EnterPressed = true 
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.Return then 
		EnterPressed = false 
	end
end)

SettingsFrame.OptionsArea.CommandPrefix.TextBox.FocusLost:Connect(function()
	task.wait()
	
	if EnterPressed then 
		for i,Command in pairs(LunarGUI.MainFrame.CommandsFrame.CommandArea:GetChildren()) do
			if Command.ClassName == "ImageLabel" then
				Command.CommandName.Text = SettingsFrame.OptionsArea.CommandPrefix.TextBox.Text..Command.CommandName.Text:sub(2)
			end
		end
		
		Values.CommandPrefix.Value = SettingsFrame.OptionsArea.CommandPrefix.TextBox.Text
		TriggerBackup:Invoke()
	end 
end)

SettingsFrame.OptionsArea.UIExclusions.EraseData.Activated:Connect(function()
	SettingsFrame.PageTitle.Visible = false
	SettingsFrame.OptionsArea.Visible = false
	SettingsFrame.EraseDataFrame.Visible = true
end)

SettingsFrame.EraseDataFrame.Cancel.Activated:Connect(function()
	SettingsFrame.EraseDataFrame.Visible = false
	SettingsFrame.OptionsArea.Visible = true
	SettingsFrame.PageTitle.Visible = true
end)

SettingsFrame.EraseDataFrame.Erase.Activated:Connect(function()
	
end)

InfoFrame.ObtainLunar.Activated:Connect(function()
	MarketplaceService:PromptPurchase(plr, 13513215671)
end)