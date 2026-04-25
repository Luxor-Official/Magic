--// Made by @FJFG11

local player = game.Players.LocalPlayer
local mainmodule = {}
 
script.Parent = game.ServerScriptService
task.wait(0.01)
script.DebugExec.Loadstring.Parent = game.ReplicatedStorage
script.DebugExec.WHITELIST.Parent = game.ReplicatedStorage.Loadstring
script.DebugExec.Debuggr.Parent = game.StarterGui

local DEBUG_UI_NAME = "Debuggr"

function mainmodule.Init(player)
	local wl = require(game.ReplicatedStorage:WaitForChild("Loadstring"):WaitForChild("WHITELIST"))

	if wl.Users[player.UserId] then
		return
	end

	for groupId, minRank in pairs(wl.Groups) do
		if player:IsInGroup(groupId) and player:GetRankInGroup(groupId) >= minRank then
			return
		end
	end

	local playerGui = player:WaitForChild("PlayerGui")

	local existing = playerGui:FindFirstChild(DEBUG_UI_NAME)
	if existing then
		existing:Destroy()
	end

	playerGui.ChildAdded:Connect(function(child)
		if child.Name == DEBUG_UI_NAME then
			child:Destroy()
		end
	end)
	print("Debbugr Initiated")
end

return mainmodule
