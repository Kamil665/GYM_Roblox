local TextLabel = script.Parent
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Безопасное получение leaderstats и Strength (из инструкции)
local leaderstats = player:WaitForChild("leaderstats", 10)
local strength = leaderstats and leaderstats:WaitForChild("Strength", 5)

if strength then
	local function updateUI(currentValue)
		-- Красивое отображение текста (например: "Сила: 150")
		TextLabel.Text = "Сила: " .. tostring(currentValue)
	end

	-- Обновляем UI при изменении значения силы
	strength.Changed:Connect(updateUI)
	-- Устанавливаем начальное значение
	updateUI(strength.Value)
else
	TextLabel.Text = "Загрузка..."
	warn("UI Script: Не удалось найти leaderstats или Strength")
end
