local target = "PlayerName"

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[target].Character.Head.CFrame --game.Players[target].Character.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0)
game.Players.LocalPlayer.Character.Humanoid.Sit = true
