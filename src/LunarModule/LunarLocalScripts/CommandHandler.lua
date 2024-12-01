local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local LunarModule = ReplicatedStorage:WaitForChild("LunarModule")
local Assets = LunarModule.Assets
local Events = LunarModule.Events
local Values = LunarModule.Values
local CommandEvents = Events.CommandEvents
local plr = game.Players.LocalPlayer
local CommandPrefix = Values.CommandPrefix
local ShowNotificationFrame = Events.ShowNotificationFrame
local PlaySoundBind = LunarModule.Events.PlaySoundBind
local CommandAmount = Values.CommandAmount
local RTSecondsLeft = Values.RTSecondsLeft
local ExceededMCpS = Values.ExceededMCpS

local function ChatScript(original_message)
	local message = string.lower(original_message)
	
	if string.sub(message, 1, 1) == CommandPrefix.Value then
		if ExceededMCpS.Value ~= true then
			if message == CommandPrefix.Value.."btools" or message == CommandPrefix.Value.."buildingtools" then
				CommandAmount.Value += 1
				local response = CommandEvents.BTools:InvokeServer("Building Tools")
				ShowNotificationFrame:Invoke(response)
			elseif message == CommandPrefix.Value.."sword" then
				CommandAmount.Value += 1
				local response = CommandEvents.Sword:InvokeServer("Sword")
				ShowNotificationFrame:Invoke(response)
			elseif message == CommandPrefix.Value.."invisible" or message == CommandPrefix.Value.."invis" then
				CommandAmount.Value += 1
				local response = CommandEvents.Invisible:InvokeServer("Invisible")
				ShowNotificationFrame:Invoke(response)
			elseif message == CommandPrefix.Value.."visible" or message == CommandPrefix.Value.."vis" then
				CommandAmount.Value += 1
				local response = CommandEvents.Visible:InvokeServer("Visible")
				ShowNotificationFrame:Invoke(response)
			elseif message:match(CommandPrefix.Value.."speed") or message:match(CommandPrefix.Value.."walkspeed") then
				if message:match(CommandPrefix.Value.."speed ") or message:match(CommandPrefix.Value.."walkspeed ") then
					CommandAmount.Value += 1
					local speedAmount = ""
					
					for i=1, #message do
						if tonumber(string.sub(message,i,i)) then
							speedAmount = speedAmount..string.sub(message,i,i)
						end
					end
					
					if speedAmount == "" or speedAmount == nil then
						PlaySoundBind:Fire("LunarError")
						ShowNotificationFrame:Invoke("You can only use numbers when setting your walkSpeed! Try using "..CommandPrefix.Value.."speed 64.")
					else
						local response = CommandEvents.Speed:InvokeServer("Speed", speedAmount)
						ShowNotificationFrame:Invoke(response)
					end
				else
					PlaySoundBind:Fire("LunarError")
					ShowNotificationFrame:Invoke("You haven't set a walkSpeed amount! Try using "..CommandPrefix.Value.."speed 64.")
				end
			else
				PlaySoundBind:Fire("LunarError")
				ShowNotificationFrame:Invoke("'"..original_message.."' is an invalid command! Try using "..CommandPrefix.Value.."commands.")
			end
		else
			PlaySoundBind:Fire("LunarError")
			if RTSecondsLeft.Value ~= 1 then
				ShowNotificationFrame:Invoke("You are being rate-limited! Please wait "..RTSecondsLeft.Value.." seconds before running another command!")
			else
				ShowNotificationFrame:Invoke("You are being rate-limited! Please wait "..RTSecondsLeft.Value.." second before running another command!")
			end
		end
	end
end

TextChatService.SendingMessage:Connect(function(message) ChatScript(message.Text) end)
plr.Chatted:Connect(ChatScript)