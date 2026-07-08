local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")

-- Безопасное получение leaderstats и Strength (из инструкции)
local leaderstats = player:WaitForChild("leaderstats", 10)
local strength = leaderstats and leaderstats:WaitForChild("Strength", 5)

if strength then
	local function scaleCharacter(currentStrength)
		-- Формула масштабирования (базовый размер 1 + бонус от силы)
		-- Например: при 1000 силы размер увеличится в 2 раза (1 + 1000/1000)
		local scaleMultiplier = 1 + (currentStrength / 1000) 

		-- Ограничим максимальный размер (например, максимум в 3 раза больше)
		scaleMultiplier = math.clamp(scaleMultiplier, 1, 3)

		-- Изменяем параметры масштаба R15 персонажа
		local bodyHeight = humanoid:FindFirstChild("BodyHeightScale")
		local bodyWidth = humanoid:FindFirstChild("BodyWidthScale")
		local bodyDepth = humanoid:FindFirstChild("BodyDepthScale")
		local headScale = humanoid:FindFirstChild("HeadScale")

		if bodyHeight then bodyHeight.Value = scaleMultiplier end
		if bodyWidth then bodyWidth.Value = scaleMultiplier end
		if bodyDepth then bodyDepth.Value = scaleMultiplier end
		if headScale then headScale.Value = scaleMultiplier end
	end

	-- Срабатывает при изменении силы
	strength.Changed:Connect(scaleCharacter)
	-- Вызываем один раз при старте
	scaleCharacter(strength.Value)
else
	warn("CharacterScaler: Не удалось загрузить Strength")
end
