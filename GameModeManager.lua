local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remotes = ReplicatedStorage:WaitForChild("Remotes")
local liftEvent = remotes:WaitForChild("LiftEvent")

liftEvent.OnServerEvent:Connect(function(player, amount)
	local leaderstats = player:FindFirstChild("leaderstats")
	if leaderstats then
		local strength = leaderstats:FindFirstChild("Strength")
		if strength then
			strength.Value = strength.Value + amount
			print(player.Name .. " получил +" .. amount)
		end
	end
end)

print("✅ GameModeManager работает")
