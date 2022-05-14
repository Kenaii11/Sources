repeat
	wait()
until game:IsLoaded()

local Venyx = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local Library = Venyx.new("Krypt")
Library:setTheme("Glow", Color3.fromRGB(255, 0, 0))
Library:setTheme("TextColor", Color3.fromRGB(255, 0, 0))

local Skid = ""

local PlayerTab = Library:addPage("Player")
local Player = PlayerTab:addSection("Player Tab")
local CombatTab = Library:addPage("Combat")
local Combat = CombatTab:addSection("Combat Tab")
local TeleportsTab = Library:addPage("Teleports")
local Teleports = TeleportsTab:addSection("Teleports Tab")
local AutobuyTab = Library:addPage("Autobuy")
local Autobuy = AutobuyTab:addSection("AutoBuys")
local AutofarmTab = Library:addPage("Autofarm")
local Autofarm = AutofarmTab:addSection("Autofarm Tab")
local CashTab = Library:addPage("Cash")
local FastDrop = CashTab:addSection("Fast Drop")
local TrollCash = CashTab:addSection("Troll Cash")
local CashMods = CashTab:addSection("Cash Mods")
local FeaturedTab = Library:addPage("Featured")
local Featured = FeaturedTab:addSection("Featured")
local AnimationsTab = Library:addPage("Animations")
local Animator = AnimationsTab:addSection("Animator")
local ExtrasTab = Library:addPage("Extras")
local Extra = ExtrasTab:addSection("Extra")
local TargetTab = Library:addPage("Target")
local Target = TargetTab:addSection("Target Tab")

Player:addButton("Fly (X)", function()
	local plr = game.Players.LocalPlayer
	local mouse = plr:GetMouse()

	localplayer = plr

	if workspace:FindFirstChild("Core") then
		workspace.Core:Destroy()
	end

	local Core = Instance.new("Part")
	Core.Name = "Core"
	Core.Size = Vector3.new(0.05, 0.05, 0.05)

	spawn(function()
		Core.Parent = workspace
		local Weld = Instance.new("Weld", Core)
		Weld.Part0 = Core
		Weld.Part1 = localplayer.Character.LowerTorso
		Weld.C0 = CFrame.new(0, 0, 0)
	end)

	workspace:WaitForChild("Core")

	local torso = workspace.Core
	flying = true
	local speed=10
	local keys={a=false,d=false,w=false,s=false} 
	local e1
	local e2
	local function start()
		local pos = Instance.new("BodyPosition",torso)
		local gyro = Instance.new("BodyGyro",torso)
		pos.Name="EPIXPOS"
		pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
		pos.position = torso.Position
		gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
		gyro.cframe = torso.CFrame
		repeat
			wait()
			localplayer.Character.Humanoid.PlatformStand=true
			local new=gyro.cframe - gyro.cframe.p + pos.position
			if not keys.w and not keys.s and not keys.a and not keys.d then
				speed=5
			end
			if keys.w then 
				new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
				speed=speed+0
			end
			if keys.s then 
				new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
				speed=speed+0
			end
			if keys.d then 
				new = new * CFrame.new(speed,0,0)
				speed=speed+0
			end
			if keys.a then 
				new = new * CFrame.new(-speed,0,0)
				speed=speed+0
			end
			if speed>10 then
				speed=5
			end
			pos.position=new.p
			if keys.w then
				gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*0),0,0)
			elseif keys.s then
				gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*0),0,0)
			else
				gyro.cframe = workspace.CurrentCamera.CoordinateFrame
			end
		until flying == false
		if gyro then gyro:Destroy() end
		if pos then pos:Destroy() end
		flying=false
		localplayer.Character.Humanoid.PlatformStand=false
		speed=10
	end
	e1=mouse.KeyDown:connect(function(key)
		if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end
		if key=="w" then
			keys.w=true
		elseif key=="s" then
			keys.s=true
		elseif key=="a" then
			keys.a=true
		elseif key=="d" then
			keys.d=true
		elseif key=="x" then
			if flying==true then
				flying=false
			else
				flying=true
				start()
			end
		end
	end)
	e2=mouse.KeyUp:connect(function(key)
		if key=="w" then
			keys.w=false
		elseif key=="s" then
			keys.s=false
		elseif key=="a" then
			keys.a=false
		elseif key=="d" then
			keys.d=false
		end
	end)
	start()
end)
Player:addButton("Walkspeed (Z)", function()
	superhuman = false
	plr = game.Players.LocalPlayer
	mouse = plr:GetMouse()
	mouse.KeyDown:connect(function(key)
		if key == "z" and superhuman == false then
			superhuman = true
			game.Players.LocalPlayer.Character.Humanoid.Name = "Humz"
			game.Players.LocalPlayer.Character.Humz.WalkSpeed = 100
			game.Players.LocalPlayer.Character.Humz.JumpPower = 200
		elseif key == "z" and superhuman == true then
			superhuman = false
			game.Players.LocalPlayer.Character.Humz.WalkSpeed = 16
			game.Players.LocalPlayer.Character.Humz.JumpPower = 50
			game.Players.LocalPlayer.Character.Humz.Name = "Humanoid"
		end
	end)
end)
Player:addButton("Noclip (K)", function()
	noclip = false
	game:GetService("RunService").Stepped:connect(function()
		if noclip then
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)
	plr = game.Players.LocalPlayer
	mouse = plr:GetMouse()
	mouse.KeyDown:connect(function(key)
		if key == "k" then
			noclip = not noclip
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)
end)
Player:addButton("Naked", function()
	local function inTable(What, Table)
		for Index, Value in pairs(Table) do
			if What == Value then
				return true
			end
		end
		return false
	end

	local removingClasses = {
		"Accessory",
		"Pants",
		"Shirt",
	}

	for _, Instance in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if inTable(Instance.ClassName, removingClasses) or Instance.Name == "face" then
			Instance:Destroy()
		end
	end
end)
Player:addButton("Auto Stomp (C)", function()
	autostomp = false
	game:GetService("RunService").Stepped:connect(function()
		if autostomp then
			game.ReplicatedStorage.MainEvent:FireServer("Stomp")
		end
	end)
	plr = game.Players.LocalPlayer
	mouse = plr:GetMouse()
	mouse.KeyDown:connect(function(key)
		if key == "c" then
			autostomp = not autostomp
			game.ReplicatedStorage.MainEvent:FireServer("Stomp")
		end
	end)
end)
Player:addButton("Auto Block", function()
	while wait() do
		game.ReplicatedStorage.MainEvent:FireServer("Block", true)
	end
end)
Player:addButton("Rejoin", function()
	if (#game:GetService("Players"):GetPlayers() <= 1) then
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	else
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
	end
end)
Player:addButton("Anti Bag", function()
	while wait() do
		pcall(function()
			game:GetService("Players").LocalPlayer.Character:FindFirstChild("Christmas_Sock"):Destroy()
		end)
	end
end)
Player:addButton("Anonymous", function()
	pcall(function()
		game.Players.LocalPlayer.Character.Shirt:Destroy()
		game.Players.LocalPlayer.Character.RightUpperLeg:Destroy()
		game.Players.LocalPlayer.Character.Humanoid.HealthDisplayDistance = math.huge
		game.Players.LocalPlayer.Character.Humanoid.NameDisplayDistance = math.huge
		game.Players.LocalPlayer.Character.RightUpperLeg.Size = Vector3.new(0,0,0)
		game.Players.LocalPlayer.Character.RightUpperLeg.Massless = true
		game.Players.LocalPlayer.Character.RightUpperLeg.CanCollide = false

		heazd = true

		while heazd == true do 
			pcall(function()  
				game.Players.LocalPlayer.Character.RightUpperLeg.RightHipRigAttachment.CFrame =  CFrame.new(0, 100000.4736328125, 0)
				game.Players.LocalPlayer.Character.RightUpperLeg.CFrame = CFrame.new(0, 100000.4736328125, 0)
			end)
			wait()
		end
	end)
	wait(0.10)
	pcall(function()
		game.Players.LocalPlayer.Character.LeftUpperLeg:Destroy()
		game.Players.LocalPlayer.Character.Pants:Destroy()
		game.Players.LocalPlayer.Character.Humanoid.HealthDisplayDistance = math.huge
		game.Players.LocalPlayer.Character.Humanoid.NameDisplayDistance = math.huge
		game.Players.LocalPlayer.Character.LeftUpperLeg.Size = Vector3.new(0,0,0)
		game.Players.LocalPlayer.Character.LeftUpperLeg.Massless = true
		game.Players.LocalPlayer.Character.LeftUpperLeg.CanCollide = false

		heazd = true

		while heazd == true do 
			pcall(function()  
				game.Players.LocalPlayer.Character.LeftUpperLeg.LeftHipRigAttachment.CFrame =  CFrame.new(0, 100000.4736328125, 0)
				game.Players.LocalPlayer.Character.LeftUpperLeg.CFrame = CFrame.new(0, 100000.4736328125, 0)
			end)
			wait()
		end
	end)
	wait(0.10)
	pcall(function()
		game.Players.LocalPlayer.Character.Head.Neck:Destroy()
		game.Players.LocalPlayer.Character.UpperTorso.NeckAttachment:Destroy()
		game.Players.LocalPlayer.Character.Humanoid.HealthDisplayDistance = math.huge
		game.Players.LocalPlayer.Character.Humanoid.NameDisplayDistance = math.huge
		game.Players.LocalPlayer.Character.Head.Size = Vector3.new(0,0,0)
		game.Players.LocalPlayer.Character.Head.Massless = true
		game.Players.LocalPlayer.Character.Head.CanCollide = false

		heazd = true

		while heazd == true do 
			pcall(function()  
				game.Players.LocalPlayer.Character.Head.NeckRigAttachment.CFrame =  CFrame.new(0, 100000.4736328125, 0)
				game.Players.LocalPlayer.Character.UpperTorso.NeckRigAttachment.CFrame =  CFrame.new(0, 100000.4736328125, 0)
				game.Players.LocalPlayer.Character.Head.CFrame = CFrame.new(0, 100000.4736328125, 0)
			end)
			wait()
		end
	end)
end)
Player:addButton("Anti Grab", function()
	while wait() do
		pcall(function()
			local LocalPlayer = game:GetService("Players").LocalPlayer
			local char = LocalPlayer.Character
			if game.Players.LocalPlayer.Character["GRABBING_CONSTRAINT"] then
				game.Players.LocalPlayer.Character["GRABBING_CONSTRAINT"]:Destroy()
			end
		end)
	end
end)
Player:addButton("Bike Fly", function()
	local speed = 20
	local old
	local Plr = game.Players.LocalPlayer
	local wheels = {}
	local control = {q=false,e=false,w=false,a=false,s=false,d=false}
	local Mouse = Plr:GetMouse()

	Mouse.KeyDown:connect(function(KEY)
		local key = KEY:lower()
		if control[key] ~= nil then
			control[key]=true
		end
	end)

	Mouse.KeyUp:connect(function(KEY)
		local key = KEY:lower()
		if control[key] ~= nil then
			control[key]=false
		end
	end)

	while game.RunService.Stepped:wait() do
		local seat = (Plr.Character or Plr.CharacterAdded:wait()):WaitForChild("Humanoid").SeatPart
		if Plr.PlayerGui:FindFirstChild("MainScreenGui") and Plr.PlayerGui.MainScreenGui:FindFirstChild("Bar") and Plr.PlayerGui.MainScreenGui.Bar:FindFirstChild("Speed") then
			Plr.PlayerGui.MainScreenGui.Bar.Speed.bar.Size = UDim2.new(speed / 100 * 0.95, 0, 0.83, 0)
		else
			local c = Plr.PlayerGui.MainScreenGui.Bar.HP
			local g = c:Clone()
			g.Name = "Speed"
			g.Position = UDim2.new(0.5, 0, 1, -120)
			g.bar.BackgroundColor3 = Color3.fromRGB(255, 155, 0)
			g.Picture.Image.Image = "rbxassetid://181035717"
			g.TextLabel.Text = "Speed"
			g.Parent = c.Parent
		end
		if seat ~= nil and seat:IsDescendantOf(game.Workspace.Vehicles) then
			if seat ~= old then
				if old then
					old.Vel:Destroy()
					old.Gyro:Destroy()
				end
				old = seat
				for i = 1, 2 do
					if wheels[i] then
						wheels[i][2].Parent = wheels[i][1]
					end
					local wheel = seat.Parent.Wheel
					wheels[i] = {seat.Parent, wheel}
					wheel:remove()
				end
				local gyro = Instance.new("BodyGyro", seat)
				gyro.Name = "Gyro"
				local pos = Instance.new("BodyVelocity", seat)
				pos.Name = "Vel"
				gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
				pos.MaxForce = Vector3.new(9e9, 9e9, 9e9)
			else 
				seat.Gyro.cframe = workspace.CurrentCamera.CoordinateFrame
				local vel = CFrame.new(0, 0, 0)
				if control.w then
					vel = vel * CFrame.new(0, 0, -speed)
				end
				if control.s then
					vel = vel * CFrame.new(0, 0, speed)
				end
				if control.a then
					vel = vel * CFrame.new(-speed, 0, 0)
				end
				if control.d then
					vel = vel * CFrame.new(speed, 0, 0)
				end
				seat.Vel.Velocity = (seat.CFrame*vel).p - seat.CFrame.p
			end
		end
		if control.e and speed<100 then
			speed = speed + 1
		end
		if control.q and speed > 0 then
			speed = speed - 1
		end
	end
end)
Player:addButton("Headless", function()
	pcall(function()
		game.Players.LocalPlayer.Character.Head.Neck:Destroy()
		game.Players.LocalPlayer.Character.UpperTorso.NeckAttachment:Destroy()
		game.Players.LocalPlayer.Character.Humanoid.HealthDisplayDistance = math.huge
		game.Players.LocalPlayer.Character.Humanoid.NameDisplayDistance = math.huge
		game.Players.LocalPlayer.Character.Head.Size = Vector3.new(0, 0, 0)
		game.Players.LocalPlayer.Character.Head.Massless = true
		game.Players.LocalPlayer.Character.Head.CanCollide = false

		heazd = true

		while heazd == true do 
			pcall(function()  
				game.Players.LocalPlayer.Character.Head.NeckRigAttachment.CFrame = CFrame.new(0, 100000.4736328125, 0)
				game.Players.LocalPlayer.Character.UpperTorso.NeckRigAttachment.CFrame = CFrame.new(0, 100000.4736328125, 0)
				game.Players.LocalPlayer.Character.Head.CFrame = CFrame.new(0, 100000.4736328125, 0)
			end)
			wait()
		end
	end)
end)
Player:addButton("Fog", function()
	game:GetService("Lighting").FogEnd = math.huge
end)
Player:addButton("Anti Flashbang", function()
	while wait() do
		pcall(function()
			game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MainScreenGui"):FindFirstChild("whiteScreen"):Destroy()
		end)
	end
end)
Player:addButton("Free Animation Gamepass", function()
	-- // Delete Clones
	for _, v in next, game:GetService("CoreGui"):GetChildren() do
		if (v.Name:match("FreeAnimationPack")) then
			v:Destroy()
		end
	end

	-- // Instances
	local FreeAnimationPack = Instance.new("ScreenGui")
	local AnimationPack = Instance.new("TextButton")
	local Animations = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local Lean = Instance.new("TextButton")
	local Lay = Instance.new("TextButton")
	local Dance1 = Instance.new("TextButton")
	local Dance2 = Instance.new("TextButton")
	local Greet = Instance.new("TextButton")
	local ChestPump = Instance.new("TextButton")
	local Praying = Instance.new("TextButton")
	local Stop = Instance.new("TextButton")
	local UniversalAnimation = Instance.new("Animation")

	-- // Utility
	function stopTracks()
		for _, v in next, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks() do
			if (v.Animation.AnimationId:match("rbxassetid")) then
				v:Stop()
			end
		end
	end

	function loadAnimation(id)
		if UniversalAnimation.AnimationId == id then
			stopTracks()
			UniversalAnimation.AnimationId = "1"
		else
			UniversalAnimation.AnimationId = id
			local animationTrack = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(UniversalAnimation)
			animationTrack:Play()
		end
	end

	-- // Properties
	FreeAnimationPack.Name = "FreeAnimationPack"
	FreeAnimationPack.Parent = game.CoreGui
	FreeAnimationPack.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	AnimationPack.Name = "AnimationPack"
	AnimationPack.Parent = FreeAnimationPack
	AnimationPack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	AnimationPack.BorderSizePixel = 0
	AnimationPack.Position = UDim2.new(0, 0, 0.388007045, 0)
	AnimationPack.Size = UDim2.new(0, 100, 0, 20)
	AnimationPack.Font = Enum.Font.SourceSansBold
	AnimationPack.Text = "Animations"
	AnimationPack.TextColor3 = Color3.fromRGB(0, 0, 0)
	AnimationPack.TextSize = 18.000
	AnimationPack.MouseButton1Click:Connect(function()
		if (Animations.Visible == false) then
			Animations.Visible = true
		end
	end)

	Animations.Name = "Animations"
	Animations.Parent = AnimationPack
	Animations.Active = true
	Animations.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
	Animations.Position = UDim2.new(-0.104712225, 0, -1.54173493, 0)
	Animations.Size = UDim2.new(0, 120, 0, 195)
	Animations.Visible = false
	Animations.CanvasPosition = Vector2.new(0, 60.0000305)
	Animations.CanvasSize = UDim2.new(0, 0, 1, 235)

	UIListLayout.Parent = Animations
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 2)

	Lean.Name = "Lean"
	Lean.Parent = Animations
	Lean.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Lean.Size = UDim2.new(1, 0, 0, 30)
	Lean.Font = Enum.Font.SourceSansBold
	Lean.Text = "Lean"
	Lean.TextColor3 = Color3.fromRGB(0, 0, 0)
	Lean.TextSize = 14.000
	Lean.MouseButton1Click:Connect(function()
		stopTracks()
		loadAnimation("rbxassetid://3152375249")
	end)

	Lay.Name = "Lay"
	Lay.Parent = Animations
	Lay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Lay.Size = UDim2.new(1, 0, 0, 30)
	Lay.Font = Enum.Font.SourceSansBold
	Lay.Text = "Lay"
	Lay.TextColor3 = Color3.fromRGB(0, 0, 0)
	Lay.TextSize = 14.000
	Lay.MouseButton1Click:Connect(function()
		stopTracks()
		loadAnimation("rbxassetid://3152378852")
	end)

	Dance1.Name = "Dance1"
	Dance1.Parent = Animations
	Dance1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Dance1.Size = UDim2.new(1, 0, 0, 30)
	Dance1.Font = Enum.Font.SourceSansBold
	Dance1.Text = "Dance1"
	Dance1.TextColor3 = Color3.fromRGB(0, 0, 0)
	Dance1.TextSize = 14.000
	Dance1.MouseButton1Click:Connect(function()
		stopTracks()
		loadAnimation("rbxassetid://3189773368")
	end)

	Dance2.Name = "Dance2"
	Dance2.Parent = Animations
	Dance2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Dance2.Size = UDim2.new(1, 0, 0, 30)
	Dance2.Font = Enum.Font.SourceSansBold
	Dance2.Text = "Dance2"
	Dance2.TextColor3 = Color3.fromRGB(0, 0, 0)
	Dance2.TextSize = 14.000
	Dance2.MouseButton1Click:Connect(function()
		stopTracks()
		loadAnimation("rbxassetid://3189776546")
	end)

	Greet.Name = "Greet"
	Greet.Parent = Animations
	Greet.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Greet.Size = UDim2.new(1, 0, 0, 30)
	Greet.Font = Enum.Font.SourceSansBold
	Greet.Text = "Greet"
	Greet.TextColor3 = Color3.fromRGB(0, 0, 0)
	Greet.TextSize = 14.000
	Greet.MouseButton1Click:Connect(function()
		stopTracks()
		loadAnimation("rbxassetid://3189777795")
	end)

	ChestPump.Name = "ChestPump"
	ChestPump.Parent = Animations
	ChestPump.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ChestPump.Size = UDim2.new(1, 0, 0, 30)
	ChestPump.Font = Enum.Font.SourceSansBold
	ChestPump.Text = "Chest Pump"
	ChestPump.TextColor3 = Color3.fromRGB(0, 0, 0)
	ChestPump.TextSize = 14.000
	ChestPump.MouseButton1Click:Connect(function()
		stopTracks()
		loadAnimation("rbxassetid://3189779152")
	end)

	Praying.Name = "Praying"
	Praying.Parent = Animations
	Praying.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Praying.Size = UDim2.new(1, 0, 0, 30)
	Praying.Font = Enum.Font.SourceSansBold
	Praying.Text = "Praying"
	Praying.TextColor3 = Color3.fromRGB(0, 0, 0)
	Praying.TextSize = 14.000
	Praying.MouseButton1Click:Connect(function()
		stopTracks()
		loadAnimation("rbxassetid://3487719500")
	end)

	Stop.Name = "Stop"
	Stop.Parent = Animations
	Stop.BackgroundColor3 = Color3.fromRGB(255, 112, 112)
	Stop.Size = UDim2.new(1, 0, 0, 30)
	Stop.Font = Enum.Font.SourceSansBold
	Stop.Text = "Stop Animation"
	Stop.TextColor3 = Color3.fromRGB(0, 0, 0)
	Stop.TextSize = 14.000
	Stop.MouseButton1Click:Connect(function()
		stopTracks()
	end)
	--scripts
	local plr = game.Players.LocalPlayer

	plr:GetMouse().KeyDown:Connect(function(K)
		if K == "p" then
			Animations.Visible = false
		end
	end)
end)
Player:addButton("Silent Block", function()
	local ps = game:GetService("Players")
	local lp = ps.LocalPlayer
	local char = lp.Character

	char.BodyEffects.Armor:Destroy()
	char.BodyEffects.Defense:Destroy()

	local Clone1 = Instance.new("IntValue")
	Clone1.Name = "Armor"
	Clone1.Parent = char.BodyEffects

	local Clone2 = Instance.new("NumberValue")
	Clone2.Name = "Defense"
	Clone2.Parent = char.BodyEffects
	wait()
	while wait() do
		for _, v in next, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks() do
			if (v.Animation.AnimationId:match("rbxassetid://2788354405")) then
				v:Stop()
			end
		end
	end
	wait()
end)
Player:addButton("Unjail", function()
	if game:GetService("Players").LocalPlayer.DataFolder.Currency.Value >= 125 then
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-270.94, 20.327, -242.38)
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-270.94, 20.327, -242.38)
		wait()
		fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Key] - $125"].ClickDetector)
		wait(.1)
		fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Key] - $125"].ClickDetector)
		fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Key] - $125"].ClickDetector)
		repeat
			wait()
		until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[Key]")
		local Hum = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		if Hum.Health > 0 then
			key1 = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[Key]")
			if key1 then
				Hum:EquipTool(key1)
				for i, v in pairs(game:GetService"Players".LocalPlayer.Character:GetChildren()) do
					if v:isA("Tool") then
						game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(key1)
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-485.668, 23.631, -285.169)
						v:Activate()
					end
				end
			end
		end
	end
end)
wait(1)
Combat:addButton("Anti Stomp", function()
	if game.PlaceId == 2788229376 then repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("FULLY_LOADED_CHAR") else return end
	repeat wait() until false

	pcall(function() 
		local corepackages = game:GetService"CorePackages" 
		local localplayer = game:GetService"Players".LocalPlayer 
		local run = game:GetService"RunService" run:BindToRenderStep("rrrrrrrrrrr",2000,function() 
			pcall(function() 
				if localplayer.Character.BodyEffects["K.O"].Value then 
					localplayer.Character.Humanoid:UnequipTools() 
					localplayer.Character.Humanoid:Destroy() workspace.CurrentCamera.CameraSubject = localplayer.Character 
					wait() 
					local prt = Instance.new("Model", corepackages) Instance.new("Part", prt).Name="Torso" Instance.new("Part", prt).Name="Head" Instance.new("Humanoid", prt).Name="Humanoid" localplayer.Character=prt
				end 
			end)
		end)
	end)
end)
Combat:addButton("Grenade All", function()
	local plr = game.Players.LocalPlayer
	local lastpos = plr.Character.HumanoidRootPart.CFrame
	local playercount local greadecount local pp = {}
	local cock = true
	for I in pairs(game.Players:GetPlayers()) do
		playercount = I
	end

	game:GetService("RunService").Stepped:connect(function()
		setsimulationradius(math.huge)
	end)

	spawn(function()
		while cock do wait()
			for i, v in pairs(game.Workspace.Ignored:GetChildren()) do
				if v.Name == "Handle" then
					for index in pairs(pp) do
						table.insert(pp, v)
					end
					v.Name = tostring(i)
				end
			end
		end
	end)

	repeat wait()
		plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Grenade] - $700"].Head.CFrame
		fireclickdetector(game.Workspace.Ignored.Shop["[Grenade] - $700"].ClickDetector)
		for ii, vv in pairs(plr.Backpack:GetChildren()) do
			grenadecount = ii
		end
	until grenadecount >= playercount
	plr.Character.HumanoidRootPart.CFrame = lastpos

	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		spawn(function()
			if v.Name == "[Grenade]" then
				v.Parent = plr.Character v:Activate() wait(0.1) v:Deactivate() wait(0.1) v:Activate()
			end
		end)
	end

	for i, v in pairs(game.Players:GetPlayers()) do
		if v ~= plr then
			local mover = Instance.new("BodyPosition", pp[1])
			mover.P = 1e5
			table.remove(pp, 1)
			spawn(function()
				while wait() do
					mover.Position = v.Character.HumanoidRootPart.Position
				end
			end)
		end
	end
	cock = false
end)
Combat:addButton("Bag All", function()
	_G.bagall = true
	repeat
		local cor = coroutine.wrap(function()
			if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("[BrownBag]") then
				_G.bagall = true
				local cor = coroutine.wrap(function()
					game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(-314.580566, 51.1788902, -727.484558))
				end)
				cor()			
				wait(1)
				fireclickdetector(workspace.Ignored.Shop["[BrownBag] - $25"].ClickDetector, 4)
				wait(0.5)
				game:GetService("Players").LocalPlayer.Backpack["[BrownBag]"].Parent = game:GetService("Players").LocalPlayer.Character
				_G.bagall = false
			end
		end)
		cor()
		if _G.bagall == false then
			for i, v in pairs(game:GetService("Players"):GetPlayers()) do
				if v.Character:FindFirstChild("Christmas_Sock") == nil and v.Character:FindFirstChildOfClass("ForceField") == nil and v.Character ~= game:GetService("Players").LocalPlayer.Character then
					local chars = v.Character
					if game:GetService("Players").LocalPlayer.Character:FindFirstChild("[BrownBag]") then
						game:GetService("Players").LocalPlayer.Character["[BrownBag]"]:Activate()
					end
					game:GetService("Players").LocalPlayer.Character:MoveTo(v.Character.UpperTorso.Position)
				end
				wait(0.005)
			end
		end
		wait()
	until _G.bagall == false
end)
Combat:addButton("Katana", function()
	game.Players.LocalPlayer.Backpack["[Knife]"].GripPos = Vector3.new(1, 0, 0.1)
	game.Players.LocalPlayer.Backpack["[Knife]"].GripForward = Vector3.new(0, 0, 0)
	game.Players.LocalPlayer.Backpack["[Knife]"].GripRight = Vector3.new(0, 0, 0)
	game.Players.LocalPlayer.Backpack["[Knife]"].GripUp = Vector3.new(-1, 0, 0)
	game.Players.LocalPlayer.Backpack["[Knife]"].Parent = game.Players.LocalPlayer.Character

	game.Players.LocalPlayer.Backpack["[Knife]"].GripPos = Vector3.new(2, 0, 0.1)
	game.Players.LocalPlayer.Backpack["[Knife]"].GripForward = Vector3.new(0, 0, 0)
	game.Players.LocalPlayer.Backpack["[Knife]"].GripRight = Vector3.new(0, 0, 0)
	game.Players.LocalPlayer.Backpack["[Knife]"].GripUp = Vector3.new(-1, 0, 0)
	game.Players.LocalPlayer.Backpack["[Knife]"].Parent = game.Players.LocalPlayer.Character 

	game.Players.LocalPlayer.Backpack["[Knife]"].GripPos = Vector3.new(3, 0, 0.1)
	game.Players.LocalPlayer.Backpack["[Knife]"].GripForward = Vector3.new(0, 0, 0)
	game.Players.LocalPlayer.Backpack["[Knife]"].GripRight = Vector3.new(0, 0, 0)
	game.Players.LocalPlayer.Backpack["[Knife]"].GripUp = Vector3.new(-1, 0, 0)
	game.Players.LocalPlayer.Backpack["[Knife]"].Parent = game.Players.LocalPlayer.Character 

	game.Players.LocalPlayer.Backpack["[Knife]"].GripPos = Vector3.new(4, 0, 0.1)
	game.Players.LocalPlayer.Backpack["[Knife]"].GripForward = Vector3.new(0, 0, 0)
	game.Players.LocalPlayer.Backpack["[Knife]"].GripRight = Vector3.new(0, 0, 0)
	game.Players.LocalPlayer.Backpack["[Knife]"].GripUp = Vector3.new(-1, 0, 0)
	game.Players.LocalPlayer.Backpack["[Knife]"].Parent = game.Players.LocalPlayer.Character 
end)
Combat:addButton("Free Fists (Q)", function()
	-- // Variables
	local localPlayer       = game:GetService("Players").LocalPlayer
	local localCharacter    = localPlayer.Character
	local Mouse             = localPlayer:GetMouse()
	local FistControl       = false
	local LeftFist          = localCharacter.LeftHand
	local RightFist         = localCharacter.RightHand

	-- // Services
	local uis = game:GetService("UserInputService")

	-- // Coroutine Loop + Functions
	local loopFunction = function()
		LeftFist.CFrame  = CFrame.new(Mouse.Hit.p)
		RightFist.CFrame = CFrame.new(Mouse.Hit.p)
	end

	local Loop

	local Start = function()
		Loop = game:GetService("RunService").Heartbeat:Connect(loopFunction)
	end

	local Pause = function()
		Loop:Disconnect()
	end

	-- // Hotkeys
	uis.InputBegan:connect(function(Key)
		if (Key.KeyCode == Enum.KeyCode.Q) then
			if (FistControl == false) then
				FistControl = true
				Start()
				pcall(function()
					localCharacter.RightHand.RightWrist:Remove()
					localCharacter.LeftHand.LeftWrist:Remove()
				end)
			elseif (FistControl == true) then
				FistControl = false
				Pause()
				local rightwrist  = Instance.new("Motor6D")
				rightwrist.Name   = "RightWrist"
				rightwrist.Parent = localCharacter.RightHand
				rightwrist.C0     = CFrame.new(1.18422506e-07, -0.5009287, -6.81715525e-18, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				rightwrist.C1     = CFrame.new(3.55267503e-07, 0.125045404, 5.92112528e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				rightwrist.Part0  = localCharacter.RightLowerArm
				rightwrist.Part1  = localCharacter.RightHand

				local leftwrist   = Instance.new("Motor6D")
				leftwrist.Name    = "LeftWrist"
				leftwrist.Parent  = localCharacter.LeftHand
				leftwrist.C0      = CFrame.new(0.000475466368, -0.5009287, 7.59417072e-20, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				leftwrist.C1      = CFrame.new(0.000475821638, 0.125045404, 5.92112528e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				leftwrist.Part0   = localCharacter.LeftLowerArm
				leftwrist.Part1   = localCharacter.LeftHand
			end
		end
	end)
end)
Combat:addButton("Fist Reach", function()
	LP = game.Players.LocalPlayer 

	for i,v in ipairs(LP.Character:GetDescendants()) do 
		if v:IsA("MeshPart") then v.Massless = true 
			v.CanCollide = false 
			v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0) 
		end 
	end 

	for i,v in ipairs(game.workspace:GetDescendants()) do 
		if v:IsA("Seat") then 
			v.Disabled = true 
		end 
	end 

	x = 45
	y = 45 
	z = 45

	penis = Vector3.new(x,y,z) 

	LP.Character.RightHand.Size = penis 
	LP.Character.RightHand.Transparency = 1

	local selectionBox = Instance.new("SelectionBox",LP.Character.RightHand) 
	selectionBox.Adornee = LP.Character.RightHand 
	selectionBox = Enum.Material.Neon 

	LP.Character.LeftHand.Size = penis
	LP.Character.LeftHand.Transparency = 1

	LP.Character.BodyEffects.SpecialParts.LeftHand.Size = penis 
	LP.Character.LeftHand.Transparency = 1

	local selectionBox = Instance.new("SelectionBox",LP.Character.LeftHand) 
	selectionBox.Adornee = LP.Character.LeftHand 
	selectionBox = Enum.Material.Neon
end)
Combat:addButton("Tool Reach", function()
	for i, v in pairs(game:GetService"Players".LocalPlayer.Character:GetChildren()) do
		if v:isA("Tool") then
			local a = Instance.new("SelectionBox", v.Handle)
			a.Adornee = v.Handle
			v.Handle.Size = Vector3.new(50, 50, 50)
			v.Handle.Transparency = 1
			v.GripPos = Vector3.new(0, 0, 0)
		end
	end
end)
Combat:addButton("Auto Pick", function()
	local d = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
	for h, i in pairs(game.Workspace.Ignored.ItemsDrop:GetChildren()) do
		if i.Name == "Part" then
			if i:FindFirstChild("[LockPicker]") or i:FindFirstChild("[Knife]") then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = i.CFrame
				if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - i.Position).Magnitude <= 50 then
					wait()
				end
			end
		end
	end
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d)
end)
Combat:addButton("Split Grenade (V)", function()
	local plr = game.Players.LocalPlayer
	local lastpos = plr.Character.HumanoidRootPart.CFrame

	repeat wait()
		plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Grenade] - $700"].Head.CFrame
		fireclickdetector(game.Workspace.Ignored.Shop["[Grenade] - $700"].ClickDetector)
	until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.V)
	plr.Character.HumanoidRootPart.CFrame = lastpos

	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		wait(0.05)
		spawn(function()
			if v.Name == "[Grenade]" then
				v.Parent = plr.Character v:Activate() wait(0.1) v:Deactivate() wait(0.1) v:Activate()
			end
		end)
	end
end)
Combat:addButton("Silent Aim", function()
	local players = game.GetService(game, "Players")
	local guiservice = game.GetService(game, "GuiService")
	local runservice = game.GetService(game, "RunService")
	local renderstepped = runservice.RenderStepped
	local localPlayer = players.LocalPlayer
	local currentCamera = game.GetService(game, "Workspace").CurrentCamera
	local mouse = localPlayer.GetMouse(localPlayer)

	-- // MT Vars + Funcs
	local mt = getrawmetatable(game)
	local backupnamecall = mt.__namecall
	local backupnewindex = mt.__newindex
	local backupindex = mt.__index
	local setreadonly = setreadonly or make_writeable
	local getnamecallmethod = getnamecallmethod or get_namecall_method
	local newcclosure = newcclosure or function(f) return f end
	setreadonly(mt, false)

	game.Players.LocalPlayer.Character.BodyEffects.Armor:Destroy()
	-- // Silent Aim Vars
	getgenv().SilentAim = {
		Enabled = true,
		FOVRep = true,
		TeamCheck = false,
		VisibleCheck = true,
		FOV = 30,
		HitChance = 100,
	}

	local circle = Drawing.new("Circle")
	function updateCircle()
		if circle.__OBJECT_EXISTS then
			circle.Transparency = 1
			circle.Visible = SilentAim["FOVRep"]
			circle.Thickness = 2
			circle.Color = Color3.fromRGB(231, 84, 128)
			circle.NumSides = 12
			circle.Radius = (SilentAim["FOV"] * 6) / 2
			circle.Filled = false
			circle.Position = Vector2.new(mouse.X, mouse.Y + (guiservice.GetGuiInset(guiservice).Y))
		end
	end
	renderstepped.Connect(renderstepped, updateCircle)


	-- // Silent Aim Funcs
	function isPartVisible(part)
		local camera = game.GetService(game, "Workspace").CurrentCamera
		local character = game.GetService(game, "Players").LocalPlayer.Character.GetDescendants(game.GetService(game, "Players").LocalPlayer.Character)
		local castPoints = {part.Position}
		return camera.GetPartsObscuringTarget(camera, castPoints, character)
	end

	setreadonly(math, false) math.chance = function(percentage) local percentage = math.floor(percentage) local chance = math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100)/100 return chance <= percentage/100 end setreadonly(math, true)

	local getClosestPlayerToCursor = function()
		local closestPlayer = nil
		local chance = math.chance(SilentAim["HitChance"])
		local shortestDistance = math.huge
		for i, v in pairs(players.GetPlayers(players)) do
			if v ~= localPlayer and v.Character and v.Character.FindFirstChild(v.Character, "Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character.PrimaryPart ~= nil and v.Character.FindFirstChild(v.Character, "Head") then
				if SilentAim["VisibleCheck"] and not isPartVisible(v.Character.PrimaryPart) then
					return (chance and closestPlayer or localPlayer)
				end
				if SilentAim["TeamCheck"] then
					if v.Team ~= localPlayer.Team then      
						local pos = currentCamera.WorldToViewportPoint(currentCamera, v.Character.PrimaryPart.Position)
						local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
						if magnitude < (SilentAim["FOV"] * 6 - 8) then
							if magnitude < shortestDistance then
								closestPlayer = v
								shortestDistance = magnitude
							end
						end
					end
				else
					local pos = currentCamera.WorldToViewportPoint(currentCamera, v.Character.PrimaryPart.Position)
					local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
					if magnitude < (SilentAim["FOV"] * 6 - 8) then
						if magnitude < shortestDistance then
							closestPlayer = v
							shortestDistance = magnitude
						end
					end
				end
			end
		end  
		return (chance and closestPlayer or localPlayer)
	end
	local e
	runservice.Stepped:connect(function()
		if e then 
			game.ReplicatedStorage.MainEvent:FireServer("UpdateMousePos", e.Character.Head.Position)
		end
	end)
	while wait(1) do
		e = getClosestPlayerToCursor()
	end



	setreadonly(mt, false)
end)
Combat:addButton("Anti Aim", function()
	local UniversalAnimation = Instance.new("Animation")

	function stopTracks()
		for _, v in next, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks() do
			if (v.Animation.AnimationId:match("rbxassetid")) then
				v:Stop()
			end
		end
	end

	function loadAnimation(id)
		if UniversalAnimation.AnimationId == id then
			stopTracks()
			UniversalAnimation.AnimationId = "1"
		else
			UniversalAnimation.AnimationId = id
			local animationTrack = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(UniversalAnimation)
			animationTrack:Play()
		end
	end

	while wait() do
		stopTracks()
		loadAnimation("rbxassetid://3152378852")
	end
end)
Combat:addButton("Aimbot", function()
	local CC = game:GetService"Workspace".CurrentCamera
	local Plr
	local enabled = false
	local accomidationfactor = 0.165
	local mouse = game.Players.LocalPlayer:GetMouse()
	local placemarker = Instance.new("Part", game.Workspace)
	local guimain = Instance.new("Folder", game.CoreGui)

	function makemarker(Parent, Adornee, Color, Size, Size2)
		local e = Instance.new("BillboardGui", Parent)
		e.Name = "PP"
		e.Adornee = Adornee
		e.Size = UDim2.new(Size, Size2, Size, Size2)
		e.AlwaysOnTop = true
		local a = Instance.new("Frame", e)
		a.Size = UDim2.new(1, 0, 1, 0)
		a.BackgroundTransparency = 0.4
		a.BackgroundColor3 = Color
		local g = Instance.new("UICorner", a)
		g.CornerRadius = UDim.new(50, 50)
		return(e)
	end

	local data = game.Players:GetPlayers()
	function noob(player)
		local character
		repeat wait() until player.Character
		local handler = makemarker(guimain, player.Character:WaitForChild("Head"), Color3.fromRGB(255, 255, 255), 0.3, 3)
		handler.Name = player.Name
		player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild("Head") end)

		local TextLabel = Instance.new("TextLabel", handler)
		TextLabel.BackgroundTransparency = 1
		TextLabel.Position = UDim2.new(0, 0, 0, -50)
		TextLabel.Size = UDim2.new(0, 100, 0, 100)
		TextLabel.Font = Enum.Font.SourceSansSemibold
		TextLabel.TextSize = 14
		TextLabel.TextColor3 = Color3.new(1, 1, 1)
		TextLabel.TextStrokeTransparency = 0
		TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
		TextLabel.Text = "Name: "..player.Name
		TextLabel.ZIndex = 10

		spawn(function()
			while wait() do
				if player.Character then
					TextLabel.Text = player.Name.." | Bounty: "..tostring(player:WaitForChild("leaderstats").Wanted.Value).." | "..tostring(math.floor(player.Character:WaitForChild("Humanoid").Health))
				end
			end
		end)
	end

	for i = 1, #data do
		if data[i] ~= game.Players.LocalPlayer then
			noob(data[i])
		end
	end

	game.Players.PlayerAdded:connect(function(Player)
		noob(Player)
	end)

	spawn(function()
		placemarker.Anchored = true
		placemarker.CanCollide = false
		placemarker.Size = Vector3.new(0.1, 0.1, 0.1)
		placemarker.Transparency = 1
		makemarker(placemarker, placemarker, Color3.fromRGB(0, 0, 255), 0.15, 0)
	end)    

	local UserInputService = game:GetService"UserInputService"

	UserInputService.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			enabled = true 
			Plr = getClosestPlayerToCursor()
			guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			enabled = false
			guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		end
	end)

	function getClosestPlayerToCursor()
		local closestPlayer
		local shortestDistance = math.huge

		for i, v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("Head") then
				local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
				local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
				if magnitude < shortestDistance then
					closestPlayer = v
					shortestDistance = magnitude
				end
			end
		end
		return closestPlayer
	end

	game:GetService"RunService".Stepped:connect(function()
		if enabled and Plr.Character and Plr.Character:FindFirstChild("Head") then
			placemarker.CFrame = CFrame.new(Plr.Character.Head.Position+(Plr.Character.Head.Velocity*accomidationfactor))
		else
			placemarker.CFrame = CFrame.new(0, 9999, 0)
		end
	end)

	local mt = getrawmetatable(game)
	local old = mt.__namecall
	setreadonly(mt, false)
	mt.__namecall = newcclosure(function(...)
		local args = {...}
		if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
			args[3] = Plr.Character.Head.Position+(Plr.Character.Head.Velocity*accomidationfactor)
			return old(unpack(args))
		end
		return old(...)
	end)
end)
Combat:addButton("Anti Slow", function()
	game:GetService("Players").LocalPlayer.Character.BodyEffects.Movement.ChildAdded:Connect(function(child)
		if (child.Name == "NoJumping" or child.Name == "ReduceWalk" or child.Name == "NoWalkSpeed") then 
			child:Destroy()
		end
	end)
end)
Combat:addButton("Auto Eat", function()
	while wait() do
		pcall(function()
			if game.Players.LocalPlayer.Character.Humanoid.Health > 80 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 999, 0)
				if game.Players.LocalPlayer.Character:FindFirstChild("[Chicken]") == nil or game.Players.LocalPlayer.Backpack:FindFirstChild("[Chicken]") == nil then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Chicken] - $7"].Head.CFrame
					wait(0.5)
					fireclickdetector(game.Workspace.Ignored.Shop["[Chicken] - $7"].ClickDetector)
				end
				pcall(function()game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack["[Chicken]"])end)
				pcall(function()
					game.Players.LocalPlayer.Character["[Chicken]"]:Activate()
					wait(0.1)
					game.Players.LocalPlayer.Character["[Chicken]"]:Deactivate()
				end)
			end
		end)
	end
end)
Combat:addButton("Tornado", function()
	local d = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
	pcall(function()
		for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
			if v.Name == "[Knife]" then
				v.Parent = game:GetService("Players").LocalPlayer.Character
			end
		end
	end)
	wait(.2)
	local targetpos = CFrame.new(-278.063446, 21.75, -240.871841)
	local plr = game:GetService("Players").LocalPlayer
	local pos = plr.Character.HumanoidRootPart.Position
	if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("[Knife]") then
		plr.Character.HumanoidRootPart.CFrame = targetpos
		local cd = game:GetService("Workspace").Ignored.Shop["[Knife] - $150"]:FindFirstChild("ClickDetector")
		wait(.2)
		fireclickdetector(cd)
		wait(.2)
		game:GetService("Players").LocalPlayer.Backpack["[Knife]"].GripPos = Vector3.new(2, -5, -1.5)
		game:GetService("Players").LocalPlayer.Backpack["[Knife]"].GripForward = Vector3.new(0, 0, 0)
		game:GetService("Players").LocalPlayer.Backpack["[Knife]"].GripRight = Vector3.new(1, 0, -3)
		game:GetService("Players").LocalPlayer.Backpack["[Knife]"].GripUp = Vector3.new(0, 0, 0)
		game:GetService("Players").LocalPlayer.Backpack["[Knife]"].Parent = game:GetService("Players").LocalPlayer.Character
		spin = true
		local spinSpeed = 100
		local speaker = game:GetService("Players").LocalPlayer
		for i, v in pairs(speaker.Character.HumanoidRootPart:GetChildren()) do
			if v.Name == "Spinning" then
				v:Destroy()
			end
		end
		local Spin = Instance.new("BodyAngularVelocity", speaker.Character.HumanoidRootPart)
		Spin.Name = "Spinning"
		Spin.MaxTorque = Vector3.new(0, math.huge, 0)
		Spin.AngularVelocity = Vector3.new(0, spinSpeed, 0)
	end
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d)
end)
Combat:addButton("Fly Gun", function()
	for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
		if v:isA("Tool") then
			v.GripPos = Vector3.new(10,-10,10)
		end
	end
end)
wait(1)
Teleports:addButton("Bank", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-485.668, 23.631, -285.169)
end)
Teleports:addButton("Boxing Place", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-236.006, 23.151, -1120.531)
end)
Teleports:addButton("Police Station", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-267.637, 21.807, -121.982)
end)
Teleports:addButton("Admin Base", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-729.895, -37.642, -885.8)
end)
Teleports:addButton("Sewers", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(112.622, -26.212, -277.321)
end)
Teleports:addButton("Shoe Store", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.Ignored.Drop:FindFirstChildOfClass("MeshPart").Position)
end)
Teleports:addButton("Hospital", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.518, 21.755, -481.680)
end)
Teleports:addButton("Phone Store", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-120.121, 22.946, -870.425)
end)
Teleports:addButton("Taco Shack", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(546.946, 51.061, -493.325)
end)
Teleports:addButton("Casino", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-879.277, 21.254, -190.199)
end)
Teleports:addButton("UFO", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(71.565, 142.926, -690.33)
end)
Teleports:addButton("Fire Station", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-132.674, 21.280, -145.176)
end)
Teleports:addButton("Gas Station", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(595.377, 49.000, -264.222)
end)
Teleports:addButton("Church", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(203.938, 21.75, -98.446)
end)
Teleports:addButton("Gun Store 1", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-582, 7.172, -739.015)
end)
Teleports:addButton("Gun Store 2", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(475.022, 48.005, -603.737)
end)
wait(1)
for _, v in pairs(workspace.Ignored.Shop:GetChildren()) do
	Autobuy:addButton(v.Name, function()
		local d = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
		local k = game.Workspace.Ignored.Shop[v.Name]
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
		if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
			wait(.2)
			fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d)
		end
	end)
end
wait(1)
Autofarm:addButton("Fist Farm", function()
	_G.rob = true

	noclip = true
	game:GetService("RunService").Stepped:connect(function()
		if noclip then
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)
	plr = game.Players.LocalPlayer
	mouse = plr:GetMouse()
	mouse.KeyDown:connect(function(key)

		if key == "b" then
			noclip = not noclip
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)

	local a = game.Workspace.Cashiers:GetChildren()
	for b = 1, #a do
		local c = a[b]
		c.Name = "CASHIER" .. b
	end
	for d, e in pairs(game.Workspace:GetDescendants()) do
		if e:IsA("Seat") then
			e:Destroy()
		end
	end
	for f, g in pairs(game.Workspace.MAP.Map["Da Furniture"]:GetChildren()) do
		if g then
			if g.Name == "Part" then
				g.CanCollide = false
			end
		end
	end
	for h, i in pairs(game.Workspace.MAP.Map["Ubi's Resturant"]:GetChildren()) do
		if i then
			if i.Name == "Part" then
				if i.Size ~= Vector3.new(48, 3.25, 80) then
					i.CanCollide = false
				end
			end
		end
	end
	for j, k in pairs(game.Workspace.MAP.Map["Gas Station"]["Gas Station"]:GetChildren()) do
		if k then
			if k.Name == "Part" then
				if k.Size ~= Vector3.new(68, 1, 56) then
					k.CanCollide = false
				end
			end
		end
	end
	function toTarget(l, m, n)
		local o = game:service "TweenService"
		local p = TweenInfo.new((m - l).Magnitude / 170, Enum.EasingStyle.Quad)
		local q = tick()
		local r, s =
			pcall(
				function()
				local r = o:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], p, {CFrame = n})
				r:Play()
			end
			)
		if not r then
			return s
		end
		for i, v in pairs(workspace.Cashiers:GetChildren()) do
			if v:WaitForChild("Humanoid").Health > 0 then
				local cf = v.Open.CFrame
				local lv = cf.lookVector
				game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = cf + (lv * Vector3.new(-1, 0, 0))
				return v
			end
		end
	end
	local function t(u, v)
		local w = (u.Position - v.Position).magnitude
		if w <= 50 then
			fireclickdetector(v:FindFirstChild("ClickDetector"))
			return w
		end
	end
	while _G.rob == true do
		wait()
		repeat
			for x, y in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
				if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - y.Position).Magnitude <= 50 then
					local z = y
					t(game.Players.LocalPlayer.Character.HumanoidRootPart, y)
					wait()
				end
			end
			if not game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
				local A = game.Players.LocalPlayer.Backpack:FindFirstChild("Combat")
				A.Parent = game.Players.LocalPlayer.Character
			end
			wait()
			for b, B in pairs(game.Workspace.Cashiers:GetChildren()) do
				wait()
				if B:FindFirstChild("Humanoid") then
					if B.Humanoid.Health > 0 then
						wait()
						if B.Name ~= "CASHIER5" then
							B.Open.Orientation = Vector3.new(0, 90, 0)
							B.Open.Size = Vector3.new(4,4,4)
							B.Open.CanCollide = false
						end
						if B.Name == "CASHIER5" then
							--B.Open.Orientation = Vector3.new(0, 180, 0)
							B.Open.Position = B.Open.Position - Vector3.new(0,0,0)
							B.Open.Size = Vector3.new(4,4,4)
							B.Open.CanCollide = false
						end
						wait()
						poss = B.Open.Position - Vector3.new(0, 0, 0)
						posc = B.Open.CFrame - Vector3.new(-1, 0, 0)
						toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, poss, posc)
						repeat
							wait()
						until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - poss).Magnitude <
							50 or
							_G.rob == false or
							B.Humanoid.Health <= 0
						repeat
							if not game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
								local A = game.Players.LocalPlayer.Backpack:FindFirstChild("Combat")
								A.Parent = game.Players.LocalPlayer.Character
							end
							toTarget(
								game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,
								poss,
								posc
							)
							wait(0)
							game:GetService("VirtualUser"):Button1Down(Vector2.new())
						until B.Humanoid.Health <= 0 or _G.rob == false
						wait(0)
						for C = 5, 50 do
							wait()
							for x, y in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
								if
									(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - y.Position).Magnitude <=
										50
								then
									if y:IsA("Part") then
										local z = y
										t(game.Players.LocalPlayer.Character.HumanoidRootPart, y)
										wait()
									end
								end
							end
						end
					end
				end
			end
		until _G.rob == false
	end
end)
Autofarm:addButton("Fast Farm", function()
	-- // Settings
	local lagSensitivity = 10

	-- // Services
	local Players = game:GetService("Players")
	local Workspace = game:GetService("Workspace")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local stats = game:GetService("Stats")
	local RunService = game:GetService("RunService")

	-- // Vars
	local LocalPlayer = Players.LocalPlayer
	local MainEvent = ReplicatedStorage.MainEvent
	local Target = nil

	-- // Metatable vars
	local mt = getrawmetatable(game)
	local backupindex = mt.__index
	setreadonly(mt, false)

	RunService.Stepped:connect(function()
		pcall(function()
			LocalPlayer.Character.Humanoid:ChangeState(11)
		end)
	end)

	game:GetService("Players").LocalPlayer.Idled:connect(function()
		game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		wait(1)
		game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end)

	repeat wait() until game:IsLoaded()
	local benchmark = 0
	local enabled = true
	spawn(function()
		wait(10)
		enabled = false
	end)
	while enabled do RunService.Stepped:wait()
		local c = stats.PhysicsReceiveKbps
		if c>benchmark then
			benchmark = c
			print("current benchmark (recived kbps)", benchmark)
		end
	end

	local allWeapons = {
		["[Glock]"] = true,
		["[Silencer]"] = true,
		["[Shotgun]"] = true,
		["[SMG]"] = true,
		["[AR]"] = true,
		["[P90]"] = true,
		["[SilencerAR]"] = true,
		["[Revolver]"] = true,
		["[AK47]"] = true,
		["[TacticalShotgun]"] = true,
		["[DrumGun]"] = true,
		["[AUG]"] = true,
		["[LMG]"] = true,
		["[Double-Barrel SG]"] = true
	}

	-- // Equip Tool
	equipTool = function(Name)
		if (LocalPlayer.Character:FindFirstChild(Name)) then
			return LocalPlayer.Character[Name]
		end

		if (LocalPlayer.Backpack:FindFirstChild(Name)) then
			local tool = LocalPlayer.Backpack[Name]
			LocalPlayer.Character.Humanoid:EquipTool(tool)
			return LocalPlayer.Character:WaitForChild(Name)
		end
	end

	-- // Automation: Get Nearby Cash
	getNearbyCash = function(customWait)
		-- // Vars
		local drops = Workspace.Ignored.Drop:GetChildren()

		-- // Loop
		for i = 1, #drops do
			local v = drops[i]
			if (v.Name == "MoneyDrop" and (LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= 20) then
				wait(customWait or 0.7)
				fireclickdetector(v.ClickDetector, 0)
			end
		end
	end

	-- // MT Hook
	mt.__index = newcclosure(function(t, k)
		if (t:IsA("Mouse") and (k == "Hit" or k == "Target")) then
			if (Target) then
				return (k == "Hit" and Target.CFrame or Target)
			end
		end
		return backupindex(t, k)
	end)

	-- // Automation: Get Cashiers
	local yes = false
	while wait() do
		pcall(function()
			local WeaponName
			LocalPlayer.Character.Humanoid:UnequipTools()
			for i, v in next, LocalPlayer.Backpack:GetChildren() do
				if allWeapons[v.Name] then
					WeaponName = v.Name
				end
			end
			-- // Handling
			if (not WeaponName) then
				WeaponName = "Combat"
			end

			-- // Vars
			local saved = LocalPlayer.Character.HumanoidRootPart.CFrame
			local cashiers = Workspace.Cashiers:GetChildren()

			-- // Loop
			local debug = true
			for i = 1, #cashiers do
				local cashier = cashiers[i]
				if game:GetService("Stats").PhysicsReceiveKbps < benchmark - lagSensitivity then
					print("you-are-too-laggy-young-one")
					local oldpos = LocalPlayer.Character.HumanoidRootPart.CFrame
					repeat wait()
						LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,1e4,0)

					until game:GetService("Stats").PhysicsReceiveKbps > benchmark - lagSensitivity
					LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
				end
				if (cashier.Humanoid.Health > 0) then
					debug = false
					-- // Vars
					local cashierCFrame = cashier.Open.CFrame
					local destinationCFrame = cashierCFrame + (cashierCFrame.lookVector * Vector3.new(0, 0, -2))
					Target = cashier.Open

					-- // Punch + Teleport
					while (cashier.Humanoid.Health > 0) do
						wait()
						-- // Equip melee weapon
						local tool = equipTool(WeaponName)

						-- // Auto Reload
						if (tool:FindFirstChild("Ammo") and tool.Ammo.Value == 0) then
							if LocalPlayer.DataFolder.Inventory[tool.Name].Value == "0" then
								local tobuy = tool.Name:gsub(".", function(chr) if chr == "[" or chr == "]" then return "" else return chr:lower() end end).." ammo"
								local loc
								local best, bestprice = math.huge, math.huge
								local sorted = {}
								for ii = 1, 2 do
									for i, v in next, game.Workspace.Ignored.Shop:GetChildren() do
										local Start, End, TrueEnd, count, str, price = nil, nil, nil, 0, v.Name, ""
										str = str:gsub(".", function(Char)
											count = count + 1
											if Char == "[" then
												Start = count
												return "" 
											elseif Char == "]" then
												End = count
												return "" 
											elseif Char == "$" then
												TrueEnd = count
												return ""
											elseif TrueEnd and count>TrueEnd then
												price = price..Char
												return ""
											elseif (not Start) or (End and count>End) then
												return ""
											else
												return Char:lower()
											end
										end)
										price = tonumber(price)
										if string.find(str, tobuy:lower()) then
											local a, e = string.find(str, tobuy:lower())
											local g = #str-(e-a)
											if g<=best then
												if ii == 2 and price<bestprice then
													bestprice = price
													loc = v
												else
													best = g
												end
											end
										end
									end
								end
								repeat wait()
									LocalPlayer.Character.HumanoidRootPart.CFrame = loc.Head.CFrame
									fireclickdetector(loc.ClickDetector)
									LocalPlayer.Character.Humanoid:UnequipTools()
								until tonumber(LocalPlayer.DataFolder.Inventory[tool.Name].Value) >= 400
							else 
								MainEvent:FireServer("Reload", tool, true)
								repeat wait() until LocalPlayer.Character.BodyEffects.Reload.Value == false
							end
						end

						-- //
						LocalPlayer.Character.HumanoidRootPart.CFrame = destinationCFrame

						tool:Activate()
					end
					-- // Get cash
					getNearbyCash(math.abs(benchmark-game:GetService("Stats").PhysicsReceiveKbps)/6)
					wait(math.abs(benchmark-game:GetService("Stats").PhysicsReceiveKbps)/4)
				end
			end

			if debug then
				LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,1e4,0)
				if yes then
					yes = false
					print("no-more-cashiers-available")
				end
			else
				yes = true
			end

			-- // Reset Mouse
			Target = nil
		end)
	end
end)
Autofarm:addButton("Shotgun Farm", function()
	if game.Players.LocalPlayer.Character.Animate:FindFirstChild("idle") then
		game.Players.LocalPlayer.Character.Animate.idle:Destroy()
	end
	local me = game:service"Players".LocalPlayer
	local plr = game.Players.LocalPlayer
	local savedarmourpos = plr.Character.HumanoidRootPart.Position
	local toolname = "[Shotgun] - $1250"
	plr.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.Ignored.Shop[toolname].Head.Position)
	wait(.1)
	fireclickdetector(game.Workspace.Ignored.Shop[toolname].ClickDetector)
	wait(.1)
	fireclickdetector(game.Workspace.Ignored.Shop[toolname].ClickDetector)
	wait(.1)
	fireclickdetector(game.Workspace.Ignored.Shop[toolname].ClickDetector)
	wait(.1)
	fireclickdetector(game.Workspace.Ignored.Shop[toolname].ClickDetector)
	wait(.1)
	fireclickdetector(game.Workspace.Ignored.Shop[toolname].ClickDetector)
	wait(.1)
	fireclickdetector(game.Workspace.Ignored.Shop[toolname].ClickDetector)
	wait(.1)
	me.Character.Humanoid:EquipTool(me.Backpack:FindFirstChild("[Shotgun]"))
	wait(0.001)
	plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedarmourpos)
	plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedarmourpos)
	function bypass()
		local oh1 = CFrame.new(-346.434296, 52.5954704, 446.756989)
		local oh2 = game:GetService("Players")
		local oh3 = oh2.LocalPlayer.Character.HumanoidRootPart


		oh3.CFrame = oh1
		wait(1.5)
	end
	repeat
		wait()
	until game:IsLoaded()

	if workspace.Players[game.Players.LocalPlayer.Name]:FindFirstChild("[Shotgun]") then
		workspace.Players[game.Players.LocalPlayer.Name]:FindFirstChild("[Shotgun]").Name = "[Drxco]"

		function Buy()
			fireclickdetector(workspace.Ignored.Shop["20 [Shotgun Ammo] - $60"].ClickDetector)
			fireclickdetector(workspace.Ignored.Shop["20 [Shotgun Ammo] - $60"].ClickDetector)
		end

		local ATM = "nil"
		local idk = false
		local dineros = false
		local lol = 0

		function GetATM()
			bypass()
			for i, v in pairs(workspace.Cashiers:GetChildren()) do
				if v:WaitForChild("Humanoid").Health > 0 then
					local cf = v.Open.CFrame
					local lv = cf.lookVector
					game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = cf + (lv * Vector3.new(0, 0, -2))
					game.ReplicatedStorage.MainEvent:FireServer("UpdateMousePos", v.Open.Position)
					return v
				end
			end
		end

		function GETMONEY()
			for i, v in pairs(workspace.Ignored.Drop:GetChildren()) do
				if v.Name == "MoneyDrop" and (workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.Position - v.Position).Magnitude < 25
				then
					dineros = true
					fireclickdetector(v.ClickDetector)
					wait(0.7)
					dineros = false
				end
			end
		end

		ATM = GetATM()

		function reload(name, gun)
			local XD1 = "Reload"
			local XD2 = game:GetService("Workspace").Players[name][gun]
			local Event = game:GetService("ReplicatedStorage").MainEvent
			Event:FireServer(XD1, XD2)
		end
		game:GetService("RunService").Heartbeat:Connect(function()
			GETMONEY()
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			if lol == 0 and dineros == false then
				if game.Players.LocalPlayer.DataFolder.Inventory["[Shotgun]"].Value == "0" and idk == false then
					lol = 10
					idk = true
					local part = workspace.Ignored.Shop["20 [Shotgun Ammo] - $60"].Head
					game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
						CFrame.new(part.CFrame.X, part.CFrame.Y + 4, part.CFrame.Z)
					game.workspace.Players[game.Players.LocalPlayer.Name]["[Drxco]"].Parent =
						game.Players.LocalPlayer.Backpack
					wait(2)
					for i = 1, 10 do
						game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
							CFrame.new(
								part.CFrame.X + math.random(1, 2),
								part.CFrame.Y + math.random(1, 2),
								part.CFrame.Z + math.random(1, 2)
							)
						Buy()
						wait(0.5)
					end
					game.Players.LocalPlayer.Backpack["[Drxco]"].Parent =
						game.workspace.Players[game.Players.LocalPlayer.Name]
					lol = 0
					idk = false
					local cf = ATM.Open.CFrame
					local lv = cf.lookVector
					game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
						cf + (lv * Vector3.new(0, 0, -2))
				end
				if
					game.workspace.Players[game.Players.LocalPlayer.Name]:WaitForChild("[Drxco]").Ammo.Value == 4 and
						idk == false
				then
					idk = true
					reload(game.Players.LocalPlayer.Name, "[Drxco]")
					wait(0.5)
					idk = false
				else
					for i, v in pairs(workspace.Cashiers:GetChildren()) do
						if v:WaitForChild("Humanoid").Health > 0 then
							if idk == false then
								if ATM.Humanoid.Health > 0 then
									game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0, 0))
									local cf = ATM.Open.CFrame
									local lv = cf.lookVector
									game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
										cf + (lv * Vector3.new(0, 0, -2))
								end
							end
						end
					end
				end
				for i, v in pairs(workspace.Cashiers:GetChildren()) do
					if v:WaitForChild("Humanoid").Health > 0 then
						if ATM.Humanoid.Health < 0 and idk == false then
							lol = 10
							wait(0.1)
							if idk == false then
								local cf = ATM.Open.CFrame
								local lv = cf.lookVector
								game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
									cf + (lv * Vector3.new(0, 0, -2))

								ATM = GetATM()
							end
							lol = 0
						end
					end
				end
			end
		end)
	end
end)
Autofarm:addButton("P90 Farm", function()
	if game.Players.LocalPlayer.Character.Animate:FindFirstChild("idle") then
		game.Players.LocalPlayer.Character.Animate.idle:Destroy()
	end
	local me = game:service"Players".LocalPlayer
	local plr = game.Players.LocalPlayer
	local savedarmourpos = plr.Character.HumanoidRootPart.Position
	local toolname = "[P90] - $1000"
	plr.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.Ignored.Shop[toolname].Head.Position)
	wait(.1)
	fireclickdetector(game.Workspace.Ignored.Shop[toolname].ClickDetector)
	wait(.1)
	fireclickdetector(game.Workspace.Ignored.Shop[toolname].ClickDetector)
	wait(.1)
	fireclickdetector(game.Workspace.Ignored.Shop[toolname].ClickDetector)
	wait(.1)
	fireclickdetector(game.Workspace.Ignored.Shop[toolname].ClickDetector)
	wait(.1)
	fireclickdetector(game.Workspace.Ignored.Shop[toolname].ClickDetector)
	wait(.1)
	fireclickdetector(game.Workspace.Ignored.Shop[toolname].ClickDetector)
	wait(.1)
	me.Character.Humanoid:EquipTool(me.Backpack:FindFirstChild("[P90]"))
	wait(0.001)
	plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedarmourpos)
	plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedarmourpos)
	function bypass()
		local oh1 = CFrame.new(-346.434296, 52.5954704, 446.756989)
		local oh2 = game:GetService("Players")
		local oh3 = oh2.LocalPlayer.Character.HumanoidRootPart


		oh3.CFrame = oh1
		wait(1.5)
	end
	repeat
		wait()
	until game:IsLoaded()

	if workspace.Players[game.Players.LocalPlayer.Name]:FindFirstChild("[P90]") then
		workspace.Players[game.Players.LocalPlayer.Name]:FindFirstChild("[P90]").Name = "[P900]"
	else
		game.Players.LocalPlayer.Backpack["[P90]"].Parent = workspace.Players[game.Players.LocalPlayer.Name]
		game.workspace.Players[game.Players.LocalPlayer.Name]:FindFirstChild("[P90]").Name = "[P900]"
	end

	function Buy()
		fireclickdetector(workspace.Ignored.Shop["120 [P90 Ammo] - $60"].ClickDetector)
	end

	local timer = 0
	local ATM = "nil"
	local GetAmmoOrReload = false
	local Cash = false

	function GetCash()
		for i, v in pairs(workspace.Ignored.Drop:GetChildren()) do
			if
				v.Name == "MoneyDrop" and
					(workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.Position - v.Position).Magnitude < 12
			then
				Cash = true
				fireclickdetector(v.ClickDetector)
				wait(1)
				Cash = false
			end
		end
	end

	function getATM()
		for i, v in pairs(workspace.Cashiers:GetChildren()) do
			if v:WaitForChild("Humanoid").Health > 0 then
				local cf = v.Head.CFrame
				local lv = cf.lookVector
				game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
					cf + (lv * Vector3.new(0, 0, -3))
				game.ReplicatedStorage.MainEvent:FireServer("UpdateMousePos", v.Head.Position)
				return v
			end
		end
	end

	ATM = getATM()

	function reload(name, gun)
		local A_1 = "Reload"
		local A_2 = game:GetService("Workspace").Players[name][gun]
		local Event = game:GetService("ReplicatedStorage").MainEvent
		Event:FireServer(A_1, A_2)
	end

	game:GetService("RunService").Heartbeat:Connect(function()
		GetCash()
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		if timer == 0 and Cash == false then
			if game.Players.LocalPlayer.DataFolder.Inventory["[P90]"].Value == "0" and GetAmmoOrReload == false then
				timer = 10
				GetAmmoOrReload = true
				local part = workspace.Ignored.Shop["120 [P90 Ammo] - $60"].Head
				game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
					CFrame.new(part.CFrame.X, part.CFrame.Y + 4, part.CFrame.Z)
				game.workspace.Players[game.Players.LocalPlayer.Name]["[P900]"].Parent =
					game.Players.LocalPlayer.Backpack
				wait(2)
				for i = 1, 10 do
					game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
						CFrame.new(
							part.CFrame.X + math.random(1, 2),
							part.CFrame.Y + math.random(1, 2),
							part.CFrame.Z + math.random(1, 2)
						)
					print "e"
					Buy()
					wait(1)
				end
				game.Players.LocalPlayer.Backpack["[P900]"].Parent =
					game.workspace.Players[game.Players.LocalPlayer.Name]
				timer = 0
				GetAmmoOrReload = false
				local cf = ATM.Head.CFrame
				local lv = cf.lookVector
				game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
					cf + (lv * Vector3.new(0, 0, -3))
			end
			if
				game.workspace.Players[game.Players.LocalPlayer.Name]:WaitForChild("[P900]").Ammo.Value == 0 and
					GetAmmoOrReload == false
			then
				GetAmmoOrReload = true
				reload(game.Players.LocalPlayer.Name, "[P900]")
				wait(2)
				GetAmmoOrReload = false
			else
				for i, v in pairs(workspace.Cashiers:GetChildren()) do
					if v:WaitForChild("Humanoid").Health > 0 then
						if GetAmmoOrReload == false then
							if ATM.Humanoid.Health > 0 then
								game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0, 0))
								local cf = ATM.Head.CFrame
								local lv = cf.lookVector
								game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
									cf + (lv * Vector3.new(0, 0, -3))
							end
						end
					end
				end
			end
			for i, v in pairs(workspace.Cashiers:GetChildren()) do
				if v:WaitForChild("Humanoid").Health > 0 then
					if ATM.Humanoid.Health < 0 and GetAmmoOrReload == false then
						timer = 10
						wait(0.1)
						if GetAmmoOrReload == false then
							local cf = ATM.Head.CFrame
							local lv = cf.lookVector
							game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
								cf + (lv * Vector3.new(0, 0, -3))

							ATM = getATM()
						end
						timer = 0
					end
				end
			end
		end
	end
	)
end)
Autofarm:addButton("Auto Muscle", function()
	while true do
		wait()
		if not game.Players.LocalPlayer.Character:FindFirstChild("[HeavyWeights]") then
			wait()
			local k = game.Workspace.Ignored.Shop["[HeavyWeights] - $250"]
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
				wait(.2)
				fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
			end
		end
		if not game.Players.LocalPlayer.Character:FindFirstChild("[HeavyWeights]") then
			tool = game.Players.LocalPlayer.Backpack:WaitForChild("[HeavyWeights]")
			tool.Parent = game.Players.LocalPlayer.Character
		end
		game:GetService("VirtualUser"):ClickButton1(Vector2.new())
		local d = Vector3.new(-1006.99, -51.1542, -1014.33)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d)
	end
end)
Autofarm:addButton("Auto Box", function()
	while true do
		wait()
		if not game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
			local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Combat")
			tool.Parent = game.Players.LocalPlayer.Character
		end
		for V, W in pairs(game.Workspace.MAP.Map.ArenaBOX:GetChildren()) do
			wait()
			warn(W)
			if W.Name == "PunchingBagInGame" then
				wait()
				posMx = W:FindFirstChild("pretty ransom").Position - Vector3.new(0, 0, 0)
				poscMx = W:FindFirstChild("pretty ransom").CFrame - Vector3.new(3, 0, 0)
				ToShoes(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, posMx, poscMx)
				while true do
					if not game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
						local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Combat")
						tool.Parent = game.Players.LocalPlayer.Character
					end
					ToShoes(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, posMx, poscMx)
					wait(.5)
					game:GetService("VirtualUser"):ClickButton1(Vector2.new())
				end
			end
		end
	end
end)
wait(1)
_G.CashDropAmount = 10000
FastDrop:addToggle("Fast Drop Cash", nil, function(value)
	while value do
		wait()
		game.ReplicatedStorage.MainEvent:FireServer("DropMoney", _G.CashDropAmount)
	end
end)
FastDrop:addTextbox("Cash Drop Amount", "10000", function(value, focusLost)
	if focusLost then
		_G.CashDropAmount = value
	end
end)
wait(1)
TrollCash:addSlider("Fake Cash", 0, 0, 1000000000, function(value)
	game.Players.LocalPlayer.PlayerGui.Framework.CurrencySound:Play()
	game.Players.LocalPlayer.DataFolder.Currency.Value = value
	game.Players.LocalPlayer.PlayerGui.MainScreenGui.MoneyText.Text = "$"..value
	if game.Players.LocalPlayer.Backpack:FindFirstChild("Wallet") then
		game.Players.LocalPlayer.Backpack.Wallet.Handle.BillboardGui.TextLabel.Text = "$"..value
	else
		game.Players.LocalPlayer.Character.Wallet.Handle.BillboardGui.TextLabel.Text = "$"..value
	end
end)
TrollCash:addTextbox("Custom Fake Cash", "Amount", function(value, focusLost)
	if focusLost then
		game.Players.LocalPlayer.PlayerGui.Framework.CurrencySound:Play()
		game.Players.LocalPlayer.DataFolder.Currency.Value = value
		game.Players.LocalPlayer.PlayerGui.MainScreenGui.MoneyText.Text = "$"..value
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Wallet") then
			game.Players.LocalPlayer.Backpack.Wallet.Handle.BillboardGui.TextLabel.Text = "$"..value
		else
			game.Players.LocalPlayer.Character.Wallet.Handle.BillboardGui.TextLabel.Text = "$"..value
		end
	end
end)
wait(1)
CashMods:addButton("Cash ESP", function()
	local ESPholder = Instance.new("Folder", game.CoreGui)
	function cham(object)
		if object.Name == "MoneyDrop" then
			local a = Instance.new("BoxHandleAdornment", ESPholder)
			a.Adornee = object
			a.AlwaysOnTop = true
			a.ZIndex = 10
			a.Size = object.Size
			a.Transparency = 0.3
			a.Color = object.BrickColor
			local bill = object:WaitForChild("BillboardGui")
			bill.AlwaysOnTop = true
			bill.Size = UDim2.new(2, 10, 1, 5)
			spawn(function()
				while true do
					if object.Parent.ChildRemoving:wait() == object then
						a:Destroy()
						break
					end
				end
			end)
		end
	end
	for i, v in next, game.Workspace.Ignored.Drop:GetChildren() do
		cham(v)
	end
	game.Workspace.Ignored.Drop.ChildAdded:connect(cham)
end)
CashMods:addButton("Bring Cash", function()
	for e, v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
		if v.Name == "MoneyDrop" then
			v.Position = game.Players.LocalPlayer.Character.Head.CFrame.p + Vector3.new(0, 1, 0)
			v.Anchored = false
		end
	end
end)
CashMods:addButton("Cash Scaffold", function()
	while wait() do
		for e, v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
			if v.Name == "MoneyDrop" then
				v.CFrame = game.Players.LocalPlayer.Character.Head.CFrame.p + Vector3.new(0, 1.5, -22)
				v.CanCollide = false
			end
		end
	end
end)
CashMods:addButton("Cash Float", function()
	spawn(function()
		repeat
			game:GetService("RunService").Heartbeat:wait()
			settings().Physics.AllowSleep = false
			settings().Physics.ThrottleAdjustTime = math.huge - math.huge
			setsimulationradius(1e9, 1e9)
			game:GetService("RunService").Stepped:wait()
		until nil
	end)
	local function zeroGrav(part)
		if part:FindFirstChild("BodyForce") then return end
		local temp = Instance.new("BodyForce")
		temp.Force = part:GetMass() * Vector3.new(0,workspace.Gravity,0)
		temp.Parent = part
	end

	for i,v in ipairs(workspace:GetDescendants()) do
		if v:IsA("Part") and v.Anchored == false then
			if not (v:IsDescendantOf(game.Players.LocalPlayer.Character)) then
				zeroGrav(v)
			end
		end
	end

	workspace.DescendantAdded:Connect(function(part)
		if part:IsA("Part") and part.Anchored == false then
			if not (part:IsDescendantOf(game.Players.LocalPlayer.Character)) then
				zeroGrav(part)
			end
		end
	end)
end)
CashMods:addButton("Cash Fling", function()
	for e, v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
		if v.Name == "MoneyDrop" then
			local BodyPosition = Instance.new("BodyPosition", v)
			BodyPosition.D = 0
			BodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			BodyPosition.P = 15000
		end
	end
end)
CashMods:addButton("Cash Destroy", function()
	for e, v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
		if v.Name == "MoneyDrop" then
			v:Destroy()
		end
	end
end)
CashMods:addButton("Cash Spin", function()
	for _, v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
		if v.Name == "MoneyDrop" then
			local BodyPosition = Instance.new("BodyPosition") 
			BodyPosition.Parent = v
			local BodyAngularVelocity = Instance.new("BodyAngularVelocity") 
			BodyAngularVelocity.Parent = v
			BodyAngularVelocity.AngularVelocity = Vector3.new(0, 100, 0)
			BodyAngularVelocity.MaxTorque = Vector3.new(0, 200, 0)
		end
	end
end)
wait(1)
Featured:addButton("RPG Ride", function()
	-- SETTINGS --
	local speed = 20
	local turnSpeed = 3
	--------------

	local plr = game.Players.LocalPlayer
	local Mouse = plr:GetMouse()
	local peniscock
	local movers
	local control = {w=false,a=false,s=false,d=false,q=false,e=false}

	game:GetService("RunService").Stepped:connect(function()
		if plr.PlayerGui:FindFirstChild("MainScreenGui") and plr.PlayerGui.MainScreenGui:FindFirstChild("Bar") and plr.PlayerGui.MainScreenGui.Bar:FindFirstChild("Speed") then
			plr.PlayerGui.MainScreenGui.Bar.Speed.bar.Size = UDim2.new(speed / 100 * 0.95, 0, 0.83, 0)
		else
			local c = plr.PlayerGui.MainScreenGui.Bar.HP
			local g = c:Clone()
			g.Name = "Speed"
			g.Position = UDim2.new(0.5, 0, 1, -120)
			g.bar.BackgroundColor3 = Color3.fromRGB(255, 155, 0)
			g.Picture.Image.Image = "rbxassetid://181035717"
			g.TextLabel.Text = "Speed"
			g.Parent = c.Parent
		end
		if peniscock and peniscock.Parent ~= nil then
			setsimulationradius(math.huge^math.huge, math.huge)
			if movers then
				movers[1].Position = (peniscock.CFrame*CFrame.new(0, -speed/20, -2))*CFrame.Angles(math.rad(-90), 0, 0).p
				movers[2].cframe = (peniscock.CFrame*CFrame.new(0, -speed/20, -2))*CFrame.Angles(math.rad(-90), 0, 0)
				if plr.Character.Humanoid.Sit ~= true then
					peniscock = nil
				end
			else
				movers={}
				local bp = Instance.new("BodyPosition", plr.Character.LowerTorso)
				local bg = Instance.new("BodyGyro", plr.Character.LowerTorso)
				bp.P = 1e5
				bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
				movers[1], movers[2] = bp, bg
			end
			if control.w then
				peniscock.CFrame = peniscock.CFrame * CFrame.Angles(math.rad(turnSpeed), 0, 0)
			end
			if control.s then
				peniscock.CFrame = peniscock.CFrame * CFrame.Angles(math.rad(-turnSpeed), 0, 0)
			end
			if control.a then
				peniscock.CFrame = peniscock.CFrame * CFrame.Angles(0, 0, math.rad(-turnSpeed))
			end
			if control.d then
				peniscock.CFrame = peniscock.CFrame * CFrame.Angles(0, 0, math.rad(turnSpeed))
			end
		end
		if control.q and speed > 0 then
			speed = speed - 1
		end
		if control.e and speed < 100 then
			speed = speed + 1
		end
	end)

	Mouse.KeyDown:connect(function(KEY)
		local key = KEY:lower()
		if control[key] ~= nil then
			control[key]=true
		end
	end)

	Mouse.KeyUp:connect(function(KEY)
		local key = KEY:lower()
		if control[key] ~= nil then
			control[key]=false
		end
	end)

	game.Workspace.Ignored.ChildAdded:connect(function(child)
		wait()
		if child.Name == "Launcher" and math.abs((child.Position-plr.Character.HumanoidRootPart.Position).Magnitude)<30 then
			plr.Character.Humanoid.Sit = true
			peniscock = child
			child:WaitForChild("BodyVelocity"):Destroy()
			local e = Instance.new("BodyVelocity", child)
			while peniscock and peniscock.Parent ~= nil do
				game.RunService.Stepped:wait()
				e.Velocity = ((child.CFrame * CFrame.new(0, -speed, 0)).p - child.CFrame.p)
			end
			movers[1]:Destroy()
			movers[2]:Destroy()
			movers = nil
		end
	end)
end)
Featured:addButton("RPG Control", function()
	-- SETTINGS --
	local speed = 20
	local turnSpeed = 3
	--------------

	local plr = game.Players.LocalPlayer
	local Mouse = plr:GetMouse()
	local peniscock
	local movers
	local control = {w=false,a=false,s=false,d=false,q=false,e=false}

	game:GetService("RunService").Stepped:connect(function()
		if plr.PlayerGui:FindFirstChild("MainScreenGui") and plr.PlayerGui.MainScreenGui:FindFirstChild("Bar") and plr.PlayerGui.MainScreenGui.Bar:FindFirstChild("Speed") then
			plr.PlayerGui.MainScreenGui.Bar.Speed.bar.Size = UDim2.new(speed / 100 * 0.95, 0, 0.83, 0)
		else
			local c = plr.PlayerGui.MainScreenGui.Bar.HP
			local g = c:Clone()
			g.Name = "Speed"
			g.Position = UDim2.new(0.5, 0, 1, -120)
			g.bar.BackgroundColor3 = Color3.fromRGB(255, 155, 0)
			g.Picture.Image.Image = "rbxassetid://181035717"
			g.TextLabel.Text = "Speed"
			g.Parent = c.Parent
		end
		if peniscock and peniscock.Parent ~= nil then
			setsimulationradius(math.huge^math.huge, math.huge)
			if plr.Character.Humanoid.Sit ~= true then
				peniscock = nil
			end
			peniscock.CFrame = CFrame.lookAt(peniscock.CFrame.p, Mouse.Hit.p)*CFrame.Angles(math.rad(90), 0, 0)
		end
		if control.q and speed > 0 then
			speed = speed - 1
		end
		if control.e and speed < 100 then
			speed = speed + 1
		end
	end)

	Mouse.KeyDown:connect(function(KEY)
		local key = KEY:lower()
		if control[key] ~= nil then
			control[key]=true
		end
	end)

	Mouse.KeyUp:connect(function(KEY)
		local key = KEY:lower()
		if control[key] ~= nil then
			control[key]=false
		end
	end)

	game.Workspace.Ignored.ChildAdded:connect(function(child)
		wait()
		if child.Name == "Launcher" and math.abs((child.Position-plr.Character.HumanoidRootPart.Position).Magnitude)<30 then
			local old = game.Workspace.CurrentCamera.CameraSubject
			plr.Character.Humanoid.Sit = true
			game.Workspace.CurrentCamera.CameraSubject = child
			peniscock = child
			child:WaitForChild("BodyVelocity"):Destroy()
			local e = Instance.new("BodyVelocity", child)
			while peniscock and peniscock.Parent ~= nil do
				game.RunService.Stepped:wait()
				e.Velocity = ((child.CFrame * CFrame.new(0, -speed, 0)).p - child.CFrame.p)
			end
			wait(0.5)
			game.Workspace.CurrentCamera.CameraSubject = old
		end
	end)
end)
Featured:addButton("Burger Galaxy", function()
	local Plr = game.Players.LocalPlayer
	local lastPos = Plr.Character.HumanoidRootPart.CFrame
	local e = 0
	local p = 0
	local a = {}
	repeat
		Plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Hamburger] - $5"].Head.CFrame
		wait(0.5)
		fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Hamburger] - $5"].ClickDetector)
		for i, v in pairs(Plr.Backpack:GetChildren()) do
			if v.Name == "[Hamburger]" then
				e = 0
				for i, v in pairs(a) do
					e = e + 1
				end
				table.insert(a, v)
				v.Parent = Plr.Character
			end
		end
	until e >= 100

	for i, v in pairs(a) do
		local p = (i*0.01)+0.50
		v.GripUp = Vector3.new(0, 1, 0)
		if i <=e/2 then
			v.GripPos = Vector3.new(((p^4)*math.cos(18.5*(math.pi*p)))*40, 0, ((p^4)*math.sin(18.5*(math.pi*p)))*40)
		else
			v.GripPos = Vector3.new(((p^4)*math.cos(18.5*(math.pi*p)))*40, 0, ((p^4)*math.sin(18.5*(math.pi*p)))*40)
		end
	end
	Plr.Character.Humanoid:UnequipTools()
	wait(5)
	for _, burger in pairs(a) do
		burger.Parent = Plr.Character
	end
	Plr.Character.HumanoidRootPart.CFrame = lastPos
end)
Featured:addButton("Burger Shield", function()
	local Plr = game.Players.LocalPlayer
	local e = 0
	local p = 0
	local burgercount = 3
	local a = {}
	local radian = math.pi/burgercount
	repeat
		Plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Hamburger] - $5"].Head.CFrame
		wait(0.5)
		fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Hamburger] - $5"].ClickDetector)
		for i, v in pairs(Plr.Backpack:GetChildren()) do
			if v.Name == "[Hamburger]" then
				e = 0
				for i, v in pairs(a) do
					e = e + 1
				end
				table.insert(a, v)
				v.Parent = Plr.Character
			end
		end
	until e >= burgercount*9
	spawn(function()
		while wait() do
			e = e + 0.01
			if e >= 1 then
				e = -1
			end
		end
	end)
	for i, v in pairs(a) do
		spawn(function()
			while wait() do
				p = 2*(e*math.pi-(radian*i))
				if i <=math.floor(1*burgercount) then
					v.GripPos = Vector3.new(math.sin(p)*5, 0, math.cos(p)*5)
				elseif i <=2*burgercount then
					v.GripPos = Vector3.new(math.sin(p)*5, math.cos(p)*5, 0)
				elseif i <=3*burgercount then
					v.GripPos = Vector3.new(0, math.cos(p)*5, math.sin(p)*5)
				elseif i <=4*burgercount then
					v.GripPos = Vector3.new(math.cos(p)*5, math.sin(p)*5, math.cos(p)*5)
				elseif i <=5*burgercount then
					v.GripPos = Vector3.new(math.cos(p)*5, math.sin(p)*5, -math.cos(p)*5)
				elseif i <=6*burgercount then
					v.GripPos = Vector3.new(math.sin(p)*5, math.cos(p)*5, math.cos(p)*5)
				elseif i <=7*burgercount then
					v.GripPos = Vector3.new(math.sin(p)*5, math.cos(p)*5, -math.cos(p)*5)
				elseif i <=8*burgercount then
					v.GripPos = Vector3.new(math.cos(p)*5, math.cos(p)*5, math.sin(p)*5)
				elseif i <=9*burgercount then
					v.GripPos = Vector3.new(math.cos(p)*5, math.cos(p)*5, math.sin(p)*5)
				end
			end
		end)
	end
	Plr.Character.Humanoid:UnequipTools()
	wait(5)
	for _, burger in pairs(a) do
		burger.Parent = Plr.Character
	end
end)
Featured:addButton("Burger Shield", function()
	local Plr = game.Players.LocalPlayer
	local e = 0
	local p = 0
	local burgercount = 3
	local a = {}
	local radian = math.pi/burgercount
	repeat
		Plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Hamburger] - $5"].Head.CFrame
		wait(0.5)
		fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Hamburger] - $5"].ClickDetector)
		for i, v in pairs(Plr.Backpack:GetChildren()) do
			if v.Name == "[Hamburger]" then
				e = 0
				for i, v in pairs(a) do
					e = e + 1
				end
				table.insert(a, v)
				v.Parent = Plr.Character
			end
		end
	until e >= burgercount*9
	spawn(function()
		while wait() do
			e = e + 0.01
			if e >= 1 then
				e = -1
			end
		end
	end)
	for i, v in pairs(a) do
		spawn(function()
			while wait() do
				p = 2*(e*math.pi-(radian*i))
				if i <=math.floor(1*burgercount) then
					v.GripPos = Vector3.new(math.sin(p)*5, 0, math.cos(p)*5)
				elseif i <=2*burgercount then
					v.GripPos = Vector3.new(math.sin(p)*5, math.cos(p)*5, 0)
				elseif i <=3*burgercount then
					v.GripPos = Vector3.new(0, math.cos(p)*5, math.sin(p)*5)
				elseif i <=4*burgercount then
					v.GripPos = Vector3.new(math.cos(p)*5, math.sin(p)*5, math.cos(p)*5)
				elseif i <=5*burgercount then
					v.GripPos = Vector3.new(math.cos(p)*5, math.sin(p)*5, -math.cos(p)*5)
				elseif i <=6*burgercount then
					v.GripPos = Vector3.new(math.sin(p)*5, math.cos(p)*5, math.cos(p)*5)
				elseif i <=7*burgercount then
					v.GripPos = Vector3.new(math.sin(p)*5, math.cos(p)*5, -math.cos(p)*5)
				elseif i <=8*burgercount then
					v.GripPos = Vector3.new(math.cos(p)*5, math.cos(p)*5, math.sin(p)*5)
				elseif i <=9*burgercount then
					v.GripPos = Vector3.new(math.cos(p)*5, math.cos(p)*5, math.sin(p)*5)
				end
			end
		end)
	end
	Plr.Character.Humanoid:UnequipTools()
	wait(5)
	for _, burger in pairs(a) do
		burger.Parent = Plr.Character
	end
end)
Featured:addButton("Chicken Galaxy", function()
	local Plr = game.Players.LocalPlayer
	local lastPos = Plr.Character.HumanoidRootPart.CFrame
	local e = 0
	local p = 0
	local a = {}
	repeat
		Plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Chicken] - $7"].Head.CFrame
		wait(0.5)
		fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Chicken] - $7"].ClickDetector)
		for i, v in pairs(Plr.Backpack:GetChildren()) do
			if v.Name == "[Hamburger]" then
				e = 0
				for i, v in pairs(a) do
					e = e + 1
				end
				table.insert(a, v)
				v.Parent = Plr.Character
			end
		end
	until e >= 100

	for i, v in pairs(a) do
		local p = (i*0.01)+0.50
		v.GripUp = Vector3.new(0, 1, 0)
		if i <=e/2 then
			v.GripPos = Vector3.new(((p^4)*math.cos(18.5*(math.pi*p)))*40, 0, ((p^4)*math.sin(18.5*(math.pi*p)))*40)
		else
			v.GripPos = Vector3.new(((p^4)*math.cos(18.5*(math.pi*p)))*40, 0, ((p^4)*math.sin(18.5*(math.pi*p)))*40)
		end
	end
	Plr.Character.Humanoid:UnequipTools()
	wait(5)
	for _, burger in pairs(a) do
		burger.Parent = Plr.Character
	end
	Plr.Character.HumanoidRootPart.CFrame = lastPos
end)
Featured:addButton("Galaxy", function()
	local Plr = game.Players.LocalPlayer
	local lastPos = Plr.Character.HumanoidRootPart.CFrame
	local e = 100
	local a, g = {}, {}

	repeat
		Plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Hamburger] - $5"].Head.CFrame
		wait(0.5)
		fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Hamburger] - $5"].ClickDetector)
		for i, v in pairs(Plr.Backpack:GetChildren()) do
			if v.Name == "[Hamburger]" then
				table.insert(a, v)
				v.Parent = Plr.Character
			end
		end
	until #a >= e/2

	repeat
		Plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Chicken] - $7"].Head.CFrame
		wait(0.5)
		fireclickdetector(game.Workspace.Ignored.Shop["[Chicken] - $7"].ClickDetector)
		for i, v in pairs(Plr.Backpack:GetChildren()) do
			if v.Name == "[Chicken]" then
				table.insert(g, v)
				v.Parent = Plr.Character
			end
		end
	until #g >= e/2

	for i, v in pairs(a) do
		local p = (i*0.01)+0.50
		v.GripUp = Vector3.new(0, 1, 0)
		v.GripPos = Vector3.new(((p^4)*math.cos(18.5*(math.pi*p)))*40, 0, ((p^4)*math.sin(18.5*(math.pi*p)))*40)
	end

	for i, v in pairs(g) do
		local p = (i*0.01)+0.50
		v.GripUp = Vector3.new(0, 1, 0)
		v.GripPos = Vector3.new(-((p^4)*math.cos(18.5*(math.pi*p)))*40, 0, -((p^4)*math.sin(18.5*(math.pi*p)))*40)
	end

	Plr.Character.Humanoid:UnequipTools()
	wait(5)
	for _, burger in pairs(a) do
		burger.Parent = Plr.Character
	end
	for _, chicken in pairs(g) do
		chicken.Parent = Plr.Character
	end
	Plr.Character.HumanoidRootPart.CFrame = lastPos
end)
Featured:addButton("Super Taser", function()
	function TAZE(TARGET)
		local Plr = game.Players.LocalPlayer
		local a = {}
		repeat
			Plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Taser] - $1000"].Head.CFrame
			wait(0.5)
			fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Taser] - $1000"].ClickDetector)
			for i, v in pairs(Plr.Backpack:GetChildren()) do
				if v.Name == "[Taser]" then
					table.insert(a, v)
					v.Parent = Plr.Character
				end
			end
		until #a >= 12
		local moooovr = Instance.new("BodyPosition", Plr.Character.LowerTorso)
		local gyro = Instance.new("BodyGyro", Plr.Character.LowerTorso)
		gyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
		moooovr.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		moooovr.P = 1e5
		moooovr.Position = (TARGET.Character.UpperTorso.CFrame*CFrame.new(0, -3, -2)).p
		gyro.cframe = TARGET.Character.UpperTorso.CFrame
		local enabled = true
		wait(0.5)
		for i, v in next, a do
			v.GripPos = Vector3.new(2*math.cos(math.rad(i*30)), 0, 2*math.sin(math.rad(i*30)))
			v.Handle.ChildAdded:connect(function(c)
				if not enabled then return end
				local moov = Instance.new("BodyPosition", c)
				moov.P = 1e5
				moov.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				while c.Parent ~= nil do
					moov.Position = TARGET.Character.Head.CFrame.p
					game.RunService.Stepped:wait()
					setsimulationradius(math.huge^math.huge, math.huge)
				end
				moov:Destroy()
				v:Deactivate()
			end)
			v:Activate()
		end
		pcall(function()
			repeat wait() 
				moooovr.Position = (TARGET.Character.UpperTorso.CFrame*CFrame.new(0, 0, 2)).p
				gyro.cframe = TARGET.Character.UpperTorso.CFrame
			until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.V)
		end)
		gyro:Destroy()
		moooovr:Destroy()
		enabled = false
	end

	local Screen = Instance.new("ScreenGui", game.CoreGui)
	local main = Instance.new("Frame", Screen)
	main.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
	main.Size = UDim2.new(0, 141, 0, 32)
	main.Position = UDim2.new(0.43, 0, 0.438, 0)
	main.Active = true
	main.Draggable = true
	Instance.new("UICorner", main)
	local box = Instance.new("TextBox", main)
	box.Text = ""
	box.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
	box.BorderSizePixel = 0
	box.Size = UDim2.new(0, 102, 0, 14)
	box.Position = UDim2.new(0.135, 0, 0.281, 0)
	box.PlaceholderText = "Username"
	local scroll = Instance.new("ScrollingFrame", box)
	scroll.BorderSizePixel = 0
	scroll.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
	scroll.Size = UDim2.new(1, 0, 0, 90)
	scroll.Position = UDim2.new(0, 0, 1, 0)
	scroll.Visible = false

	local players = game:GetService("Players")
	box.Focused:Connect(function()
		scroll.Visible = true
		local text = box.Text
		local sorted = {}
		spawn(function()
			while scroll.Visible do wait()
				if text ~= box.Text then
					for i, v in next, scroll:GetChildren() do
						v:Destroy()
					end
					text = box.Text
					sorted = {}
					local enabled
					repeat
						local current = #sorted + 1
						enabled = false
						local best = math.huge
						for i, v in next, players:GetPlayers() do
							if string.find(v.Name:lower(), text:lower()) then
								local c, h = string.find(v.Name:lower(), text:lower())
								local m = #v.Name -(h-c)						
								if m<=best and not table.find(sorted, v) then
									enabled = true
									best = m
									sorted[current] = v
								end
							end
						end
					until not enabled
					for ii, vv in next, sorted do
						local b = Instance.new("TextButton", scroll)
						b.BackgroundTransparency = 1
						b.Text = vv.Name
						b.Size = UDim2.new(0.8, 0, 0, 20)
						b.Position = UDim2.new(0.1, 0, 0, (20*ii)-15)
						b.MouseButton1Click:connect(function()
							print("GHGHGHGHGHG", vv)
							sorted[1] = vv
						end)
					end
				end
			end
		end)
		box.FocusLost:wait()
		wait()
		scroll.Visible = false
		if sorted[1] then
			TAZE(sorted[1])
		end
	end)
end)
Featured:addButton("Auto Control Player", function()
	-- SETTINGS --
	local speed = 20
	local turnSpeed = 3
	--------------

	local plr = game.Players.LocalPlayer
	local Mouse = plr:GetMouse()
	local peniscock
	local movers
	local control = {q=false,e=false,w=false,a=false,s=false,d=false}

	game:GetService("RunService").Stepped:connect(function()
		if plr.PlayerGui:FindFirstChild("MainScreenGui") and plr.PlayerGui.MainScreenGui:FindFirstChild("Bar") and plr.PlayerGui.MainScreenGui.Bar:FindFirstChild("Speed") then
			plr.PlayerGui.MainScreenGui.Bar.Speed.bar.Size = UDim2.new(speed / 100 * 0.95, 0, 0.83, 0)
		else
			local c = plr.PlayerGui.MainScreenGui.Bar.HP
			local g = c:Clone()
			g.Name = "Speed"
			g.Position = UDim2.new(0.5, 0, 1, -120)
			g.bar.BackgroundColor3 = Color3.fromRGB(255, 155, 0)
			g.Picture.Image.Image = "rbxassetid://181035717"
			g.TextLabel.Text = "Speed"
			g.Parent = c.Parent
		end
		if peniscock and peniscock.Parent ~= nil then
			setsimulationradius(math.huge^math.huge, math.huge)
			if plr.Character.Humanoid.Sit ~= true then
				peniscock = nil
			end
			peniscock.BodyGyro.cframe = game.Workspace.CurrentCamera.CoordinateFrame
			local vel = CFrame.new(0, 0, 0)
			if control.w then
				vel = vel * CFrame.new(0, 0, -speed)
			end
			if control.s then
				vel = vel * CFrame.new(0, 0, speed)
			end
			if control.a then
				vel = vel * CFrame.new(-speed,0, 0)
			end
			if control.d then
				vel = vel * CFrame.new(speed, 0, 0)
			end
			peniscock.BodyVelocity.Velocity = ((peniscock.CFrame * vel).p - peniscock.CFrame.p)
		end
		if control.q and speed > 0 then
			speed = speed - 1
		end
		if control.e and speed < 100 then
			speed = speed + 1
		end
	end)

	Mouse.KeyDown:connect(function(KEY)
		local key = KEY:lower()
		if control[key] ~= nil then
			control[key]=true
		end
	end)

	Mouse.KeyUp:connect(function(KEY)
		local key = KEY:lower()
		if control[key] ~= nil then
			control[key]=false
		end
	end)

	function poop(e, i)
		spawn(function()
			local v = i or e
			if v ~= plr then
				local function doshit(Char)
					Char:WaitForChild("BodyEffects"):WaitForChild("K.O").Changed:connect(function(bool)
						if (not bool) or peniscock then return end
						local child = Char:WaitForChild("Head")
						local old = game.Workspace.CurrentCamera.CameraSubject
						plr.Character:WaitForChild("Humanoid").Sit = true
						game.Workspace.CurrentCamera.CameraSubject = child
						peniscock = child
						local b = {Instance.new("BodyVelocity", child), Instance.new("BodyGyro", child)}
						b[1].MaxForce = Vector3.new(math.huge, math.huge, math.huge)
						b[1].P = 1e5
						b[2].MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
						while Char.BodyEffects["K.O"].Value and peniscock == child do
							game.RunService.Stepped:wait()
						end
						wait(0.5)
						peniscock = nil
						game.Workspace.CurrentCamera.CameraSubject = old
						b[1]:Destroy()
						b[2]:Destroy()
					end)
				end
				doshit(v.Character or v.CharacterAdded:wait())
				v.CharacterAdded:connect(doshit)
			end
		end)    
	end
	table.foreach(game.Players:GetPlayers(), poop)
	game.Players.PlayerAdded:connect(poop)
end)
Featured:addButton("Select Control Player", function()
	-- SETTINGS --
	local speed = 20
	local turnSpeed = 3
	--------------

	local plr = game.Players.LocalPlayer
	local Mouse = plr:GetMouse()
	local peniscock
	local movers
	local control = {q=false,e=false,w=false,a=false,s=false,d=false}

	game:GetService("RunService").Stepped:connect(function()
		if plr.PlayerGui:FindFirstChild("MainScreenGui") and plr.PlayerGui.MainScreenGui:FindFirstChild("Bar") and plr.PlayerGui.MainScreenGui.Bar:FindFirstChild("Speed") then
			plr.PlayerGui.MainScreenGui.Bar.Speed.bar.Size = UDim2.new(speed / 100 * 0.95, 0, 0.83, 0)
		else
			local c = plr.PlayerGui.MainScreenGui.Bar.HP
			local g = c:Clone()
			g.Name = "Speed"
			g.Position = UDim2.new(0.5, 0, 1, -120)
			g.bar.BackgroundColor3 = Color3.fromRGB(255, 155, 0)
			g.Picture.Image.Image = "rbxassetid://181035717"
			g.TextLabel.Text = "Speed"
			g.Parent = c.Parent
		end
		if peniscock and peniscock.Parent ~= nil then
			setsimulationradius(math.huge^math.huge, math.huge)
			if plr.Character.Humanoid.Sit ~= true then
				peniscock = nil
			end
			peniscock.BodyGyro.cframe = game.Workspace.CurrentCamera.CoordinateFrame
			local vel = CFrame.new(0, 0, 0)
			if control.w then
				vel = vel * CFrame.new(0, 0, -speed)
			end
			if control.s then
				vel = vel * CFrame.new(0, 0, speed)
			end
			if control.a then
				vel = vel * CFrame.new(-speed,0, 0)
			end
			if control.d then
				vel = vel * CFrame.new(speed, 0, 0)
			end
			peniscock.BodyVelocity.Velocity = ((peniscock.CFrame * vel).p - peniscock.CFrame.p)
		end
		if control.q and speed > 0 then
			speed = speed - 1
		end
		if control.e and speed < 100 then
			speed = speed + 1
		end
	end)

	Mouse.KeyDown:connect(function(KEY)
		local key = KEY:lower()
		if control[key] ~= nil then
			control[key]=true
		end
	end)

	Mouse.KeyUp:connect(function(KEY)
		local key = KEY:lower()
		if control[key] ~= nil then
			control[key]=false
		end
	end)

	local screen = Instance.new("ScreenGui", game.CoreGui)
	local frame = Instance.new("Frame" , screen)
	frame.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
	frame.Size = UDim2.new(0, 141, 0, 32)
	frame.Position = UDim2.new(0.143, 0, 0.438, 0)
	frame.Active = true
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
	local button = Instance.new("TextButton", frame)
	button.Text = "HOE"
	button.Size = UDim2.new(0, 102, 0, 14)
	button.Position = UDim2.new(0.135, 0, 0.281, 0)
	button.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
	button.BorderSizePixel = 0
	local scroll = Instance.new("ScrollingFrame", button)
	scroll.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
	scroll.BorderSizePixel = 0
	scroll.Position = UDim2.new(0, 0, 1, 0)
	scroll.Size = UDim2.new(1, 0, 0, 90)
	scroll.Visible = false

	button.MouseButton1Click:Connect(function()
		if scroll.Visible then scroll.Visible = false return end
		scroll.Visible = true
		for ii, vv in next, game.Players:GetPlayers() do
			scroll.CanvasSize = UDim2.new(0, 0, 0, (20*ii)-15)
			local b = Instance.new("TextButton", scroll)
			b.BackgroundTransparency = 0.7
			b.BorderSizePixel = 0
			b.Text = vv.Name
			b.Size = UDim2.new(0.8, 0, 0, 18)
			b.Position = UDim2.new(0.1, 0, 0, (20*ii)-15)
			local candoshit = false
			b.MouseButton1Click:connect(function()
				if (not candoshit) or peniscock then return end
				local Char = vv.Character
				local child = Char:WaitForChild("Head")
				plr.Character:WaitForChild("Humanoid").Sit = true
				game.Workspace.CurrentCamera.CameraSubject = child
				peniscock = child
				local m = {Instance.new("BodyVelocity", child), Instance.new("BodyGyro", child)}
				m[1].MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				m[1].P = 1e5
				m[2].MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
				while Char.BodyEffects["K.O"].Value and peniscock == child do
					game.RunService.Stepped:wait()
				end
				wait(0.5)
				peniscock = nil
				game.Workspace.CurrentCamera.CameraSubject = plr.Character.Humanoid
				m[1]:Destroy()
				m[2]:Destroy()
			end)
			spawn(function()
				button.MouseButton1Click:wait()
				b:Destroy()
			end)
			spawn(function()
				while b do wait()
					if (vv.Character or vv.CharacterAdded:wait()):WaitForChild("BodyEffects"):WaitForChild("K.O").Value then
						candoshit = true
						b.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
					else
						candoshit = false
						b.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
					end
				end
			end)
		end
	end)
end)
Featured:addButton("Kill Godmoded Players", function()
	game:GetService"RunService".Stepped:connect(function() setsimulationradius(math.huge) end)

	local Run = false

	local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
	local Toolbar = Instance.new("Frame", ScreenGui)
	local Background = Instance.new("Frame", Toolbar)
	local Name = Instance.new("TextLabel", Toolbar)
	local LoopTp = Instance.new("TextButton", Toolbar)
	local Name_Box = Instance.new("TextBox", LoopTp)
	local Plr = game.Players.LocalPlayer

	Toolbar.Name = "Toolbar"
	Toolbar.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
	Toolbar.Position = UDim2.new(0.02541296, 0, 0.163390666, 0)
	Toolbar.Size = UDim2.new(0, 269, 0, 34)
	Toolbar.Active = true
	Toolbar.Draggable = true

	Background.Name = "Background"
	Background.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
	Background.BackgroundTransparency = 0.500
	Background.Position = UDim2.new(0, 0, 0.986920536, 0)
	Background.Size = UDim2.new(0, 268, 0, 72)

	Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Name.BackgroundTransparency = 1.000
	Name.Position = UDim2.new(0.00371747208, 0, 0, 0)
	Name.Size = UDim2.new(0, 268, 0, 34)
	Name.Font = Enum.Font.SourceSans
	Name.Text = "god killer"
	Name.TextColor3 = Color3.fromRGB(255, 255, 255)
	Name.TextScaled = true
	Name.TextSize = 14.000
	Name.TextWrapped = true

	LoopTp.Name = "tpon"
	LoopTp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LoopTp.BackgroundTransparency = 1.000
	LoopTp.Position = UDim2.new(0, 0, 1, 0)
	LoopTp.Size = UDim2.new(0, 268, 0, 36)
	LoopTp.Font = Enum.Font.Gotham
	LoopTp.Text = "Kill"
	LoopTp.TextColor3 = Color3.fromRGB(255, 255, 255)
	LoopTp.TextSize = 20.000

	Name_Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Name_Box.BackgroundTransparency = 1.000 
	Name_Box.Position = UDim2.new(0, 0, 1, 0)
	Name_Box.Size = UDim2.new(0, 268, 0, 36)
	Name_Box.Font = Enum.Font.Gotham
	Name_Box.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
	Name_Box.PlaceholderText = "Username"
	Name_Box.Text = ""
	Name_Box.TextColor3 = Color3.fromRGB(255, 255, 255)
	Name_Box.TextSize = 20.000

	LoopTp.MouseButton1Click:Connect(function()
		local victm
		for i, v in next, game.Players:GetPlayers() do
			if string.find(v.Name:lower(), Name_Box.Text:lower()) then
				victm = v
			end
		end
		if not victm then print("Invalid name") return end
		local bike
		local lastpos = Plr.Character.HumanoidRootPart.CFrame
		repeat wait()
			for i, v in next, game.Workspace.Vehicles:GetChildren() do
				bike = v
			end
			if not bike then
				Plr.Character.HumanoidRootPart.CFrame = CFrame.new(-822.521179, 21.9978294, -547.607056)
				wait(1)
				fireclickdetector(game:GetService("Workspace").Ignored.Shop["[SoloBike] - $25"].ClickDetector)
			end
		until bike

		for i, v in next, game.Workspace.Vehicles:GetChildren() do
			spawn(function()
				while v:FindFirstChild("Wheel") do wait()
					v:FindFirstChild("Wheel"):Destroy()
				end
				local Pos = Instance.new("BodyPosition", v.Root)
				Pos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				Pos.P = 1e4
				while victm.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Seated do wait()
					Plr.Character.HumanoidRootPart.CFrame = CFrame.new(Pos.Parent.Position + Vector3.new(0, -3, 0))
					Pos.Position = victm.Character.HumanoidRootPart.Position
					Plr.Character.Humanoid:ChangeState(3)
				end
				Plr.Character.HumanoidRootPart.CFrame = lastpos
				Pos.Position = Vector3.new(0, -800, 0)
			end)
		end
	end)
end)
Featured:addButton("Fake Mod Menu", function()
	wait()
	local UserInputService = game:GetService("UserInputService")
	local ScreenGui = Instance.new("ScreenGui", game.CoreGui) ScreenGui.Name = "Drxco's Menu"
	local Frame = Instance.new("Frame", ScreenGui)
	local Main = Instance.new("ScrollingFrame", ScreenGui)
	Main.Size = UDim2.new(0.3, 0, 0.4, 0)
	Main.Position = UDim2.new(0.65, 0, 0.2, 0)
	ScreenGui.Parent = nil
	local MainEvent = game.ReplicatedStorage.MainEvent
	local CurrentCamera = workspace.CurrentCamera
	local Plr = game.Players.LocalPlayer
	function enableGUI()
		local v5 = 0
		local players = game.Players:GetChildren()

		table.sort(players, function(p1, p2)
			return p1:GetFullName() < p2:GetFullName()
		end)

		local v7, v8, v9 = pairs(players)
		while true do
			local v10, Target = v7(v8, v9)
			if not v10 then
				break
			end
			v9 = v10

			local v12 = Instance.new("TextButton")
			v12.Size = UDim2.new(0.25, 0, 0, 45)
			v12.Position = UDim2.new(0, 0, 0, v5 * 50)
			v12.BackgroundColor3 = BrickColor.Red().Color
			v12.Text = Target.Name
			v12.TextScaled = true
			v12.Parent = Main

			local View = v12:Clone()
			View.Text = "Spectate"
			View.Position = UDim2.new(0.75, 0, 0, v5 * 50)
			View.Size = UDim2.new(0.25, 0, 0, 45)
			View.BackgroundColor3 = BrickColor.White().Color
			View.Parent = Main

			local v14 = v12:Clone()
			v14.Size = UDim2.new(0.25, 0, 0, 45)
			v14.Position = UDim2.new(0.25, 0, 0, v5 * 50)
			v14.BackgroundColor3 = BrickColor.Green().Color
			v14.Text = "UnBan"
			v14.Parent = Main

			local v15 = Instance.new("TextBox")
			v15.Size = UDim2.new(0.25, 0, 0, 45)
			v15.Position = UDim2.new(0.5, 0, 0, v5 * 50)
			v15.Text = "Ban/UnBan Note Here"
			v15.Font = v12.Font
			v15.TextScaled = true
			v15.Parent = Main

			v5 = v5 + 1
			local u4 = false
			v12.MouseButton1Click:connect(function()
				if u4 == false then
					u4 = true
					MainEvent:FireServer("BANREMOTE", Target, v15.Text)
					wait(0.5)
					u4 = false
				end
			end)

			v14.MouseButton1Click:connect(function()
				MainEvent:FireServer("UNBANREMOTE", Target, v15.Text)
			end)

			View.MouseButton1Click:connect(function()
				CurrentCamera.CameraSubject = Target.Character.Humanoid
			end)	
		end
		Main.CanvasSize = UDim2.new(0, 0, 0, v5 * 50)
		ScreenGui.Parent = game.CoreGui
	end

	enableGUI()
	Frame.FindServer.MouseButton1Click:connect(function()
		MainEvent:FireServer("FindServer", Frame.PlayerName.Text)
	end)
	Frame.JoinServer.MouseButton1Click:connect(function()
		MainEvent:FireServer("JoinServer", Frame.ServerId.Text)
	end)
	local u5 = false
	UserInputService.InputBegan:connect(function(p3, p4)
		if not p4 and p3.UserInputType == Enum.UserInputType.Keyboard and p3.KeyCode == Enum.KeyCode.B and u5 == false then
			u5 = true
			if ScreenGui.Parent == nil then
				enableGUI()
			else
				ScreenGui.Parent = nil
				for v16, v17 in pairs(Main:GetChildren()) do
					v17:Destroy()
				end
			end
			wait(0.2)
			u5 = false
		end
	end)
	local v18 = {}
	while wait() do
		if ScreenGui.Parent == Plr.PlayerGui then
			for v19 = #v18, 1, -1 do
				v18[v19]:Destroy()
				table.remove(v18, v19)
			end
			for v20, v21 in pairs(game.Players:GetChildren()) do
				pcall(function()
					local l__Character__22 = v21.Character
					if CurrentCamera.CFrame.lookVector:Dot((l__Character__22.LowerTorso.Position - CurrentCamera.CFrame.p).unit) > 0 then
						local v23 = CurrentCamera:WorldToScreenPoint(l__Character__22.UpperTorso.Position)
						local v24 = Instance.new("TextLabel")
						v24.Name = l__Character__22.Name
						local v25 = game.Players:GetPlayerFromCharacter(l__Character__22)
						v24.Text = l__Character__22.Name
						v24.TextSize = 20
						v24.Font = Enum.Font.ArialBold
						v24.TextColor3 = (CurrentCamera.CFrame.p - l__Character__22.LowerTorso.Position).magnitude < 75 and Color3.fromRGB(137, 211, 205) or Color3.new(1, 0, 0)
						v24.Position = UDim2.new(0, v23.x, 0, v23.y)
						v24.Parent = ScreenGui
						table.insert(v18, v24)
					end
				end)
			end
		end
	end
end)
Featured:addButton("Item Spammer", function()
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if v.Name == "" then
			v.Parent = game.Players.LocalPlayer.Character
			spawn(function()
				while wait() do
					v:Deactivate()
					wait(0.1)
					v:Deactivate()
				end
			end)
		end
	end
end)
Featured:addButton("Grenade Galaxy", function()
	local Plr = game.Players.LocalPlayer
	local lastPos = Plr.Character.HumanoidRootPart.CFrame
	local e = 0
	local p = 0
	local a = {}
	repeat
		Plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Grenade] - $700"].Head.CFrame
		wait(0.5)
		fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Grenade] - $700"].ClickDetector)
		for i, v in pairs(Plr.Backpack:GetChildren()) do
			if v.Name == "[Grenade]" then
				e = 0
				for i, v in pairs(a) do
					e = e + 1
				end
				table.insert(a, v)
				v.Parent = Plr.Character
			end
		end
	until e >= 100

	for i, v in pairs(a) do
		local p = (i*0.01)+0.50
		v.GripUp = Vector3.new(0, 1, 0)
		if i <=e/2 then
			v.GripPos = Vector3.new(((p^4)*math.cos(18.5*(math.pi*p)))*40, 0, ((p^4)*math.sin(18.5*(math.pi*p)))*40)
		else
			v.GripPos = Vector3.new(((p^4)*math.cos(18.5*(math.pi*p)))*40, 0, ((p^4)*math.sin(18.5*(math.pi*p)))*40)
		end
	end
	Plr.Character.Humanoid:UnequipTools()
	wait(5)
	for _, burger in pairs(a) do
		burger.Parent = Plr.Character
	end
	Plr.Character.HumanoidRootPart.CFrame = lastPos
end)
Featured:addButton("Grenade Mouse", function()
	local Mouse = game.Players.LocalPlayer:GetMouse()
	game.Workspace.Ignored.ChildAdded:connect(function(child)
		if child.Name == "Handle" then
			local b = Instance.new("BodyPosition", child)
			b.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			b.P = 1e5
			while child and child.Parent ~= nil do
				setsimulationradius(math.huge^math.huge, math.huge)
				b.Position = Mouse.Hit.p
				game.RunService.Stepped:wait()
			end
		end
	end)
end)
Featured:addButton("Kill All", function()
	local plr = game.Players.LocalPlayer
	local lastpos = plr.Character.HumanoidRootPart.CFrame
	local playercount local greadecount local pp = {}
	local cock = true
	for I in pairs(game.Players:GetPlayers()) do
		playercount = I
	end

	game:GetService("RunService").Stepped:connect(function()
		setsimulationradius(math.huge)
	end)

	spawn(function()
		while cock do wait()
			for i, v in pairs(game.Workspace.Ignored:GetChildren()) do
				if v.Name == "Handle" then
					for index in pairs(pp) do
						table.insert(pp, v)
					end
					v.Name = tostring(i)
				end
			end
		end
	end)

	repeat wait()
		plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Grenade] - $700"].Head.CFrame
		fireclickdetector(game.Workspace.Ignored.Shop["[Grenade] - $700"].ClickDetector)
		for ii, vv in pairs(plr.Backpack:GetChildren()) do
			grenadecount = ii
		end
	until grenadecount >= playercount
	plr.Character.HumanoidRootPart.CFrame = lastpos

	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		spawn(function()
			if v.Name == "[Grenade]" then
				v.Parent = plr.Character v:Activate() wait(0.1) v:Deactivate() wait(0.1) v:Activate()
			end
		end)
	end

	for i, v in pairs(game.Players:GetPlayers()) do
		if v ~= plr then
			local mover = Instance.new("BodyPosition", pp[1])
			mover.P = 1e5
			table.remove(pp, 1)
			spawn(function()
				while wait() do
					mover.Position = v.Character.HumanoidRootPart.Position
				end
			end)
		end
	end
	cock = false
end)
Featured:addButton("Arrest All", function()
	wait(0.5) if _G.AutoArrest == false or game.PlaceId ~= 2788229376 then return else repeat wait() until game.Players.LocalPlayer end

	wait(15)
	for i, v in next, game.Workspace:GetDescendants() do
		if v:IsA("Seat") then
			v:Destroy()
		end
	end
	local Plr = game.Players.LocalPlayer

	function serverhop()
		print("PENIS")
		Plr:Destroy()
		local x = {}
		for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
			if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
				x[#x + 1] = v.id
			end
		end
		if #x > 0 then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
		end
	end

	spawn(function()
		wait(300)
		serverhop()
	end)

	game:GetService("RunService").Stepped:connect(function()
		Plr.Character.Humanoid:ChangeState(11)
	end)
	Plr.CharacterAdded:Connect(function(character)
		repeat wait() until character:FindFirstChild("FULLY_LOADED_CHAR")
		e(character)
	end)
	function e(character)
		for i, v in pairs(game.Workspace.Ignored.ItemsDrop:GetChildren()) do
			if v:FindFirstChild("[Knife]") and Plr.Character:FindFirstChild("[Knife]") == nil and Plr.Backpack:FindFirstChild("[Knife]") == nil then
				Plr.Character.HumanoidRootPart.CFrame = v.CFrame
				wait(1)
			end
		end
		for i, v in pairs(character:GetChildren()) do
			if v:FindFirstChild("LocalScript") then
				v:Destroy()
			end
		end
	end
	e(Plr.character)
	local target
	while wait() do
		target = nil
		local highest = 0
		for i, v in pairs(game.Players:GetPlayers()) do
			if v:FindFirstChild("DataFolder") and v.Character:FindFirstChild("FULLY_LOADED_CHAR") and v.Character.BodyEffects:FindFirstChild("Defense") and tonumber(v.DataFolder.Information.Wanted.Value) > 500 and tonumber(v.DataFolder.Information.Wanted.Value) >= highest and v.Character.BodyEffects:FindFirstChild("Armor") then
				target = v 
				highest = tonumber(v.DataFolder.Information.Wanted.Value)
			end
		end
		if not target then serverhop() end
		local e = true
		local penis = 0
		local bagged = false
		local A = false
		spawn(function() pcall(function()
				while bagged == false do
					if target and target.Character and target.Character:FindFirstChild("Christmas_Sock") == nil and penis <= 5 and Plr.Character.Humanoid.Health > 80 then
						if Plr.Backpack:FindFirstChild("[BrownBag]") == nil then
							A = false
							pcall(function()
								repeat wait()
									Plr.character.HumanoidRootPart.CFrame = CFrame.new(-316.034454, 48.2788467, -723.860474, 0.983254969, -0.000297372608, -0.182234928, 0.000218386791, 0.999999881, -0.000453495246, 0.182235047, 0.000406103791, 0.98325491)
									fireclickdetector(game:GetService("Workspace").Ignored.Shop["[BrownBag] - $25"].ClickDetector)
								until Plr.Backpack:FindFirstChild("[BrownBag]") ~= nil
							end)
							A = true
						end
						Plr.Character.Humanoid:EquipTool(Plr.Backpack["[BrownBag]"])
						Plr.Character["[BrownBag]"]:Activate()
						penis = penis + 1
					elseif penis >= 2 or target.Character:FindFirstChild("Christmas_Sock") or not target then
						bagged = true
					end
					wait(3)
				end
			end) end)
		spawn(function()
			while e do wait()
				pcall(function()
					if Plr.Character.Humanoid.Health > 80 then
						if not target.Character.BodyEffects["K.O"].Value then
							if A then
								Plr.Character.HumanoidRootPart.CFrame = CFrame.new(target.Character.UpperTorso.Position + Vector3.new(0, -5, 0))
							end
						else
							Plr.Character.HumanoidRootPart.CFrame = target.Character.UpperTorso.CFrame
						end
					else
						Plr.Character.HumanoidRootPart.CFrame = CFrame.new(0, 999, 0)
						if Plr.Character:FindFirstChild("[Chicken]") == nil or Plr.Backpack:FindFirstChild("[Chicken]") == nil then
							Plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Chicken] - $7"].Head.CFrame
							wait(0.5)
							fireclickdetector(game.Workspace.Ignored.Shop["[Chicken] - $7"].ClickDetector)
						end
						pcall(function()Plr.Character.Humanoid:EquipTool(Plr.Backpack["[Chicken]"])end)
						pcall(function()
							Plr.Character["[Chicken]"]:Activate()
							wait(0.1)
							Plr.Character["[Chicken]"]:Deactivate()
						end)
					end
				end)
			end
		end)
		repeat wait() until bagged
		pcall(function()
			repeat wait()
				repeat wait()
					pcall(function()
						if Plr.Character.Humanoid.Health > 80 then
							pcall(function()Plr.Character.Humanoid:EquipTool(Plr.Backpack["[Knife]"])end)
							wait(0.1)
							Plr.Character["[Knife]"].GripPos = Vector3.new(0, 5, 0)
							Plr.Character["[Knife]"].Handle.Size = Vector3.new(20, 20, 20)
							Plr.Character["[Knife]"]:Activate()
							wait(2)
							Plr.Character["[Knife]"]:Deactivate()
							wait(1)
						end
					end)
				until not target or target.Character.BodyEffects["K.O"].Value or game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.V)
				repeat wait() 
					if Plr.Character.Humanoid.Health > 80 then
						pcall(function()Plr.Character.Humanoid:EquipTool(Plr.Backpack.Cuff)end)
						pcall(function()
							Plr.Character.Cuff:Activate()
							wait(0.1)
							Plr.Character.Cuff:Deactivate()
						end)
					end
				until not target.Character.BodyEffects["K.O"].Value or game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.V)
			until tonumber(target.DataFolder.Information.Wanted.Value) == 0 or game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.V)
		end)
		e = false
	end
end)
Featured:addButton("Fast RPG", function()
	-- SETTINGS --
	local speed = 200 -- noob
	--------------

	local plr = game.Players.LocalPlayer

	game.Workspace.Ignored.ChildAdded:connect(function(child)
		wait()
		if child.Name == "Launcher" and math.abs((child.Position-plr.Character.HumanoidRootPart.Position).Magnitude)<30 then
			child:WaitForChild("BodyVelocity"):Destroy()
			Instance.new("BodyVelocity", child).Velocity = (child.CFrame * CFrame.new(0, -speed, 0)).p - child.CFrame.p
			while child and child.Parent ~= nil do
				game.RunService.Stepped:wait()
				setsimulationradius(math.huge^math.huge, math.huge)
			end
		end
	end)

end)
Featured:addButton("Super Tool Reach", function()
	local Plr = game.Players.LocalPlayer
	for i,v in pairs(Plr.Character:GetChildren()) do
		if v:IsA("Tool") then
			if v.Name ~= "Combat" then
				local pp = v.Handle
				v.TextureId = 0
				if v.Name ~= "[SledgeHammer]" and v.Name ~= "[StopSign]" then
					pp.MeshId = 0
					pp.Transparency = 1
				elseif v.Name == "[SledgeHammer]" then v.Part:Destroy() wait(0.1) v.Part:Destroy()
				elseif v.Name == "[StopSign]" then v.Sign:Destroy() end

				pp.Size = Vector3.new(50, 50, 50)
				print(v)
				Plr.Character.Humanoid:UnequipTools()
				local tooloutline = Instance.new("SelectionBox",v.Handle)
				tooloutline.Adornee = pp
			else 
				for i,v in ipairs(Plr.Character:GetDescendants()) do
					if v:IsA("MeshPart") then v.Massless = true
						v.CanCollide = false
						v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
					end
				end

				for i,v in ipairs(game.workspace:GetDescendants()) do
					if v:IsA("Seat") then 
						v:Destroy()
					end
				end

				Plr.Character.RightHand.Size = Vector3.new(35, 35, 35)
				Plr.Character.RightHand.Transparency = 1

				game:GetService("RunService").Stepped:connect(function()
					if Plr.Character:FindFirstChild("Combat") and not Plr.Character.RightHand:FindFirstChild("ppsuc") then
						local HandHitBox = Instance.new("SelectionBox",Plr.Character.RightHand)
						HandHitBox.Adornee = Plr.Character.RightHand
						HandHitBox.Name = "ppsuc"
					elseif not Plr.Character:FindFirstChild("Combat") and Plr.Character.RightHand:FindFirstChild("ppsuc") then
						Plr.Character.RightHand.ppsuc:Destroy()
					end
				end)
			end
		end
	end
end)
Featured:addButton("Super Gun", function()
	local sucess = nil
	while wait(0.5) do
		for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:FindFirstChild("Ammo") and v.Ammo.Value ~= 0 then
				v.Parent = game.Players.LocalPlayer.Character
			end
		end
		for ii, vv in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if vv:FindFirstChild("Ammo") and vv.Ammo.Value == 0 then
				game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
			end
		end
		for iii, vvv in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if vvv:FindFirstChild("Ammo") and vvv.Ammo.Value ~= 0 then 
				sucess = true
			end
		end
		if not sucess ==  true then
			for iiii, vvvv in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
				if vvvv:FindFirstChild("Ammo") and vvvv.Ammo.Value == 0 then
					game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(vvvv)
					game.ReplicatedStorage.MainEvent:FireServer("Reload", vvvv)
					repeat wait() until vvvv.Ammo.Value ~= 0
				end
			end
		end
		sucess = nil
	end
end)
wait(1)
Animator:addButton("Astronaut", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
Animator:addButton("Bubbly", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=910004836"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=910009958"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=910034870"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=910025107"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=910016857"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=910001910"
	Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=910030921"
	Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=910028158"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
Animator:addButton("Cartoony", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
Animator:addButton("Elder", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
Animator:addButton("Knight", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
Animator:addButton("Levitation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
Animator:addButton("Mage", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
Animator:addButton("Ninja", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
Animator:addButton("Pirate", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
Animator:addButton("Robot", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616088211"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616089559"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616095330"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616091570"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616090535"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616086039"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616087089"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
Animator:addButton("Stylish", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616136790"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616138447"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616146177"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616140816"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616139451"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616133594"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616134815"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
Animator:addButton("Superhero", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
Animator:addButton("Toy", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
Animator:addButton("Vampire", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
Animator:addButton("Werewolf", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
Animator:addButton("Zombie", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)
wait(1)
Extra:addButton("Play All Sounds (FE)", function()
	sounds = {}

	function getSounds(loc)
		if loc:IsA("Sound") then
			table.insert(sounds,loc)
		end
		for _,obj in pairs(loc:GetChildren()) do
			getSounds(obj)
		end
	end

	getSounds(game)

	game.DescendantAdded:connect(function(obj)
		if obj:IsA("Sound") then
			table.insert(sounds,obj)
		end
	end)

	while wait(0.2) do
		for _,sound in pairs(sounds) do
			pcall(function()
				sound:Play()
			end)
		end
	end
end)
Extra:addButton("Auto Reload", function()
	local sucess = nil
	while wait(0.5) do
		for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:FindFirstChild("Ammo") and v.Ammo.Value ~= 0 then
				v.Parent = game.Players.LocalPlayer.Character
			end
		end
		for ii, vv in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if vv:FindFirstChild("Ammo") and vv.Ammo.Value == 0 then
				game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
			end
		end
		for iii, vvv in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if vvv:FindFirstChild("Ammo") and vvv.Ammo.Value ~= 0 then 
				sucess = true
			end
		end
		if not sucess ==  true then
			for iiii, vvvv in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
				if vvvv:FindFirstChild("Ammo") and vvvv.Ammo.Value == 0 then
					game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(vvvv)
					game.ReplicatedStorage.MainEvent:FireServer("Reload", vvvv)
					repeat wait() until vvvv.Ammo.Value ~= 0
				end
			end
		end
		sucess = nil
	end
end)
Extra:addButton("No Recoil", function()
	while wait() do
		if game:GetService("Players").LocalPlayer.Character.BodyEffects.Reload.Value == true then
			game:GetService("Players").LocalPlayer.Character.BodyEffects.Reload.Value = false
		end
	end
end)
Extra:addButton("Dick Bat", function()
	local d = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
	local k = game.Workspace.Ignored.Shop["[Bat] - $250"]
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
	if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
		wait(.2)
		fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
		toolf = game.Players.LocalPlayer.Backpack:WaitForChild("[Bat]")
		toolf.Parent = game.Players.LocalPlayer.Character
		wait()
		game.Players.LocalPlayer.Character:WaitForChild("[Bat]")
		game.Players.LocalPlayer.Character:WaitForChild("[Bat]").Grip = CFrame.new(-2.4000001, -0.699999988, 0, 0, 1, -0, -1, 0, -0, 0, 0, 1)
		game.Players.LocalPlayer.Character:WaitForChild("[Bat]").GripForward = Vector3.new(0, -1, -0)
		game.Players.LocalPlayer.Character:WaitForChild("[Bat]").GripPos = Vector3.new(1.2111, 1.11114, 1.8111)
		game.Players.LocalPlayer.Character:WaitForChild("[Bat]").GripUp = Vector3.new(-500000, 404, 5000000)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d)
	end
end)
Extra:addButton("Dick LMG", function()
	local d = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
	local k = game.Workspace.Ignored.Shop["[LMG] - $3750"]
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
	if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
		wait(.2)
		fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
		toolf = game.Players.LocalPlayer.Backpack:WaitForChild("[LMG]")
		toolf.Parent = game.Players.LocalPlayer.Character
		wait()
		game.Players.LocalPlayer.Character:WaitForChild("[LMG]")
		game.Players.LocalPlayer.Character:WaitForChild("[LMG]").Grip = CFrame.new(-2.4000001, -0.699999988, 0, 0, 1, -0, -1, 0, -0, 0, 0, 1)
		game.Players.LocalPlayer.Character:WaitForChild("[LMG]").GripForward = Vector3.new(0, -1, -0)
		game.Players.LocalPlayer.Character:WaitForChild("[LMG]").GripPos = Vector3.new(1.2111, 1.11114, 1.8111)
		game.Players.LocalPlayer.Character:WaitForChild("[LMG]").GripUp = Vector3.new(-500000, 404, 5000000)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d)
	end
end)
Extra:addButton("Force Drop", function()
	game.ReplicatedStorage.MainEvent:FireServer("DropMoney", 10000)
end)
Extra:addButton("Mask", function()
	local d = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
	local k = game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"]
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
	if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
		wait(.2)
		fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
		toolf = game.Players.LocalPlayer.Backpack:WaitForChild("Mask")
		toolf.Parent = game.Players.LocalPlayer.Character
		wait()
		game.Players.LocalPlayer.Character:WaitForChild("Mask")
		game:GetService("VirtualUser"):ClickButton1(Vector2.new())
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d)
	end
end)
Extra:addButton("Invisible Mask", function()
	local d = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
	local k = game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"]
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
	if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
		wait(.2)
		fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
		toolf = game.Players.LocalPlayer.Backpack:WaitForChild("Mask")
		toolf.Parent = game.Players.LocalPlayer.Character
		wait()
		game.Players.LocalPlayer.Character:WaitForChild("Mask")
		game:GetService("VirtualUser"):ClickButton1(Vector2.new())
		game.Players.LocalPlayer.Character:WaitForChild("In-gameMask")
		game.Players.LocalPlayer.Character["In-gameMask"].Handle:Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d)
	end
end)
Extra:addButton("Anti Equipment", function()
	while wait() do
		for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then
				v.Parent = game:GetService("Players").LocalPlayer.Backpack
			end
		end
	end
end)
Extra:addButton("Force Reset", function()
	game:GetService("Players").LocalPlayer.Character:ClearAllChildren()
end)
Extra:addButton("Free Korblox", function()
	game:GetService("Players").LocalPlayer.Character.RightUpperLeg:Destroy()
end)
Extra:addButton("Tools while jailed", function()
	game:GetService("Players").LocalPlayer.Character.BodyEffects.Cuff:Destroy()
end)
Extra:addButton("Equip All", function()
	for _, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
		if v:IsA("Tool") then
			v.Parent = game:GetService("Players").LocalPlayer.Character
		end
	end
end)
Extra:addButton("Mask Names", function()
	for _, v in pairs(game:GetService("Players"):GetPlayers()) do
		if v and v.Character and v.Character:FindFirstChildOfClass("Humanoid") and v.Character:FindFirstChildOfClass("Humanoid").DisplayDistanceType ~= Enum.HumanoidDisplayDistanceType.Viewer then
			v.Character:FindFirstChildOfClass("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
		end
	end
end)
Extra:addButton("Chatlogs", function()
	enabled = true
	spyOnMyself = false
	public = false
	publicItalics = true
	privateProperties = {
		Color = Color3.fromRGB(0, 255, 255),
		Font = Enum.Font.SourceSansBold,
		TextSize = 18
	}
	local StarterGui = game:GetService("StarterGui")
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
	local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
	local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
	local instance = (_G.chatSpyInstance or 0) + 1
	_G.chatSpyInstance = instance

	local function onChatted(p, msg)
		if _G.chatSpyInstance == instance then
			if p == player and msg:lower():sub(1, 4) == "/spy" then
				enabled = not enabled
				wait(0.3)
				privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
				StarterGui:SetCore("ChatMakeSystemMessage", privateProperties)
			elseif enabled and (spyOnMyself == true or p ~= player) then
				msg = msg:gsub("[\n\r]", ""):gsub("\t", " "):gsub("[ ]+", " ")
				local hidden = true
				local conn = getmsg.OnClientEvent:Connect(function(packet, channel)
					if packet.SpeakerUserId == p.UserId and packet.Message == msg:sub(#msg - #packet.Message + 1) and (channel == "All" or (channel == "Team" and public == false and Players[packet.FromSpeaker].Team == player.Team)) then
						hidden = false
					end
				end)
				wait(1)
				conn:Disconnect()
				if hidden and enabled then
					if public then
						saymsg:FireServer((publicItalics and "/me " or "").."{SPY} ["..p.Name.."]: "..msg, "All")
					else
						privateProperties.Text = "{SPY} ["..p.Name.."]: "..msg
						StarterGui:SetCore("ChatMakeSystemMessage", privateProperties)
					end
				end
			end
		end
	end

	for _, p in ipairs(Players:GetPlayers()) do
		p.Chatted:Connect(function(msg)
			onChatted(p, msg)
		end)
	end
	Players.PlayerAdded:Connect(function(p)
		p.Chatted:Connect(function(msg)
			onChatted(p, msg)
		end)
	end)
	privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
	StarterGui:SetCore("ChatMakeSystemMessage", privateProperties)
	if not player.PlayerGui:FindFirstChild("Chat") then
		wait(3)
	end
	local chatFrame = player.PlayerGui.Chat.Frame
	chatFrame.ChatChannelParentFrame.Visible = true
	chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position + UDim2.new(UDim.new(), chatFrame.ChatChannelParentFrame.Size.Y)
end)
Extra:addButton("Crash Server", function()
	local prefixe = "/"

	local Message = (prefixe.. "clean".." "):rep(95999988)

	for i = 1, 750 do
		game.Players:Chat(Message)
	end
end)
wait(1)
Target:addTextbox("Target", "Target Here", function(value, focusLost)
	if focusLost then
		for _, v in pairs(game:GetService("Players"):GetChildren()) do
			if (string.sub(string.lower(v.Name), 1, string.len(value))) == string.lower(value) then
				Skid = v.Name
			end
		end
	end
end)
Target:addButton("Force Kill", function()
	local localPlayer     = game:GetService("Players").LocalPlayer;
	local localCharacter  = localPlayer.Character;
	local TargetPlr       = Skid;

	if TargetPlr and game.Players[TargetPlr].Character.BodyEffects['K.O'].Value == false then
		pcall(function()

			game.Players.LocalPlayer.Character.LeftHand.Size = Vector3.new(4,4,4)
			localCharacter.LeftHand.LeftWrist:Destroy();
			localCharacter.RightHand.RightWrist:Destroy();
			game.Players.LocalPlayer.Character.RightHand.Size = Vector3.new(4,4,4)
			game.Players.LocalPlayer.Backpack.Combat.Parent = localCharacter

		end);
		repeat
			wait();
			localCharacter.LeftHand.CFrame = game.Players[TargetPlr].Character.LowerTorso.CFrame;
			localCharacter.RightHand.CFrame = game.Players[TargetPlr].Character.LowerTorso.CFrame;
			pcall(function()
				localCharacter.Combat:Activate()
			end);
		until game.Players[TargetPlr].Character.BodyEffects['K.O'].Value == true
	elseif game.Players[TargetPlr].Character.BodyEffects['K.O'].Value == true then
	end;
end)
Target:addButton("Arrest", function()
	local pl = game:GetService("Players")[Skid]
	local TargetPlr = pl.Name
	for i,v in pairs(game.Players:GetPlayers()) do 
		punchreachrr = TargetPlr
		local reachthing = "Combat"
		if game.Players.LocalPlayer.Backpack:FindFirstChild(reachthing) then
			game.Players.LocalPlayer.Backpack:FindFirstChild(reachthing).Parent = game.Players.LocalPlayer.Character
		end
		wait()
		game.Players.LocalPlayer.Character:FindFirstChild(reachthing):Activate()
		punchreach = true
		local cor = coroutine.wrap(function()
			wait(3)
			punchreach = false
			local lol = game.Players.LocalPlayer.Character.HumanoidRootPart
			game.Players.LocalPlayer.Character.RightHand.Size = Vector3.new(0.5,0.5, 0.5)
			game.Players.LocalPlayer.Character.LeftHand.Size = Vector3.new(0.5,0.5, 0.5)

			for i = 1, 10 do
				game.Players.LocalPlayer.Character.RightHand.CFrame = lol.CFrame
				game.Players.LocalPlayer.Character.LeftHand.CFrame = lol.CFrame
				wait(0.05)
			end

		end)
		cor()
		game:service'RunService'.Heartbeat:Connect(function(step)
			if punchreach == true then
				pcall(function()
					if game.Players.LocalPlayer.Character.RightHand:FindFirstChildOfClass("Model") then
						game.Players.LocalPlayer.Character.RightHand.Model.RightWrist:Destroy()
					end

					game.Players.LocalPlayer.Character.RightHand.RightWrist:Destroy()

				end)
				pcall(function()
					if game.Players.LocalPlayer.Character.LeftHand:FindFirstChildOfClass("Model") then
						game.Players.LocalPlayer.Character.LeftHand.Model.LeftWrist:Destroy()
					end
					game.Players.LocalPlayer.Character.LeftHand.LeftWrist:Destroy()
				end)
				local Part = workspace.Players[punchreachrr].LowerTorso

				game.Players.LocalPlayer.Character.RightHand.CFrame = CFrame.new(Part.CFrame.X ,Part.CFrame.Y+2, Part.CFrame.Z)
				game.Players.LocalPlayer.Character.RightHand.Massless = true
				game.Players.LocalPlayer.Character.RightHand.Size = Vector3.new(5, 5, 5)
				game.Players.LocalPlayer.Character.LeftHand.CFrame = CFrame.new(Part.CFrame.X ,Part.CFrame.Y+2, Part.CFrame.Z)
				game.Players.LocalPlayer.Character.LeftHand.Massless = true
				game.Players.LocalPlayer.Character.LeftHand.Size = Vector3.new(5, 5, 5)
			end
		end)
		repeat
			if workspace.Players:FindFirstChild(punchreachrr) then
				if workspace.Players[punchreachrr].BodyEffects["K.O"].Value == true then
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Cuff") then
						game.Players.LocalPlayer.Backpack:FindFirstChild("Cuff").Parent = game.Players.LocalPlayer.Character
					end
					game.Players.LocalPlayer.Character:FindFirstChild("Cuff"):Activate()
					game.Players.LocalPlayer.Character:MoveTo(workspace.Players[punchreachrr].Head.Position)
					if workspace:FindFirstChild("Core") then
						workspace.Core:Destroy()
					end
					flying = false
				end
			end
			wait()
		until workspace.Players[punchreachrr].BodyEffects["Cuff"].Value == true

		break
	end
end)
Target:addButton("Lock", function()
	local localPlayer     = game:GetService("Players").LocalPlayer;
	local localCharacter  = localPlayer.Character;
	local TargetPlr       = Skid;

	if TargetPlr and game.Players[TargetPlr].Character.BodyEffects['K.O'].Value == false then
		pcall(function()

			game.Players.LocalPlayer.Character.LeftHand.Size = Vector3.new(4,4,4)
			localCharacter.LeftHand.LeftWrist:Destroy();
			localCharacter.RightHand.RightWrist:Destroy();
			game.Players.LocalPlayer.Character.RightHand.Size = Vector3.new(4,4,4)
			game.Players.LocalPlayer.Backpack.Combat.Parent = localCharacter

		end);
		repeat
			wait();
			localCharacter.LeftHand.CFrame = game.Players[TargetPlr].Character.LowerTorso.CFrame;
			localCharacter.RightHand.CFrame = game.Players[TargetPlr].Character.LowerTorso.CFrame;
		until game.Players[TargetPlr].Character.BodyEffects['K.O'].Value == true
	elseif game.Players[TargetPlr].Character.BodyEffects['K.O'].Value == true then
	end;
end)
Target:addButton("Unlock", function()
	game.Players[Skid].Character.BodyEffects['K.O'].Value = true
end)
Target:addButton("Taser Lock", function()
	while wait() do
		pcall(function()
			game:GetService("Players").LocalPlayer.Character["[Taser]"].Handle.ChildAdded:Connect(function(v)
				if v.Name == "Part" then
					repeat
						v.CFrame = game:GetService("Players")[Skid].Character.HumanoidRootPart.CFrame
						wait()
					until not v:IsDescendantOf(game)
				end
			end)
		end)
	end
end)
Target:addButton("Cash", function()
	local notifSound = Instance.new("Sound",workspace)
	notifSound.PlaybackSpeed = 1.5
	notifSound.Volume = 0.15
	notifSound.SoundId = "rbxassetid://170765130"
	notifSound.PlayOnRemove = true
	notifSound:Destroy()
	game.StarterGui:SetCore("SendNotification", {Title = "Krypt", Text = game:GetService("Players")[Skid].Name.." has $"..game:GetService("Players")[Skid].DataFolder.Currency.Value, Icon = "rbxassetid://505845268", Duration = 15, Button1 = "Okay"})
end)
Target:addButton("Info", function()
	print("------------------")
	print(""..game:GetService("Players")[Skid].Name.." Has:")
	print("------------------")
	for i, v in pairs(game:GetService("Players")[Skid].Backpack:GetDescendants()) do
		if v:IsA("Tool") then
			print(""..v.Name.."")
		end
	end
	print("------------------")
	print(""..game:GetService("Players")[Skid].Name.." | Information:")
	print("------------------")
	print("Account Age: "..game:GetService("Players")[Skid].AccountAge)
	print("User ID: "..game:GetService("Players")[Skid].UserId)
	print("Cash: $"..game:GetService("Players")[Skid].DataFolder.Currency.Value)
	print("Wanted: "..game:GetService("Players")[Skid].DataFolder.Information.Wanted.Value)
	print("Shoes Collected: "..game.Players.LocalPlayer.Character.BodyEffects.ShoesCollect.Value)
	print("Shirt Template: "..game:GetService("Players")[Skid].Character.Shirt.ShirtTemplate)
	print("Pants Template: "..game:GetService("Players")[Skid].Character.Pants.PantsTemplate)
	print("Crew ID: "..game:GetService("Players")[Skid].DataFolder.Information.Crew.Value)
	print("Sound ID: "..game:GetService("Players")[Skid].Character.LowerTorso.BOOMBOXSOUND.SoundId)
	print("------------------")
end)
Target:addButton("Grenade Lock", function()
	while wait() do
		pcall(function()
			if game.Workspace.Ignored:FindFirstChild("Grenade") then
				local lol = game.Workspace.Ignored:FindFirstChild("Grenade")

				if lol:FindFirstChildOfClass("BodyVelocity") then
					wait()
					lol.BodyVelocity:Destroy()
				end

				if lol:FindFirstChild("BodyVelocity") == nil then
					lol.CFrame = CFrame.new(game:GetService("Players")[Skid].Character.Head.CFrame.X, game:GetService("Players")[Skid].Character.Head.CFrame.Y + 6.5, game:GetService("Players")[Skid].Character.Head.CFrame.Z)
				end
			elseif game.Workspace.Ignored:FindFirstChild("Handle") then
				local lol = game.Workspace.Ignored:FindFirstChild("Handle")

				if lol:FindFirstChild("Pin") then
					lol.CFrame = CFrame.new(game:GetService("Players")[Skid].Character.Head.CFrame.X, game:GetService("Players")[Skid].Character.Head.CFrame.Y + 8, game:GetService("Players")[Skid].Character.Head.CFrame.Z)
				end
			end
		end)
	end
end)
Target:addButton("RPG Lock", function()
	while wait() do
		pcall(function()
			if game.Workspace.Ignored:FindFirstChild("Grenade") then
				local lol = game.Workspace.Ignored:FindFirstChild("Launcher")

				if lol:FindFirstChildOfClass("BodyVelocity") then
					wait()
					lol.BodyVelocity:Destroy()
				end

				if lol:FindFirstChild("BodyVelocity") == nil then
					lol.CFrame = CFrame.new(game:GetService("Players")[Skid].Character.Head.CFrame.X, game:GetService("Players")[Skid].Character.Head.CFrame.Y + 6.5, game:GetService("Players")[Skid].Character.Head.CFrame.Z)
				end
			elseif game.Workspace.Ignored:FindFirstChild("Handle") then
				local lol = game.Workspace.Ignored:FindFirstChild("Handle")

				if lol:FindFirstChild("Pin") then
					lol.CFrame = CFrame.new(game:GetService("Players")[Skid].Character.Head.CFrame.X, game:GetService("Players")[Skid].Character.Head.CFrame.Y + 8, game:GetService("Players")[Skid].Character.Head.CFrame.Z)
				end
			end
		end)
	end
end)
Target:addButton("GoTo", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[Skid].Character.HumanoidRootPart.CFrame
end)
Target:addButton("Bag", function()
	local TargetPlr = Skid
	function getRoot(char)
		local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
		return rootPart
	end

	if TargetPlr and game.Players[TargetPlr].Character.BodyEffects['K.O'].Value == false then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop['[BrownBag] - $25'].Head.CFrame
		wait(.30)
		fireclickdetector(game.Workspace.Ignored.Shop['[BrownBag] - $25'].ClickDetector)
		game.Players.LocalPlayer.Backpack:WaitForChild("[BrownBag]").Parent = game.Players.LocalPlayer.Character

		wait(.5)
		repeat
			pcall(function()
				wait()
				getRoot(game.Players[TargetPlr].Character).CFrame = getRoot(game.Players.LocalPlayer.Character).CFrame + Vector3.new(1,3,0)
				game.Players.LocalPlayer.Character["[BrownBag]"]:Activate()
			end)
		until game.Players[TargetPlr].Character:FindFirstChild("Christmas_Sock")
	elseif game.Players[TargetPlr].Character.BodyEffects['K.O'].Value == false then
	end
end)
Target:addButton("Spectate", function()
	game:GetService("Workspace"):FindFirstChild("Camera").CameraSubject = game:GetService("Players")[Skid].Character:FindFirstChildOfClass("Humanoid")
end)
Target:addButton("Unspectate", function()
	game:GetService("Workspace"):FindFirstChild("Camera").CameraSubject = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
end)
Target:addButton("Attach Fists", function()
	local localPlayer     = game:GetService("Players").LocalPlayer;
	local localCharacter  = localPlayer.Character;
	local TargetPlr       = Skid;

	if TargetPlr and game.Players[TargetPlr].Character.BodyEffects['K.O'].Value == false then
		pcall(function()

			game.Players.LocalPlayer.Character.LeftHand.Size = Vector3.new(4,4,4)
			localCharacter.LeftHand.LeftWrist:Destroy();
			localCharacter.RightHand.RightWrist:Destroy();
			game.Players.LocalPlayer.Character.RightHand.Size = Vector3.new(4,4,4)
			game.Players.LocalPlayer.Backpack.Combat.Parent = localCharacter

		end);
		repeat
			wait();
			localCharacter.LeftHand.CFrame = game.Players[TargetPlr].Character.LowerTorso.CFrame;
			localCharacter.RightHand.CFrame = game.Players[TargetPlr].Character.LowerTorso.CFrame;
		until game.Players[TargetPlr].Character.BodyEffects['K.O'].Value == true
	elseif game.Players[TargetPlr].Character.BodyEffects['K.O'].Value == true then
	end;
end)

game:GetService("Players").LocalPlayer:GetMouse().KeyDown:Connect(function(Key)
	if Key == "v" then
		Library:toggle()
	end
end)

Library:SelectPage(Library.pages[1], true)

Library:Notify("Krypt", "We have started! Thank you for using our service.")

local bind = Instance.new("BindableFunction")

function bind.OnInvoke(response)
	if response == "Accept" then
		local d = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
		local k = game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"]
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
		if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
			wait(.2)
			fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
			toolf = game.Players.LocalPlayer.Backpack:WaitForChild("Mask")
			toolf.Parent = game.Players.LocalPlayer.Character
			wait()
			game.Players.LocalPlayer.Character:WaitForChild("Mask")
			game:GetService("VirtualUser"):ClickButton1(Vector2.new())
			if game.Players.LocalPlayer.Character:FindFirstChild("Shirt") then
				game.Players.LocalPlayer.Character.Shirt:Destroy()
			elseif game.Players.LocalPlayer.Character:FindFirstChild("Pants") then
				game.Players.LocalPlayer.Character.Pants:Destroy()
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d)
		end
	else
		game.StarterGui:SetCore("SendNotification", {
			Title = "Krypt",
			Text = "If you get banned, its not on us!",
			Duration = 6.9
		})
	end
end
game.StarterGui:SetCore("SendNotification", {
	Title = "Krypt",
	Text = "Morph yourself, wont affect your game. Prevents global bans.",
	Duration = 3.4028235e+38,
	Callback = bind,
	Button1 = "Accept",
	Button2 = "Decline"
})
