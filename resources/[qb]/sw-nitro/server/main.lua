ESX = nil
TriggerEvent(
	"esx:getSharedObject",
	function(obj)
		ESX = obj
	end
)

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
