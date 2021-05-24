local players = game:GetService("Players")
local dataStoreService = game:GetService("DataStoreService")

local saveDataStore = dataStoreService:GetDataStore("CoinsStats")

players.PlayerAdded:connect(function(plr)
	local stats = Instance.new("Folder")
	stats.Name = "leaderstats"
	stats.Parent = plr

	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Value = 0
	coins.Parent = stats

	local data = saveDataStore:GetAsync(plr.UserId)

	if data then

		for name,value in pairs(data.Stats) do 
			stats[name].Value = value

		end
	end
end)

players.PlayersRemoving:connect(function(plr)

	local saveData = {Stats = {} }

	for _,stat in pairs(plr.leaderstats:GetChildren()) do

		saveData.Stats[stat.Name = Stats.Value]

	end

	saveDataStore:setAsync(plr.UserId,saveData)

end)

game:BindToClose(function()

	for _,plr in pairs(players:GetPlayers()) do

		local saveData = {Stats = {}}

		for _,stat in pairs(plr.leaderstats:GetChildren()) do

			saveData.Stats[stat.Name] = stat.Value

		end

		saveDataStore:SetAsync(plr.UserId.saveData)

	end

	wait(2)

end)