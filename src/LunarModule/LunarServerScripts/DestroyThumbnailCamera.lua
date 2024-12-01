local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LunarModule = ReplicatedStorage:WaitForChild("LunarModule")
local ThumbnailCamera = LunarModule:WaitForChild("ThumbnailCamera")

ThumbnailCamera.Part:Destroy()
ThumbnailCamera:Destroy()