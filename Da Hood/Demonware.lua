


--
local VLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/vep1032/VepStuff/main/VL"))()

local s = VLib:Window("DemonWare", "Da Hood", "D")

local p = s:Tab("Player Tab")
local c = s:Tab("Combat Tab")
local tp = s:Tab("Teleports")
local ab = s:Tab("AutoBuy")
local af = s:Tab("Autofarm")
local anm = s:Tab("Animations")
local m = s:Tab("Money")
local ex = s:Tab("Target")
local esp = s:Tab("ESP")
local cr = s:Tab("Credits/Security")


p:Button("Shazam Fly!",function()Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=3541114300"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=3541114300"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=3541044388"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
end)
p:Button("Shazam!",function()Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=3541114300"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=3541114300"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=3541044388"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
end)
p:Button("Free Animations Gamepass",function()-- // Delete Clones
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
p:Button("Free Boombox Gmapeass",function()
end)
p:Button("Auto Reload",function()
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
p:Button("No Recoil",function()while wait() do
		if game:GetService("Players").LocalPlayer.Character.BodyEffects.Reload.Value == true then
			game:GetService("Players").LocalPlayer.Character.BodyEffects.Reload.Value = false
		end
	end
end)
p:Button("Aimbot | Right Shift",function()
end)
p:Button("Fly",function()loadstring(game:HttpGet("https://pastebin.com/raw/nrSksppt"))()
end)
p:Button("SuperHuman [Z]",function()superhuman = false
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
p:Button("Infinite Jump",function()Player = game:GetService'Players'.LocalPlayer;
    UIS = game:GetService'UserInputService';

    _G.JumpHeight = 50;

    function Action(Object, Function) if Object ~= nil then Function(Object); end end

    UIS.InputBegan:connect(function(UserInput)
        if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
            Action(Player.Character.Humanoid, function(self)
                if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                    Action(self.Parent.HumanoidRootPart, function(self)
                        self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                          end)
                       end
                end)
                end
        end)
end)
p:Button("Rejoin",function()if (#game:GetService("Players"):GetPlayers() <= 1) then
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	else
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
	end
end)
p:Button("Sever Hop",function()if (#game:GetService("Players"):GetPlayers() <= 1) then
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	else
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
	end
end)
p:Button("Naked",function()local function inTable(What, Table)
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
p:Button("Unban",function()game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health = 0
game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
    Instance.new("Folder",game:GetService("Players").LocalPlayer.Character).Name = ("FULLY_LOADED_CHAR")
    game:GetService("Players").LocalPlayer.Character:WaitForChild("BodyEffects"):WaitForChild("Dead"):Remove()
    Instance.new("BoolValue",game:GetService("Players").LocalPlayer.Character:WaitForChild("BodyEffects")).Name = ("Dead")
    repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("BodyEffects"):findFirstChild("Dead")
    game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):WaitForChild("BodyWidthScale").Value = 0.5
    game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):WaitForChild("HeadScale").Value = 1
    game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):WaitForChild("BodyHeightScale").Value = 1
    game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):WaitForChild("BodyDepthScale").Value = 0.5
    game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):WaitForChild("BodyTypeScale").Value = 0.01
end)
end)
p:Button("GodMode",function(GOD)plr.Character.BodyEffects:FindFirstChild('BreakingParts'):Destroy()
				game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.Bar.HP.Picture.Life.Visible = true
end)
p:Button("God Block (SOON!)",function()
end)
p:Button("Bike Fly",function()local speed = 20
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
p:Button("Headless",function()getgenv().game.Players.LocalPlayer.Character.Head.Transparency = 1
    getgenv().game.Players.LocalPlayer.Character.Head.face:Destroy()
    getgenv().game.Players.LocalPlayer.Character.Head.face:Destroy()
end)
p:Button("Korblox",function()local ply = game.Players.LocalPlayer
	local chr = ply.Character
	chr.RightLowerLeg.MeshId = "902942093"
	chr.RightLowerLeg.Transparency = "1"
	chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
	chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
	chr.RightFoot.MeshId = "902942089"
	chr.RightFoot.Transparency = "1"
end)
p:Button("Fog",function()game:GetService("Lighting").FogEnd = math.huge
end)
p:Button("Backflip (Wait few secs) [Z]",function()wait(5)

	--[[ Info ]]--

	local ver = "2.00"
	local scriptname = "feFlip"


	--[[ Keybinds ]]--

	local FrontflipKey = Enum.KeyCode.Z
	local BackflipKey = Enum.KeyCode.X
	local AirjumpKey = Enum.KeyCode.C


	--[[ Dependencies ]]--

	local ca = game:GetService("ContextActionService")
	local zeezy = game:GetService("Players").LocalPlayer
	local h = 0.0174533
	local antigrav


	--[[ Functions ]]--

	function zeezyFrontflip(act,inp,obj)
		if inp == Enum.UserInputState.Begin then
			zeezy.Character.Humanoid:ChangeState("Jumping")
			wait()
			zeezy.Character.Humanoid.Sit = true
			for i = 1,360 do 
				delay(i/720,function()
					zeezy.Character.Humanoid.Sit = true
					zeezy.Character.HumanoidRootPart.CFrame = zeezy.Character.HumanoidRootPart.CFrame * CFrame.Angles(-h,0,0)
				end)
			end
			wait(0.55)
			zeezy.Character.Humanoid.Sit = false
		end
	end

	function zeezyBackflip(act,inp,obj)
		if inp == Enum.UserInputState.Begin then
			zeezy.Character.Humanoid:ChangeState("Jumping")
			wait()
			zeezy.Character.Humanoid.Sit = true
			for i = 1,360 do
				delay(i/720,function()
					zeezy.Character.Humanoid.Sit = true
					zeezy.Character.HumanoidRootPart.CFrame = zeezy.Character.HumanoidRootPart.CFrame * CFrame.Angles(h,0,0)
				end)
			end
			wait(0.55)
			zeezy.Character.Humanoid.Sit = false
		end
	end

	function zeezyAirjump(act,inp,obj)
		if inp == Enum.UserInputState.Begin then
			zeezy.Character:FindFirstChildOfClass'Humanoid':ChangeState("Seated")
			wait()
			zeezy.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")	
		end
	end


	--[[ Binds ]]--

	ca:BindAction("zeezyFrontflip",zeezyFrontflip,false,FrontflipKey)
	ca:BindAction("zeezyBackflip",zeezyBackflip,false,BackflipKey)
	ca:BindAction("zeezyAirjump",zeezyAirjump,false,AirjumpKey)

	--[[ Load Message ]]--

	local notifSound = Instance.new("Sound",workspace)
	notifSound.PlaybackSpeed = 1.5
	notifSound.Volume = 0.15
	notifSound.SoundId = "rbxassetid://170765130"
	notifSound.PlayOnRemove = true
	notifSound:Destroy()
end)
p:Button("Anti Flashbang",function()while wait() do
		pcall(function()
			game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MainScreenGui"):FindFirstChild("whiteScreen"):Destroy()
		end)
	end
end)
p:Button("Silnt Block",function()local ps = game:GetService("Players")
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
p:Button("Unjail",function()if game:GetService("Players").LocalPlayer.DataFolder.Currency.Value >= 125 then
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
wait(1)
end)
for _, v in pairs(workspace.Ignored.Shop:GetChildren()) do
	ab:Button(v.Name, function()
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
c:Button("Anti Stomp",function()pcall(function() if tostring(game.PlaceId) == "2788229376" then local corepackages = game:GetService"CorePackages" local localplayer = game:GetService"Players".LocalPlayer local run = game:GetService"RunService" run:BindToRenderStep("rrrrrrrrrrr",2000,function() pcall(function() if localplayer.Character.Humanoid.Health <= 30 then localplayer.Character.Humanoid:UnequipTools() localplayer.Character.Humanoid:Destroy() workspace.CurrentCamera.CameraSubject = localplayer.Character wait() local prt = Instance.new("Model", corepackages); Instance.new("Part", prt).Name="Torso"; Instance.new("Part", prt).Name="Head"; Instance.new("Humanoid", prt).Name="Humanoid"; localplayer.Character=prt end end) pcall(function() if localplayer.Character.Humanoid.FloorMaterial == "Plastic" then ReplicatedStorage:FireServer("Stomp") end end) end) 
end end)
end)
c:Button("Katana",function()game.Players.LocalPlayer.Backpack["[Knife]"].GripPos = Vector3.new(1, 0, 0.1)
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
c:Button("Free Fists [T]",function()-- // Variables
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
		if (Key.KeyCode == Enum.KeyCode.T) then
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
c:Button("Fake Macro [Q]",function()-- the key 2 speed is "Q"
plr = game:GetService('Players').LocalPlayer
down = true
 
function onButton1Down(mouse)
    down = true
    while down do
        if not down then break end
        local char = plr.Character
        char.HumanoidRootPart.Velocity = char.HumanoidRootPart.CFrame.lookVector * 190
        wait()
    end
end
 
function onButton1Up(mouse)
    down = false
end
 
function onSelected(mouse)
    mouse.KeyDown:connect(function(q) if q:lower()=="q"then onButton1Down(mouse)end end)
    mouse.KeyUp:connect(function(q) if q:lower()=="q"then onButton1Up(mouse)end end)
end
onSelected(game.Players.LocalPlayer:GetMouse())
end)
c:Button("Fake Macro (Realistic) [L]",function(bool)local Player = game:GetService("Players").LocalPlayer
    local Mouse = Player:GetMouse()
    local SpeedGlitch = false
    local Wallet = Player.Backpack:FindFirstChild("Wallet")
 
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
 
    Mouse.KeyDown:Connect(function(Key)
        if Key == "l" then
            SpeedGlitch = not SpeedGlitch
            if SpeedGlitch == true then
                stopTracks()
                loadAnimation("rbxassetid://3189777795")
                wait(1.5)
                Wallet.Parent = Player.Character
                wait(0.15)
                Player.Character:FindFirstChild("Wallet").Parent = Player.Backpack
                wait(0.05)
                repeat game:GetService("RunService").Heartbeat:wait()
                    keypress(0x49)
                    game:GetService("RunService").Heartbeat:wait()
                    keypress(0x4F)
                    game:GetService("RunService").Heartbeat:wait()
                    keyrelease(0x49)
                    game:GetService("RunService").Heartbeat:wait()
                    keyrelease(0x4F)
                    game:GetService("RunService").Heartbeat:wait()
                until SpeedGlitch == false
            end
        end
    end)
end)
c:Button("Fist Reach",function()LP = game.Players.LocalPlayer 

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
c:Button("Tool Reach",function()for i, v in pairs(game:GetService"Players".LocalPlayer.Character:GetChildren()) do
		if v:isA("Tool") then
			local a = Instance.new("SelectionBox", v.Handle)
			a.Adornee = v.Handle
			v.Handle.Size = Vector3.new(50, 50, 50)
			v.Handle.Transparency = 1
			v.GripPos = Vector3.new(0, 0, 0)
		end
	end
end)
c:Button("Auto Pick (Dropped Items)",function()local d = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
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
c:Button("Split Granade [V]",function()local plr = game.Players.LocalPlayer
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
c:Button("Trash Talk (Spam J)",function(bool)local plr = game.Players.LocalPlayer
repeat wait() until plr.Character
local char = plr.Character
 
local garbage = {
    "ur bad";
    "sonney boy";
    "ez";
    "my grandma has more skill than you";
    "seed";
    "sit son";
    "trash";
    "LOL";
    "LMAO";
    "imagine being you right now";
    "xd";
    "u tried g";
    "you lose";
    "why do you even try";
    "I didn't think being this bad was possible";
    "leave";
    "no skill";
    "so sad man.";
    "bad";
    "you're nothing";
    "lol";
    "so trash";
    "so bad";
    "ur salty";
    "salty";
    "son";
    "sonned";
    "cry baby";
    "hahaha I won";
    "no one likes u";
    "run 1s seed";
    "thank you for your time";
    "you were so close!";
    "better luck next time!";
    "rodent";
    "LMFAOFAAAOFO";
    "ill 5-0";
    "just quit";
    "time to take out the trash";
    "did you get worse?";
    "I'm surprised you haven't quit yet";

 
}
 
 
function TrashTalk(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.J and gameProcessedEvent == false then        
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
        garbage[math.random(1,#garbage)],
        "All"
    )
    end
end
 
game:GetService("UserInputService").InputBegan:connect(TrashTalk)
end)
c:Button("Anti Slow",function()game:GetService("Players").LocalPlayer.Character.BodyEffects.Movement.ChildAdded:Connect(function(child)
		if (child.Name == "NoJumping" or child.Name == "ReduceWalk" or child.Name == "NoWalkSpeed") then 
			child:Destroy()
		end
	end)
end)
c:Button("Tornado",function()local d = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
	pcall(function()
		for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
			if v.Name == "[Knife]" then
				v.Parent = game:GetService("Players").LocalPlayer.Character
			end
		end
end)
game:GetService("UserInputService").InputBegan:connect(TrashTalk)
end)
c:Slider("FOV Slider",80,120,0,function(text)
workspace.CurrentCamera.FieldOfView = (text)
end)
c:Button("Fly Meele",function()for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
		if v:isA("Tool") then
			v.GripPos = Vector3.new(10,-10,10)
		end
	end
wait(1)
game.StarterGui:SetCore("SendNotification", {
	Title = "DemonWare",
	Text = "U Have To Be Holding A Meele Tool",
	Duration = 15.0,
})
end)
c:Button("Fly Gun",function()
    for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
		if v:isA("Tool") then
			v.GripPos = Vector3.new(10,-10,10)
		end
	end
wait(1)
game.StarterGui:SetCore("SendNotification", {
	Title = "DemonWare",
	Text = "U Have To Be Holding A Gun",
	Duration = 15.0,
})
end)
c:Button("Mod Menu",function()wait()
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
c:Button("Aimbot V2 | E",function()
end)
c:Button("Bag All",function()
end)
c:Button("Granade All",function()
end)
c:Button("Play All Sounds [FE]",function()sounds = {}

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
c:Button("Equip All",function()for _, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
		if v:IsA("Tool") then
			v.Parent = game:GetService("Players").LocalPlayer.Character
		end
	end
end)
c:Button("Mask Names",function()for _, v in pairs(game:GetService("Players"):GetPlayers()) do
		if v and v.Character and v.Character:FindFirstChildOfClass("Humanoid") and v.Character:FindFirstChildOfClass("Humanoid").DisplayDistanceType ~= Enum.HumanoidDisplayDistanceType.Viewer then
			v.Character:FindFirstChildOfClass("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
		end
	end
end)
c:Button("Invisible Mask",function()local d = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
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
c:Button("SPY",function()enabled = true
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
c:Button("Dick Bat",function()local d = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
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
c:Button("Tools While Jailed",function()game:GetService("Players").LocalPlayer.Character.BodyEffects.Cuff:Destroy()
end)

-- tps | tp

tp:Button("Bank", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-485.668, 23.631, -285.169)
end)
tp:Button("Boxing Place", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-236.006, 23.151, -1120.531)
end)
tp:Button("Police Station", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-267.637, 21.807, -121.982)
end)
tp:Button("Admin Base", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-729.895, -37.642, -885.8)
end)
tp:Button("Sewers", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(112.622, -26.212, -277.321)
end)
tp:Button("Shoe Store", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.Ignored.Drop:FindFirstChildOfClass("MeshPart").Position)
end)
tp:Button("Hospital", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.518, 21.755, -481.680)
end)
tp:Button("Phone Store", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-120.121, 22.946, -870.425)
end)
tp:Button("Taco Shack", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(546.946, 51.061, -493.325)
end)
tp:Button("Casino", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-879.277, 21.254, -190.199)
end)
tp:Button("UFO", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(71.565, 142.926, -690.33)
end)
tp:Button("Fire Station", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-132.674, 21.280, -145.176)
end)
tp:Button("Gas Station", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(595.377, 49.000, -264.222)
end)
tp:Button("Church", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(203.938, 21.75, -98.446)
end)
tp:Button("Gun Store 1", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-582, 7.172, -739.015)
end)
tp:Button("Gun Store 2", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(475.022, 48.005, -603.737)
end)

-- af

af:Button("Fist Farm (HUGE FIX!)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/rapnz/scripts/master/DaHoodFarm.lua"))()
	end)
af:Button("Fast Farm", function()
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
af:Button("Shotgun Farm (Execute Twice, Buy Much Ammo)", function()
	if game.Players.LocalPlayer.Character.Animate:FindFirstChild("idle") then
		game.Players.LocalPlayer.Character.Animate.idle:Destroy()
	end
	local me = game:service"Players".LocalPlayer
	local plr = game.Players.LocalPlayer
	local savedarmourpos = plr.Character.HumanoidRootPart.Position
	local toolname = "[Double-Barrel SG] - $1400"
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
	me.Character.Humanoid:EquipTool(me.Backpack:FindFirstChild("[Double-Barrel SG]"))
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
af:Button("P90 Farm", function()
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
af:Button("Auto Muscle", function()
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
af:Button("Auto Box", function()
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

-- money | m

wait(1)
_G.CashDropAmount = 10000
m:Button("Fast Drop Cash", nil, function(value)
	while value do
		wait()
		game.ReplicatedStorage.MainEvent:FireServer("DropMoney", _G.CashDropAmount)
	end
end)
m:Textbox("Cash Drop Amount", "10000", function(value, focusLost)
	if focusLost then
		_G.CashDropAmount = value
	end
end)
wait(1)
m:Slider("Fake Cash", 0, 10000000, 0, function(value)
	game.Players.LocalPlayer.PlayerGui.Framework.CurrencySound:Play()
	game.Players.LocalPlayer.DataFolder.Currency.Value = value
	game.Players.LocalPlayer.PlayerGui.MainScreenGui.MoneyText.Text = "$"..value
	if game.Players.LocalPlayer.Backpack:FindFirstChild("Wallet") then
		game.Players.LocalPlayer.Backpack.Wallet.Handle.BillboardGui.TextLabel.Text = "$"..value
	else
		game.Players.LocalPlayer.Character.Wallet.Handle.BillboardGui.TextLabel.Text = "$"..value
	end
end)
wait(1)
m:Button("Cash ESP", function()
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
m:Button("Bring Cash", function()
	for e, v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
		if v.Name == "MoneyDrop" then
			v.Position = game.Players.LocalPlayer.Character.Head.CFrame.p + Vector3.new(0, 1, 0)
			v.Anchored = false
		end
	end
end)
m:Button("Cash Scaffold", function()
	while wait() do
		for e, v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
			if v.Name == "MoneyDrop" then
				v.CFrame = game.Players.LocalPlayer.Character.Head.CFrame.p + Vector3.new(0, 1.5, -22)
				v.CanCollide = false
			end
		end
	end
end)
m:Button("Cash Float", function()
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
m:Button("Cash Fling", function()
	for e, v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
		if v.Name == "MoneyDrop" then
			local BodyPosition = Instance.new("BodyPosition", v)
			BodyPosition.D = 0
			BodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			BodyPosition.P = 15000
		end
	end
end)
m:Button("Cash Destroy", function()
	for e, v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
		if v.Name == "MoneyDrop" then
			v:Destroy()
		end
	end
end)
m:Button("Cash Spin", function()
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

-- anms | anm

anm:Button("Astronaut", function()
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
anm:Button("Bubbly", function()
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
anm:Button("Cartoony", function()
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
anm:Button("Elder", function()
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
anm:Button("Knight", function()
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
anm:Button("Levitation", function()
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
anm:Button("Mage", function()
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
anm:Button("Ninja", function()
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
anm:Button("Pirate", function()
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
anm:Button("Robot", function()
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
anm:Button("Stylish", function()
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
anm:Button("Superhero", function()
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
anm:Button("Toy", function()
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
anm:Button("Vampire", function()
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
anm:Button("Werewolf", function()
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
anm:Button("Zombie", function()
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

-- target \ ex

ex:Button("Target GUI (SOON!)", function()game.StarterGui:SetCore("SendNotification", {
	Title = "DemonWare",
	Text = "SOON!",
	Duration = 15.0,
})
end)
esp:Button("ESP (SOON!)", function()game.StarterGui:SetCore("SendNotification", {
	Title = "DemonWare",
	Text = "SOON!",
	Duration = 15.0,
})
end)
cr:Button("Owner: msx8#0001/dawggore#5813", function()game.StarterGui:SetCore("SendNotification", {
	Title = "DemonWare",
	Text = "Join Discord!",
	Duration = 15.0,
})
end)
cr:Button("Discord: https://dsc.gg/demonware", function()game.StarterGui:SetCore("SendNotification", {
	Title = "DemonWare",
	Text = "Join Discord!",
	Duration = 15.0,
})
end)
cr:Button("UI Lib: vep#1032", function()game.StarterGui:SetCore("SendNotification", {
	Title = "DemonWare",
	Text = "Credits for Ui lib",
	Duration = 15.0,
})
end)
cr:Toggle("Anonymous", function()pcall(function()
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
game.StarterGui:SetCore("SendNotification", {
	Title = "DemonWare",
	Text = "https://dsc.gg/demonware",
	Duration = 15.0,
})
game.StarterGui:SetCore("SendNotification", {
	Title = "if u find any errors dm msx8#0001 ok bye",
	Text = "ok bye",
	Duration = 15.0,
})
