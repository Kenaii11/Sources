while wait() do
                if game.Players.LocalPlayer.Character.BodyEffects.Armor.Value < 10 then
                    _G.savedhumanoidpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-606.316345, 10.3496914, -788.285034)
                    wait(.2)
                    fireclickdetector(game.Workspace.Ignored.Shop['[High-Medium Armor] - $2300'].ClickDetector)
                    wait()
                    fireclickdetector(game.Workspace.Ignored.Shop['[High-Medium Armor] - $2300'].ClickDetector)
                    wait(.2)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(_G.savedhumanoidpos)
                end
            end  
