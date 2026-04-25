--// Made by @FJFG11
	
local DebugModule = require(script.Parent)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

Players.PlayerAdded:Connect(function(player)
	DebugModule.Init(player)
end)

local remote = ReplicatedStorage.Loadstring:WaitForChild("DebugExec")
local debugOutput = ReplicatedStorage.Loadstring:WaitForChild("DebugOutput")
local loadstring = require(ReplicatedStorage:WaitForChild("Loadstring"))

local function serializeValue(v, seen)
	seen = seen or {}
	local t = typeof(v)
	if t == "Instance" then
		return v:GetFullName()
	elseif t == "table" then
		if seen[v] then return "[Circular]" end
		seen[v] = true
		local out = {}
		for k,val in next,v do
			out[#out+1] = tostring(k).."="..serializeValue(val, seen)
		end
		return "{"..table.concat(out,", ").."}"
	end
	return tostring(v)
end

local requireModule = {}

	local function packSerialize(...)
		local a = table.pack(...)
		for i=1,a.n do
			a[i] = serializeValue(a[i])
		end
		return table.concat(a,"\t",1,a.n)
	end

	local sharedEnv = {
		table=table, 
		math=math, 
		string=string, 
		coroutine=coroutine,
		utf8=utf8, 
		bit32=bit32,
		Instance=Instance,
		Enum=Enum, 
		Vector3=Vector3, 
		Vector2=Vector2, 
		CFrame=CFrame,
		UDim=UDim, 
		UDim2=UDim2, 
		Color3=Color3, 
		Ray=Ray, 
		Rect=Rect,
		PathWaypoint=PathWaypoint, 
		RaycastParams=RaycastParams,
		NumberRange=NumberRange,
		NumberSequence=NumberSequence, 
		NumberSequenceKeypoint=NumberSequenceKeypoint,
		ColorSequence=ColorSequence, 
		ColorSequenceKeypoint=ColorSequenceKeypoint,
		TweenInfo=TweenInfo, 
		PhysicalProperties=PhysicalProperties,
		pairs=pairs, 
		ipairs=ipairs, 
		next=next,
		type=type, 
		typeof=typeof, 
		select=select,
		tonumber=tonumber, 
		tostring=tostring, 
		assert=assert, 
		error=error,
		pcall=pcall, 
		xpcall=xpcall,
		game=game, 
		workspace=game.Workspace, 
		Players=Players, 
		RunService=RunService,
		ReplicatedStorage=ReplicatedStorage,
		Lighting=game:GetService("Lighting"),
		StarterGui=game:GetService("StarterGui"),
		StarterPack=game:GetService("StarterPack"),
		Teams=game:GetService("Teams"),
		Debris=game:GetService("Debris"),
		UserInputService=game:GetService("UserInputService"),
		ContextActionService=game:GetService("ContextActionService"),
	}

	setmetatable(sharedEnv,{__index=_G})

	remote.OnServerEvent:Connect(function(player, source)
		if typeof(source)~="string" or #source==0 then
			debugOutput:FireClient(player,"[SERVER][ERROR] Invalid source")
			return
		end

	local env = setmetatable({
		print=function(...) debugOutput:FireClient(player,"[SERVER] "..packSerialize(...)) end,
		warn=function(...) debugOutput:FireClient(player,"[SERVER][WARN] "..packSerialize(...)) end,
		wait=function() debugOutput:FireClient(player,"[SERVER][WARNING] Avoid wait()") end,
		require=require,
		loadstring=loadstring,
	},{__index=sharedEnv})

	local fn,err = loadstring(source, env)
	if not fn then
		debugOutput:FireClient(player,"[SERVER][COMPILE] "..tostring(err))
		return
	end

	local ok,res = pcall(fn)
	if not ok then
		debugOutput:FireClient(player,"[SERVER][RUNTIME] "..tostring(res))
	end
end)
