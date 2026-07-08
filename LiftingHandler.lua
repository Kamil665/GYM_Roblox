local Tool = script.Parent -- Скрипт должен лежать ПРЯМО внутри Tool
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local leaderstats = player:WaitForChild("leaderstats", 10)
local strength = leaderstats and leaderstats:WaitForChild("Strength", 5)

local debounce = false
local cooldown = 0.5 

-- Проверяем, что скрипт действительно находится внутри инструмента
if Tool:IsA("Tool") then
	Tool.Activated:Connect(function()
		local character = player.Character
		if not character or debounce then return end

		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid and humanoid.Health > 0 then
			debounce = true

			-- Отправляем сигнал на сервер, что мы покачались
			local remote = game:GetService("ReplicatedStorage"):FindFirstChild("LiftEvent")
			if remote then
				remote:FireServer()
			end

			task.wait(cooldown)
			debounce = false
		end
	end)
else
	warn("LiftingHandler ошибся: Скрипт лежит не внутри Tool! Пожалуйста, перенесите его в ваш инструмент.")
end
