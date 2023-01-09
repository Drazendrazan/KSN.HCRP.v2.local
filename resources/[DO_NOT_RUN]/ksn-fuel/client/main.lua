local QBCore = exports['qb-core']:GetCoreObject()
local isNearPump = false
local isFueling = false
local currentFuel = 0.0
local currentCost = 0.0
local todaycost = 0
local currentCash = 0
local fuelSynced = false
local inBlacklisted = false
local vehicles = xmlLoadFile("vehicle.meta")
local basePrice = 10


function SetFuel(vehicle, fuel)
	if type(fuel) == 'number' and fuel >= 0 and fuel <= 100 then
		SetVehicleFuelLevel(vehicle, fuel + 0.0)
		DecorSetFloat(vehicle, Config.FuelDecor, GetVehicleFuelLevel(vehicle))
	end
end

function LoadAnimDict(dict)
	if not HasAnimDictLoaded(dict) then
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Wait(1)
		end
	end

	.
end
