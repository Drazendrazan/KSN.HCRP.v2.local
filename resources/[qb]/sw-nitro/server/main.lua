ESX = nil
TriggerEvent(
	"esx:getSharedObject",
	function(obj)
		ESX = obj
	end
)
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("nitro:__sync")
AddEventHandler(
	"nitro:__sync",
	function(boostEnabled, purgeEnabled, lastVehicle)
		-- Fix for source reference being lost during loop below.
		local source = source

		for _, player in ipairs(GetPlayers()) do
			if player ~= tostring(source) then
				TriggerClientEvent("nitro:__update", player, source, boostEnabled, purgeEnabled, lastVehicle)
			end
		end
	end
)
RegisterNetEvent('qb-weed:server:placePlant', function(coords, sort, currentHouse)
    local random = math.random(1, 2)
    local gender
    if random == 1 then
        gender = "man"
    else
        gender = "woman"
    end
    MySQL.insert('INSERT INTO house_plants (building, coords, gender, sort, plantid) VALUES (?, ?, ?, ?, ?)',
        {currentHouse, coords, gender, sort, math.random(111111, 999999)})
    TriggerClientEvent('qb-weed:client:refreshHousePlants', -1, currentHouse)
end)


ESX.RegisterUsableItem(
	"nos",
	function(source)
		local count = exports.ox_inventory:Search(source, "count", "nos")
		if count > 0 then
			exports.ox_inventory:RemoveItem(source, "nos", 1)
			TriggerClientEvent("nitro:fillTank", source)
		end
	end
)
