local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LunarModule = ReplicatedStorage:WaitForChild("LunarModule")
local LunarModuleScripts = LunarModule.LunarModuleScripts
local Assets = LunarModule.Assets
local Events = LunarModule.Events
local Values = LunarModule.Values
local Icon = require(LunarModuleScripts.Icon)
local IconController = require(LunarModuleScripts.Icon.IconController)
local Themes = require(LunarModuleScripts.Icon.Themes)
local MainFrame = game.Players.LocalPlayer.PlayerGui:WaitForChild("LunarGUI").MainFrame
local plr = game.Players.LocalPlayer

Icon.new()
	:setImage(13512489450)
	:setLabel("Lunar")
	:setMid()
	:bindToggleItem(MainFrame)

IconController.setGameTheme(Themes["BlueGradient"])