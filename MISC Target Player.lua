local TargetN = "None"


target:Textbox("Target Name (Not Display)",true, function(value)
    for _, v in pairs(game:GetService("Players"):GetChildren()) do
        if (string.sub(string.lower(v.Name), 1, string.len(value))) == string.lower(value) then
            TargetN = v.Name
        end
    end
        spawn(function()
wait(0.5)
game.StarterGui:SetCore("SendNotification", {
Title = "Current Target"; 
Text = TargetN; 
Icon = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" .. TargetN; 
Duration = 5; 
})
            end)
end)

target:Button("Go To", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[TargetN].Character.HumanoidRootPart.CFrame
end)


target:Toggle("Spectate",false, function(spec)
    if spec == true then
game:GetService("Workspace"):FindFirstChild("Camera").CameraSubject = game:GetService("Players")[TargetN].Character:FindFirstChildOfClass("Humanoid")
    elseif spec == false then
game:GetService("Workspace"):FindFirstChild("Camera").CameraSubject = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
end	
end)

target:Button("Target Info", function()
   	game.StarterGui:SetCore("SendNotification", {Title = "System", Text = "Press F9 and scroll down to find users info!", Duration = 15, Button1 = "Okay"})
	print("------------------")
	print(""..game:GetService("Players")[TargetN].Name.." Backpack:")
	for i, v in pairs(game:GetService("Players")[TargetN].Backpack:GetDescendants()) do
		if v:IsA("Tool") then
			print(""..v.Name.."")
		end
	end
	print("------------------")
	print(""..game:GetService("Players")[TargetN].Name.." | Information:")
	print("Account Age: "..game:GetService("Players")[TargetN].AccountAge.." Days")
	print("User ID: "..game:GetService("Players")[TargetN].UserId)
	print("Shirt Template: "..game:GetService("Players")[TargetN].Character.Shirt.ShirtTemplate)
	print("Pants Template: "..game:GetService("Players")[TargetN].Character.Pants.PantsTemplate)
	print("------------------")
end)
