local dataStoreService = game:GetService("DataStoreService")
local players = game:GetService("Players")

local globalDataStore = dataStoreService:GetOrderedDataStore("Coins")
local board = workspace.LeaderBoardPart

local template = board.SurfaceGui.Leaderboard.Template:Clone()
board.SurfaceGui.Leaderboard.Template:Destroy()

local function update()

	local succes,err = pcall (function()

		local data = globalDataStore:GetSortedAsync(false,90)
		local page = data:GetCurrentPage()

		for rank,plrData in ipairs(page) do

			local userid = plrData.key
			local Coins = plrData.value

			local new = template:Clone()
			new.PlrName.Text = players:GetUserIdFromNameAsync(userid)
			new.PlrAmount.Text = Coins
			new.LayoutOrder = rank
			
			new.Parent = board.SurfaceGui.Leaderboard

		end

	end)

end

while true do 

	update()

	wait(math.random(2,5))

	spawn (function()

		for _,plr in pairs(game.Players:GetPlayers()) do

			globalDataStore:SetAsync(plr.UserId,plr.leaderstats.Coins.Value)
			wait (math.random(2,4) )

		end

	end)

end