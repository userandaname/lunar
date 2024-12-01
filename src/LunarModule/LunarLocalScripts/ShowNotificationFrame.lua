local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LunarModule = ReplicatedStorage:WaitForChild("LunarModule")
local Assets = LunarModule.Assets
local Events = LunarModule.Events
local Values = LunarModule.Values
local ShowNotificationFrameRemote = LunarModule.Events.ShowNotificationFrameRemote
local ShowNotificationFrame = Events.ShowNotificationFrame
local plr = game.Players.LocalPlayer

local function ShowNotificationFrameFunction(InfoTip)
	local NotificationFrameTemplate = plr.PlayerGui:WaitForChild("LunarGUI").NotificationFrameTemplate:Clone()
	local NotificationFrame = NotificationFrameTemplate.NotificationFrame
	NotificationFrameTemplate.Parent = plr.PlayerGui:WaitForChild("LunarGUI").NotificationContainer
	
	NotificationFrame.Close.Activated:Connect(function()
		NotificationFrame:TweenPosition(UDim2.new(1, 0, 1, -90), "InOut", "Quad", 1, false)
		wait(1)
		NotificationFrame.Visible = false
		NotificationFrameTemplate:Destroy()
	end)
	
	NotificationFrame.Info.Text = InfoTip
	NotificationFrame.Visible = true
	NotificationFrame:TweenPosition(UDim2.new(1, -250, 1, -90), "InOut", "Quad", 1, false)
	wait(1)
	wait(3)
	NotificationFrame:TweenPosition(UDim2.new(1, 0, 1, -90), "InOut", "Quad", 1, false)
	wait(1)
	NotificationFrame.Visible = false
	NotificationFrameTemplate:Destroy()
end

ShowNotificationFrameRemote.OnClientEvent:Connect(ShowNotificationFrameFunction)
ShowNotificationFrame.OnInvoke = ShowNotificationFrameFunction

--NotificationFrame.Close.Activated:Connect(function()
--	NotificationFrame:TweenPosition(UDim2.new(1, 0, 1, -90), "InOut", "Quad", 1, false)
--	wait(1)
--	NotificationFrame.Visible = false
--	NotificationFrame.Info.Text = ""
--end)

--local function ShowNotificationFrameFunction(InfoTip)
--	NotificationFrame.Info.Text = InfoTip
--	NotificationFrame.Visible = true
--	NotificationFrame:TweenPosition(UDim2.new(1, -250, 1, -90), "InOut", "Quad", 1, false)
--	wait(1)
--	wait(3)
--	NotificationFrame:TweenPosition(UDim2.new(1, 0, 1, -90), "InOut", "Quad", 1, false)
--	wait(1)
--	NotificationFrame.Visible = false
--	NotificationFrame.Info.Text = ""
--end