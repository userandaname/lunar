local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LunarModule = ReplicatedStorage:WaitForChild("LunarModule")
local Assets = LunarModule.Assets
local Events = LunarModule.Events
local CommandEvents = Events.CommandEvents
local Tools = Assets.Tools

local function CommandHandler(plr, Command, Argument1)
	if Command == "Building Tools" then
		local Item = Tools["Building Tools"]:Clone()
		Item.Parent = plr.Backpack
		
		return "Added 1 'Building Tools' to your backpack."
	elseif Command == "Sword" then
		local Item = Tools.Sword:Clone()
		Item.Parent = plr.Backpack
		
		return "Added 1 'Sword' to your backpack."
	elseif Command == "Invisible" then
		for i,v in pairs(plr.Character:GetDescendants()) do
			if v:IsA("BasePart") or v:IsA("Decal") then
				v.Transparency = 1
			end
		end
		
		return "Made your character invisible to other players."
	elseif Command == "Visible" then
		for i,v in pairs(plr.Character:GetDescendants()) do
			if v:IsA("BasePart") or v:IsA("Decal") then
				v.Transparency = 0
			end
		end
		
		if plr.Character:FindFirstChild("HumanoidRootPart") then plr.Character:WaitForChild("HumanoidRootPart").Transparency = 1 end
		return "Made your character visible to other players."
	elseif Command == "Speed" then
		plr.Character:WaitForChild("Humanoid").WalkSpeed = Argument1
		
		return "Changed walkSpeed to "..Argument1.."."
	end
end

CommandEvents.BTools.OnServerInvoke = CommandHandler
CommandEvents.Sword.OnServerInvoke = CommandHandler
CommandEvents.Invisible.OnServerInvoke = CommandHandler
CommandEvents.Visible.OnServerInvoke = CommandHandler
CommandEvents.Speed.OnServerInvoke = CommandHandler
--CommandEvents.BTools.OnServerInvoke = CommandHandler