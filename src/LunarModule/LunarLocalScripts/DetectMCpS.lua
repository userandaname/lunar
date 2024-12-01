local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LunarModule = ReplicatedStorage:WaitForChild("LunarModule")
local Values = LunarModule.Values
local CommandAmount = Values:WaitForChild("CommandAmount")
local RTSecondsLeft = Values:WaitForChild("RTSecondsLeft")
local ExceededMCpS = Values:WaitForChild("ExceededMCpS")
local TSecondsLeft

CommandAmount.Changed:Connect(function()
	if CommandAmount.Value >= 7 then
		ExceededMCpS.Value = true
		RTSecondsLeft.Value = 10
		repeat wait(1) RTSecondsLeft.Value -= 1 until RTSecondsLeft.Value <= 0
		RTSecondsLeft.Value = 0
		CommandAmount.Value = 0
		ExceededMCpS.Value = false
	end
end)