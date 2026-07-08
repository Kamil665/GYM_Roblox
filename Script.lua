-- SimpleWeight (Script внутри Tool, НЕ внутри Handle!)

local tool = script.Parent

tool.Activated:Connect(function()
	local character = tool.Parent
	local player = game.Players:GetPlayerFromCharacter(character)

	if player then
		local leaderstats = player:WaitForChild("leaderstats", 5) -- ждём 5 секунд
		if leaderstats then
			local strength = leaderstats:WaitForChild("Strength", 3)
			if strength then
				strength.Value += 25
				print("✅ +25 силы! Текущая: " .. strength.Value)
			end
		else
			warn("Leaderstats не загрузился")
		end
	end
end)

print("✅ SimpleWeight полностью готов")
