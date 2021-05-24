local datastore = game:GetService("DataStoreService")
local ds1 = datastore:GetDataStore("Clicks1")
local ds2 = datastore:GetDataStore("Rebirths1")


game.Players.PlayerAdded:connect(function(plr)
	local folder = Instance.new("Folder", plr)
	folder.Name = "leaderstats"
	local rebirth = Instance.new("IntValue", folder)
	rebirth.Name = "Coins"

    local data = saveDataStore:GetAsync(plr.UserId)

	if data then

		for name,value in pairs(data.Stats) do 
			stats[name].Value = value

		end
	end
end)
	
	rebirth.Value = ds1:GetAsync(plr.UserId) or 0
	ds1:SetAsync(plr.UserId, rebirth.Value)
	
	guest.Value = ds2:GetAsync(plr.UserId) or 0
	ds2:SetAsync(plr.UserId, guest.Value)
	
	
	
	rebirth.Changed:connect(function()
		ds1:SetAsync(plr.UserId, rebirth.Value)
	end)
	
	guest.Changed:connect(function()
		ds2:SetAsync(plr.UserId, guest.Value)
	end)
end)