local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

local dataStore = DataStoreService:GetDataStore("PlayerStrengthV1")

local function loadPlayerData(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local strength = Instance.new("NumberValue")
	strength.Name = "Strength"
	strength.Value = 0
	strength.Parent = leaderstats
	
	local success, data = pcall(function()
		return dataStore:GetAsync("Player_" .. player.UserId)
	end)
	
	if success and data then
		strength.Value = data.Strength or 0
		cash.Value = data.Cash or 0
	end
end

local function savePlayerData(player)
	local leaderstats = player:FindFirstChild("leaderstats")
	if not leaderstats then return end
	
	local data = {
		Strength = leaderstats.Strength.Value,
		Cash = leaderstats.Cash.Value
	}
	
	pcall(function()
		dataStore:SetAsync("Player_" .. player.UserId, data)
	end)
end

Players.PlayerAdded:Connect(loadPlayerData)
Players.PlayerRemoving:Connect(savePlayerData)

while true do
	wait(60)
	for _, player in ipairs(Players:GetPlayers()) do
		savePlayerData(player)
	end
end
