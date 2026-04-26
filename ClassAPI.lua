--[[
 ______     __         ______     ______     ______     ______     ______   __    
/\  ___\   /\ \       /\  __ \   /\  ___\   /\  ___\   /\  __ \   /\  == \ /\ \   
\ \ \____  \ \ \____  \ \  __ \  \ \___  \  \ \___  \  \ \  __ \  \ \  _-/ \ \ \  
 \ \_____\  \ \_____\  \ \_\ \_\  \/\_____\  \/\_____\  \ \_\ \_\  \ \_\    \ \_\ 
  \/_____/   \/_____/   \/_/\/_/   \/_____/   \/_____/   \/_/\/_/   \/_/     \/_/ 
                                                                                  
 // made my FJFG11
 // classAPI just allows you to get code suggestions when typing in the CodeLine UI

--]]

local classAPI = {
	
	print("[ClassAPI] Loaded"),

	["Instance"] = {
		{Name="Destroy", Type="Method"},
		{Name="Clone", Type="Method"},
		{Name="FindFirstChild", Type="Method"}, 
		{Name="FindFirstChildWhichIsA", Type="Method"},
		{Name="FindFirstChildOfClass", Type="Method"},
		{Name="WaitForChild", Type="Method"},
		{Name="GetChildren", Type="Method"},
		{Name="GetDescendants", Type="Method"},
		{Name="IsA", Type="Method"},
		{Name="GetAttribute", Type="Method"},
		{Name="SetAttribute", Type="Method"},

		{Name="Name", Type="Property"},
		{Name="Parent", Type="Property"},
		{Name="ClassName", Type="Property"},
		{Name="Archivable", Type="Property"},
	},

	["BasePart"] = {
		{Name="Anchored", Type="Property"},
		{Name="CanCollide", Type="Property"},
		{Name="CanTouch", Type="Property"},
		{Name="CanQuery", Type="Property"},
		{Name="Position", Type="Property"},
		{Name="CFrame", Type="Property"},
		{Name="Size", Type="Property"},
		{Name="Velocity", Type="Property"},
		{Name="AssemblyLinearVelocity", Type="Property"},
		{Name="AssemblyAngularVelocity", Type="Property"},
		{Name="Material", Type="Property"},
		{Name="Transparency", Type="Property"},
		{Name="Color", Type="Property"},

		{Name="ApplyImpulse", Type="Method"},
		{Name="ApplyImpulseAtPosition", Type="Method"},
		{Name="BreakJoints", Type="Method"},
	},

	["Model"] = {
		{Name="PrimaryPart", Type="Property"},
		{Name="WorldPivot", Type="Property"},
		{Name="PivotTo", Type="Method"},
		{Name="GetChildren", Type="Method"},
		{Name="GetDescendants", Type="Method"},
		{Name="MoveTo", Type="Method"},
	},

	["Humanoid"] = {
		{Name="WalkSpeed", Type="Property"},
		{Name="JumpPower", Type="Property"},
		{Name="JumpHeight", Type="Property"},
		{Name="Health", Type="Property"},
		{Name="MaxHealth", Type="Property"},
		{Name="HipHeight", Type="Property"},
		{Name="AutoRotate", Type="Property"},
		{Name="PlatformStand", Type="Property"},
		{Name="Sit", Type="Property"},
		{Name="DisplayDistanceType", Type="Property"},

		{Name="Move", Type="Method"},
		{Name="MoveTo", Type="Method"},
		{Name="TakeDamage", Type="Method"},
		{Name="ChangeState", Type="Method"},
		{Name="LoadAnimation", Type="Method"},
	},

	["Player"] = {
		{Name="Name", Type="Property"},
		{Name="DisplayName", Type="Property"},
		{Name="UserId", Type="Property"},
		{Name="Team", Type="Property"},
		{Name="Character", Type="Property"},
		{Name="Backpack", Type="Property"},
		{Name="PlayerGui", Type="Property"},

		{Name="Kick", Type="Method"},
		{Name="LoadCharacter", Type="Method"},
		{Name="GetMouse", Type="Method"},
	},
	
	["Lighting"] = {
		{Name="Brightness", Type="Property"},
		{Name="ClockTime", Type="Property"},
		{Name="FogEnd", Type="Property"},
		{Name="FogStart", Type="Property"},
		{Name="Ambient", Type="Property"},
		{Name="OutdoorAmbient", Type="Property"},
	},

	["RemoteEvent"] = {
		{Name="FireServer", Type="Method"},
		{Name="FireAllClients", Type="Method"},
		{Name="OnClientEvent", Type="Property"},
	},

	["RemoteFunction"] = {
		{Name="InvokeServer", Type="Method"},
		{Name="OnClientInvoke", Type="Property"},
	},

	["Script"] = {
		{Name="Disabled", Type="Property"},
		{Name="Source", Type="Property"},
	},

	["LocalScript"] = {
		{Name="Disabled", Type="Property"},
		{Name="Source", Type="Property"},
	},


	["Tool"] = {
		{Name="Enabled", Type="Property"},
		{Name="RequiresHandle", Type="Property"},
		{Name="Grip", Type="Property"},
		{Name="Activate", Type="Method"},
	},


	["Vector3"] = {
		{Name="X", Type="Property"},
		{Name="Y", Type="Property"},
		{Name="Z", Type="Property"},
		{Name="Magnitude", Type="Property"},
		{Name="Unit", Type="Property"},
	},

	["CFrame"] = {
		{Name="Position", Type="Property"},
		{Name="LookVector", Type="Property"},
		{Name="RightVector", Type="Property"},
		{Name="UpVector", Type="Property"},
	},
}

return classAPI
