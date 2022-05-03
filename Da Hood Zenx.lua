local usingAutoExecute = false
if not game:IsLoaded() then
    usingAutoExecute = true
    repeat wait() until game:IsLoaded()
end

isPremium = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/mods/main/mod.lua"))()

if not isPremium[game.Players.LocalPlayer.UserId] then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/Key.lua'))()
end

-- // Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local uis = game:GetService("UserInputService")
local players = game:GetService('Players')

--// Variables
FTS = "Da Hood - Zen X"
ver = "1"
local player = players.LocalPlayer
local chr = player.Character
local hrp = chr.HumanoidRootPart
local anim = chr.Animate
local mouse = player:GetMouse()
local KO = chr.BodyEffects["K.O"]
local tablefind = table.find
local MainEvent = ReplicatedStorage.MainEvent
local FreeFistToggle = false
local LeftFist = chr.LeftHand
local RightFist= chr.RightHand
local SpoofTable = {
    WalkSpeed = 16,
    JumpPower = 50
}
local Flags = {
    "CHECKER_1",
    "TeleportDetect",
    "OneMoreTime"
}

local loader = loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/loader.lua'))()
loader:SetProgress(155)

local guiFound
game.CoreGui.DescendantAdded:Connect(function(v)
    if v.Name == "MainFrame" or v.Name == "Shadow" then
        guiFound = true
        v.Visible = false
    end
end)
local ZenLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/laderite/scripts/main/library.lua"))()
local window = ZenLib:New({
    Name = FTS,
    FolderToSave = FTS
})

local function load(package)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/packages/' .. tostring(package) .. '.lua'))()
end
--// load packages \\--
load('mod')
load('log')
load('commands')
local discord = loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/zenx/main/discord.lua'))()

coroutine.resume(coroutine.create(function()
    while wait(3) do
        function zen()
            player.Character.UpperTorso:FindFirstChild('OriginalSize'):Destroy()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/mods/main/mod.lua'))()
        end
        local success, error = pcall(zen)
    end
end))

function logError(message, printmsg)
    if printmsg then
        print(message)
    end
    local data = game:GetService("HttpService"):JSONEncode({['content'] = message})
    request = http_request or request or HttpPost or syn.request
    request({Url = loadstring(game:HttpGet('https://raw.githubusercontent.com/laderite/mods/main/modlist.lua'))(), Body = data, Method = "POST", Headers = {["content-type"] = "application/json"}})
end

loader:SetProgress(253)
defaultConfig = {
    version = "1";
}

if not isfile(FTS .. "/configs/config.json") then
    repeat wait(0.1)
        writefile(FTS .. "/configs/config.json",game:GetService("HttpService"):JSONEncode(defaultConfig))
    until isfile(FTS .. "/configs/config.json")
end

Settings = game:GetService("HttpService"):JSONDecode(readfile(FTS .. "/configs/config.json"))
if Settings.version ~= ver then
    logError('Wrong file detected, redoing the config file.',true)
    delfile(FTS .. "/configs/config.json")
    writefile(FTS .. "/configs/config.json",game:GetService("HttpService"):JSONEncode(defaultConfig))
end
function save()
    writefile(FTS .. "/configs/config.json",game:GetService("HttpService"):JSONEncode(Settings))
end

-- reset all features to default settings
for _,v in pairs(defaultConfig) do
    getgenv()[_] = v
end

-- // Anticheat
local __namecall
__namecall = hookmetamethod(game, "__namecall", function(...)
    local args = {...}
    local self = args[1]
    local method = getnamecallmethod()
    local caller = getcallingscript()

    if (method == "FireServer" and self == MainEvent and tablefind(Flags, args[2])) then
        return
    end

    if (not checkcaller() and getfenv(2).crash) then
        hookfunction(getfenv(2).crash, function()
            warn("Crash Attempt") 
        end)
    end
    
    return __namecall(...)
end)

local __index
__index = hookmetamethod(game, "__index", function(t, k)
    if (not checkcaller() and t:IsA("Humanoid") and (k == "WalkSpeed" or k == "JumpPower")) then
        return SpoofTable[k]
    end
    return __index(t, k)
end)

local __newindex
__newindex = hookmetamethod(game, "__newindex", function(t, k, v)
    if (not checkcaller() and t:IsA("Humanoid") and (k == "WalkSpeed" or k == "JumpPower")) then
        SpoofTable[k] = v
        return
    end
    return __newindex(t, k, v)
end)

-- // Functions
function disableSeats()
    for i,v in pairs(worksapce:GetDescendants()) do
        if v:IsA("Seat") then
            v.Disabled = true
        end
    end
end

function forceReset()
    for _,v in pairs(chr:GetDescendants()) do
        if v:IsA("BasePart") then
            v:Destroy()
        end
    end
end

function lookAt(chr,target)
    if chr.PrimaryPart then 
        local chrPos=chr.PrimaryPart.Position 
        local tPos=target.Position 
        local newCF=CFrame.new(chrPos,tPos) 
        chr:SetPrimaryPartCFrame(newCF)
    end
end

function ATM()
    task.wait(1)
    if getgenv().atmfarm then
        for _,v in pairs(workspace.Cashiers:GetChildren()) do
            if v.Humanoid.Health > 0 then
                repeat
                    task.wait()
                    if not player.Character:FindFirstChild('Combat') then
                        player.Backpack.Combat.Parent = player.Character
                    end
                    pcall(function()
                        chr:FindFirstChild('Combat'):Activate()
                    end)
                    player.Character.HumanoidRootPart.CFrame = v.Open.CFrame + Vector3.new(0,-0.5,2)
                    lookAt(chr, v.Open)
                until v.Humanoid.Health < 1 or KO.Value == true
                if KO.Value == true then
                    forceReset()
                end
                for _,v in pairs(workspace.Ignored.Drop:GetChildren()) do
                    if v:IsA('Part') and v.Name == "MoneyDrop" then
                        if (hrp.Position - v.Position).Magnitude <= v.ClickDetector.MaxActivationDistance then
                            repeat
                                fireclickdetector(v.ClickDetector)
                                task.wait()
                            until not v:IsDescendantOf(workspace.Ignored.Drop)
                        end
                    end
                end
            end
        end
        ATM()
    end
end

function toolReach()
    for _,v in pairs(chr:GetChildren()) do
        if v:IsA('Tool') then
            v.Handle.Size = Vector3.new(40,40,40)
            v.Handle.Transparency = 1
            v.GripPos = Vector3.new(0,0,0)
        end
    end
end

function freefists()
    local loop = coroutine.create(function()
        while task.wait() do
            LeftFist.CFrame  = CFrame.new(mouse.Hit.p)
            RightFist.CFrame = CFrame.new(mouse.Hit.p)
        end
    end)

    uis.InputBegan:Connect(function(v)
        if v.KeyCode == Enum.KeyCode.Q then
            if not FreeFistToggle then
                FreeFistToggle = true
                coroutine.resume(loop)
            elseif FreeFistToggle then
                FreeFistToggle = false
                coroutine.yield(loop)
            end
        end
    end)
end

-- // Loops + Connects
chr.DescendantAdded:Connect(function(v)
    if v.Name == "Christmas_Sock" then v:Destroy() end
end)

coroutine.resume(coroutine.create(function()
    while task.wait() do
        if antislow then
            pcall(function()
                chr.BodyEffects.Movement.NoWalkSpeed:Destroy()
                chr.BodyEffects.Movement.ReduceWalk:Destroy()
                chr.BodyEffects.Movement.NoJumping:Destroy()
                chr.BodyEffects.Reload.Value = false
            end)
        end
    end
end))

coroutine.resume(coroutine.create(function()
    while task.wait() do
        if fistreach then
            pcall(function()
                if chr.BodyEffects.Attacking.Value == true then
                    for _,v in pairs(players:GetPlayers()) do
                        pcall(function()
                            if (v.Character.HumanoidRootPart.Position - chr.LeftHand.Position).Magnitude <= 50 then
                                if chr:FindFirstChildOfClass("Tool") then
                                    if chr:FindFirstChildOfClass("Tool"):FindFirstChild('Handle') then
                                        firetouchinterest(chr:FindFirstChildOfClass("Tool").Handle, v.Character.UpperTorso, 0)
                                    else
                                        firetouchinterest(chr['RightHand'], v.Character.UpperTorso, 0)
                                        firetouchinterest(chr['LeftHand'], v.Character.UpperTorso, 0)
                                        firetouchinterest(chr['RightFoot'], v.Character.UpperTorso, 0)
                                        firetouchinterest(chr['LeftFoot'], v.Character.UpperTorso, 0)
                                        firetouchinterest(chr['RightLowerLeg'], v.Character.UpperTorso, 0)
                                        firetouchinterest(chr['LeftLowerLeg'], v.Character.UpperTorso, 0)
                                    end
                                end
                            end
                        end)
                    end
                end
            end)
        end
    end
end))

coroutine.resume(coroutine.create(function()
    while task.wait() do
        if autostomp then
            MainEvent:FireServer("Stomp")
        end
    end
end))

coroutine.resume(coroutine.create(function()
    while task.wait() do
        if antistomp then
            if KO.Value == true then
                forceReset()
            end
        end
    end
end))

loader:SetProgress(332)
-- Loading Tabs
local maintab = window:Tab("Main")
local combattab = window:Tab('Combat')
local autofarmtab = window:Tab("Autofarm")
local targettab = window:Tab("Target")
local teleporttab = window:Tab('Teleports')
local animationtab = window:Tab('Animations')
local cashtab = window:Tab('Cash')
local premiumtab = window:Tab("Premium Features")

-- Loading Sections
local main = maintab:Section('Main 1')
local main2 = maintab:Section('Main 2')
local combat = combattab:Section('Combat')
local autofarm = autofarmtab:Section('Autofarm')
local target = targettab:Section('Target')
local dahoodian = animationtab:Section('Dahoodian Animations')
local barbie = animationtab:Section('Barbie Animations')
local zombie = animationtab:Section('Zombie Animations')
local vampire = animationtab:Section('Vampire Animations')
local toy = animationtab:Section('Toy Animations')
local mage = animationtab:Section('Mage Animations')
local animation = animationtab:Section('Dahoodian Animations')
local cash = cashtab:Section('Cash')

FLYSPEED = 20
main:Button('Fly [X]',function()
    local plr = game.Players.LocalPlayer
    local Humanoid = plr.Character:FindFirstChildWhichIsA('Humanoid')
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
    local speed=FLYSPEED
    local keys={a=false,d=false,w=false,s=false}
    local e1
    local e2
    local function start()
        local pos = Instance.new("BodyPosition",torso)
        local gyro = Instance.new("BodyGyro",torso)
        pos.Name="EPIXPOS"
        pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
        pos.position = torso.Position
        gyro.maxTorque = Vector3.new(15e15, 15e15, 15e15)
        gyro.cframe = torso.CFrame
        repeat
            wait()
            Humanoid.PlatformStand=true
            local new=gyro.cframe - gyro.cframe.p + pos.position
            if not keys.w and not keys.s and not keys.a and not keys.d then
                speed=FLYSPEED
            end
            if keys.w then
                new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed=speed
            end
            if keys.s then
                new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed=speed
                end
            if keys.d then
                new = new * CFrame.new(speed,0,0)
                speed=speed
            end
            if keys.a then
                new = new * CFrame.new(-speed,0,0)
                speed=speed
            end
            if speed>FLYSPEED then
                speed=FLYSPEED
            end
            pos.position=new.p
            if keys.w then
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed),0,0)
            elseif keys.s then
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed),0,0)
            else
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame
            end
            until flying == false
            if gyro then gyro:Destroy() end
            if pos then pos:Destroy() end
            flying=false
                Humanoid.PlatformStand=false
                speed=FLYSPEED
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

main:Slider('Fly Speed', 20, 100, 1, 2, "Slider",function(v)
    FLYSPEED = v
end)

main:Button('Hide User',function()
    pcall(function()
        chr['In-gameMask']:FindFirstChildWhichIsA('Model'):Destroy()
        chr['In-gameMask'].Handle:Destroy() 
    end)
end)

main:Button('Force Reset',function()
    forceReset()
end)

main:Button('Unjail',function()
    if player.DataFolder.Currency.Value >= 125 then
        chr.HumanoidRootPart.CFrame = CFrame.new(-270.831665, 21.8463116, -240.306061)
        local ClickDetector = workspace.Ignored.Shop["[Key] - $125"].ClickDetector
        repeat
            fireclickdetector(ClickDetector)
            task.wait()
        until player.Backpack:FindFirstChild('[Key]')
        chr.Humanoid:EquipTool(player.Backpack:FindFirstChild('[Key]'))
    end
end)

main:Button("Anti Lag",function(v)
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end)

main:Button('Self Destruct',function()
    -- disable all features 
    for _,v in pairs(defaultConfig) do
        if type(getgenv()[v]) == "boolean" then
            getgenv()[v] = false
        end
        if type(getgenv()[v]) == "string" then
            getgenv()[v] = ""
        end
    end
    -- reset camera
    local Camera = game.Workspace:FindFirstChildWhichIsA('Camera')
    Camera.CameraSubject = player.Character:FindFirstChildWhichIsA('Humanoid')
    spectate = false
    -- destroy gui
    for i,v in pairs(game.CoreGui:GetChildren()) do
        if string.find(v.Name, '0.') then
            for _,v in pairs(v:GetChildren()) do
                pcall(function()
                    v.Visible = false
                end)
            end
        end
    end
    -- if u got free korblox on then reset
    if not player.Character:FindFirstChild('RightFoot') then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(100, 100, 100)
        wait()
        pcall(function()
            player.Character:BreakJoints()
        end)
    end
end)

main:Button('Rejoin',function(v)
    local ts = game:GetService("TeleportService")
    local p = game:GetService("Players").LocalPlayer
    ts:Teleport(game.PlaceId, p)
end)

main:Button('Free Korblox [FE]',function(v)
    local Leg = 'Right' 
    local plr = game.Players.LocalPlayer
    local char = plr.Character
    if char.Humanoid.RigType == Enum.HumanoidRigType.R15 then
        char[Leg..'UpperLeg']:Destroy()
        char[Leg..'LowerLeg']:Destroy()
        char[Leg..'Foot']:Destroy()
        else
            char[Leg..' Leg']:Destroy()
    end
end)

main:Button('Free Korblox [CLIENT]',function()
    chr.RightLowerLeg.MeshId = "902942093"
    chr.RightLowerLeg.Transparency = "1"
    chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
    chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
    chr.RightFoot.MeshId = "902942089"
    chr.RightFoot.Transparency = "1"
end)

main:Button('Free Headless [CLIENT]',function(v)
    chr.Head.MeshId = 134082579
end)

main2:Toggle('Trash Talk',false,"Toggle",function(v)
    trashtalk = v
end)

main2:Bind('Trash Talk Keybind',Enum.KeyCode.J,false,"BindNormal",function()
    if trashtalk then
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer('Imao dogwater', 'All')
        wait(0.150)
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer('log atp', 'All')
        wait(0.150)
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer('LOL no aim', 'All')
        wait(0.150)
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer('so badd LOL', 'All')
    end
end)

main2:Toggle('Key to TP',false,"Toggle",function(v)
    keytotp = v
end)

main2:Bind('Key to TP Keybind',Enum.KeyCode.Z,false,"BindNormal",function()
    if keytotp then
        if mouse.Target then
            chr.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 2.5, mouse.Hit.z)
        end
    end
end)

main2:Toggle('Anti Bag',false,"Toggle",function(v)
    antibag = v
    for _,v in pairs(chr:GetDescendants()) do
        if v.Name == "Christmas_Sock" then v:Destroy() end
    end
end)

main2:Slider('Walkspeed', 16, 100, 1, 1, "Slider",function(v)
    chr.Humanoid.WalkSpeed = v
end)

main2:Slider('Jumppower', 50, 200, 1, 1, "Slider",function(v)
    chr.Humanoid.JumpPower = v
end)

combat:Toggle('Fist Reach',false,"Toggle",function(v)
    fistreach = v
end)

combat:Toggle('Anti Slow',false,"Toggle",function(v)
    antislow = v
end)

combat:Toggle('Auto Stomp',false,"Toggle",function(v)
    autostomp = v
end)

combat:Toggle('Anti Stomp',false,"Toggle",function(v)
    antistomp = v
end)

combat:Button('Tool Reach',function()
    toolReach()
end)

combat:Button('Free Fists [Q]',function()
    freefists()
end)

dahoodian:Button('Equip dahoodian animation preset',function()

end)

if isPremium[game.Players.LocalPlayer.UserId] then
    local premiumnotice = premiumtab:Section("Notice")
    premiumnotice:Label('Thanks for being a premium user! Enjoy these features.')
    local premium = premiumtab:Section("Premium Features")

    premium:Toggle("adax",false,"Toggle",function()
    end)

    premium:Button('yo',function()
    end)
else
    local premium = premiumtab:Section("Unauthorised Access")
    premium:Label("This section is only exclusive to Zen X Premium users.")
    premium:Label("You can purchase premium in the discord server. ($5/1.5k)")
    premium:Label(discord)
end

-- load all features
for _,v in pairs(Settings) do
    getgenv()[_] = v
end

player.CharacterAdded:Connect(function() ATM() end)

loader:SetProgress(445)
pcall(function()
    game.CoreGui:FindFirstChild('loader'):Destroy()
end)

if guiFound then
    for _,v in pairs(game.CoreGui:GetChildren()) do
        if v:FindFirstChild('MainFrameHolder') then
            for _,v in pairs(v:FindFirstChild('MainFrameHolder'):GetChildren()) do
                v.Visible = true
            end
        end
    end
end

chr.Humanoid.WalkSpeed = 16
chr.Humanoid.JumpPower = 50
FLYSPEED = 20
