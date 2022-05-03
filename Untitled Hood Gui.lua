local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()
loadstring(game:HttpGet("https://raw.githubusercontent.com/qs4d/a/main/chatlog.lua", true))()
local win = lib:Window("Untitled Hood | cool",Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)
local Main = win:Tab("Main")
local Shop = win:Tab("Shop")
local TP = win:Tab("Teleports")
local Farm = win:Tab("Farms")
wait()
        for _, v in pairs(workspace.Ignored.Shop:GetChildren()) do
            Shop:Button(v.Name, function()
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
        wait()

Main:Button("Fly (X)",function()
    repeat wait() 
    until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
    local mouse = game.Players.LocalPlayer:GetMouse() 
    repeat wait() until mouse
    local plr = game.Players.LocalPlayer 
    local torso = plr.Character.Head 
    local flying = false
    local deb = true 
    local ctrl = {f = 0, b = 0, l = 0, r = 0} 
    local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
    local maxspeed = 5000
    local speed = 5000 

    function Fly() 
        local bg = Instance.new("BodyGyro", torso) 
        bg.P = 9e4 
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
        bg.cframe = torso.CFrame 
        local bv = Instance.new("BodyVelocity", torso) 
        bv.velocity = Vector3.new(0,0.1,0) 
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
        repeat wait() 
            plr.Character.Humanoid.PlatformStand = true 
            if ctrl.l + ctrl.r ~= 100000 or ctrl.f + ctrl.b ~= 10000 then 
                speed = speed+.0+(speed/maxspeed) 
                if speed > maxspeed then 
                    speed = maxspeed 
                end 
            elseif not (ctrl.l + ctrl.r ~= 5 or ctrl.f + ctrl.b ~= 5) and speed ~= 5 then 
                speed = speed-5
                if speed > 5 then 
                    speed = -2 
                end 
            end 
            if (ctrl.l + ctrl.r) ~= 5 or (ctrl.f + ctrl.b) ~= 5 then 
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
            elseif (ctrl.l + ctrl.r) == 5 and (ctrl.f + ctrl.b) == 5 and speed ~= 5 then 
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
            else 
                bv.velocity = Vector3.new(0,0.1,0) 
            end 
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
        until not flying 
        ctrl = {f = 0, b = 0, l = 0, r = 0} 
        lastctrl = {f = 0, b = 0, l = 0, r = 0} 
        speed = 5 
        bg:Destroy() 
        bv:Destroy() 
        plr.Character.Humanoid.PlatformStand = false 
    end 
    mouse.KeyDown:connect(function(key) 
        if key:lower() == "x" then 
            if flying then flying = false 
            else 
                flying = true 
                Fly() 
            end 
        elseif key:lower() == "w" then 
            ctrl.f = 45
        elseif key:lower() == "s" then 
            ctrl.b = -45 
        elseif key:lower() == "a" then 
            ctrl.l = -45 
        elseif key:lower() == "d" then 
            ctrl.r = 45
        end 
    end) 
    mouse.KeyUp:connect(function(key) 
        if key:lower() == "w" then 
            ctrl.f = 0
        elseif key:lower() == "s" then 
            ctrl.b = 0
        elseif key:lower() == "a" then 
            ctrl.l = 0
        elseif key:lower() == "d" then 
            ctrl.r = 0
        end 
    end)
    Fly()
end)

Main:Button("Superhuman (Z)",function()
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

Main:Button("Anonymous",function()
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


Main:Button("Ctrl + Click TP",function()
    local Plr = game:GetService("Players").LocalPlayer
    local Mouse = Plr:GetMouse()
    
    Mouse.Button1Down:connect(function()
    if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
    if not Mouse.Target then return end
    Plr.Character:MoveTo(Mouse.Hit.p)
    end)
end)

Main:Button("Headless",function()
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
---------------------------------------------
TP:Button("Casino",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(37.07000732421875, 92.01715087890625, -1541.82958984375)
end)

TP:Button("Train",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(782.8748779296875, 22.175411224365234, -1417.687255859375)
end)

TP:Button("Bank",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(816.7709350585938, 89.82152557373047, -1082.09423828125)
end)

TP:Button("Mexico Taco",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(569.5543212890625, 75.79944610595703, -1142.70751953125)
end)

TP:Button("Hood Furniture",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(146.3193817138672, 76.05281829833984, -1072.5029296875)
end)

TP:Button("Da Musuem",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(11.477553367614746, 120.66487884521484, -803.9796142578125)
end)

TP:Button("Police Station",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-40.765525817871094, 121.54149627685547, -357.17852783203125)
end)

TP:Button("Gym",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(338.2198181152344, 123.1791763305664, -556.671875)
end)

TP:Button("Food Shop",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(739.727294921875, 58.395530700683594, -707.5636596679688)
end)

TP:Button("Safe Place",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-222.11221313476562, 189.4227294921875, -1569.8037109375)
end)
-------------------------------------------------------------------
Farm:Toggle("Lettuce Farm",function()
    lib:Notification("GUI", "To stop this you have to leave", "Ok")
    local localPlayer = game:GetService("Players").LocalPlayer
    if localPlayer then
        wait(0.5)
        localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.Ignored.Shop["[Lettuce] - $5"].Head.CFrame.Position) * CFrame.new(0,5,0)
        localPlayer.CharacterAdded:Connect(function()
            localPlayer.Character:WaitForChild("Humanoid")
            wait(0.5)
            localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.Ignored.Shop["[Lettuce] - $5"].Head.CFrame.Position) * CFrame.new(0,5,0)
        end)
        game:GetService("RunService").Stepped:Connect(function()
            wait(1)
            fireclickdetector(game.Workspace.Ignored.Shop["[Lettuce] - $5"].ClickDetector)
            wait(1)
            localPlayer.Character.Humanoid:EquipTool(localPlayer.Backpack["[Lettuce]"])
            wait()
            mouse1click()
            wait()
            mouse1click()
            wait()
        end)
    end
end)
