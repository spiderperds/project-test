game.Players.PlayerAdded:Connect(function(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local coins = Instance.new("IntValue")
    coins.Name = "Coins"
    coins.Value = 0
    coins.Parent = leaderstats
end)

local mainGame = game.Workspace:WaitForChild("MainGame")
local coins = mainGame:WaitForChild("Coins")

for _, coin in pairs(coins:GetChildren()) do
    coin.Touched:Connect(function (otherPart)
        local humanoid = otherPart.Parent:FindFirstChild("Humanoid")
        local player = game.Players:GetPlayerFromCharacter(otherPart.Parent)
        local touched = coin:FindFirstChild("Touched")

        if humanoid and player and touched and touched.Value == false then
            touched.Value = true

            player.leaderstats.Coins.Value += 1

            coin.Transparency = 0.75 
        end

        task.wait(5)
        touched.Value = false
        coin.Transparency = 0
    end)
end