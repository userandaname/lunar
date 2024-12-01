local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LunarModule = ReplicatedStorage:WaitForChild("LunarModule")
local PlaySoundRemote = LunarModule.Events.PlaySoundRemote
local PlaySoundBind = LunarModule.Events.PlaySoundBind
local Effects = LunarModule.Assets.Sounds.Effects
local Music = LunarModule.Assets.Sounds.Music

local function PlaySound(SoundToPlay)
	if SoundToPlay == "LunarStart" then
		local Sound = Effects.LunarStart:Clone()
		Sound.Parent = workspace
		Sound.Playing = true
		
		repeat wait() until Sound.TimePosition >= 0.001
		repeat wait() until Sound.TimePosition == 0
		Sound.Playing = false
		Sound:Destroy()
	elseif SoundToPlay == "LunarError" then
		local Sound = Effects.LunarError:Clone()
		Sound.Parent = workspace
		Sound.Playing = true

		repeat wait() until Sound.TimePosition >= 0.001
		repeat wait() until Sound.TimePosition == 0
		Sound.Playing = false
		Sound:Destroy()
	end
end

PlaySoundRemote.OnClientEvent:Connect(PlaySound)
PlaySoundBind.Event:Connect(PlaySound)