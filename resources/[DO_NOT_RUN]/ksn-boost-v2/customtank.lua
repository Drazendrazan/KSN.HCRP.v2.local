local vehicles = {}
local nitroTankSizes = {}
local lastNitro = 0
local nitroCooldown = 2500 -- TODO: per-vehicle cooldown?

function InitNitroFuel(vehicle)
	if not vehicles[vehicle] then
		vehicles[vehicle] = 0
	end

	if not nitroTankSizes[vehicle] then
		nitroTankSizes[vehicle] = 2000
	end
end

function DrainNitroFuel(vehicle, purge)
	if not purge then
		purge = false
	end

	if not vehicles[vehicle] then
		vehicles[vehicle] = 0
	end

	if not nitroTankSizes[vehicle] then
		nitroTankSizes[vehicle] = 2000
	end

	if vehicles[vehicle] > 0 then
		if purge then
			vehicles[vehicle] = vehicles[vehicle] - nitroFuelDrainRate * 2
		else
			vehicles[vehicle] = vehicles[vehicle] - nitroFuelDrainRate
		end
		lastNitro = GetGameTimer()
	end
end

function RechargeNitroFuel(vehicle)
	if not vehicles[vehicle] then
		vehicles[vehicle] = 0
	end

	if not nitroTankSizes[vehicle] then
		nitroTankSizes[vehicle] = 2000
	end

	if vehicles[vehicle] and vehicles[vehicle] < nitroTankSizes[vehicle] then
		vehicles[vehicle] = vehicles[vehicle] + nitroRechargeRate
	end
end

function GetNitroFuelLevel(vehicle)
	if vehicles[vehicle] then
		return math.max(0, vehicles[vehicle])
	end

	return 0
end

function SetNitroFuelLevel(vehicle, level)
	vehicles[vehicle] = level
end

function SetNitroTankSize(vehicle, size)
	nitroTankSizes[vehicle] = size
end

Citizen.CreateThread(
	function()
		local function FuelLoop()
			local player = PlayerPedId()
			local vehicle = GetVehiclePedIsIn(player)
			local driver = GetPedInVehicleSeat(vehicle, -1)
			local isRunning = GetIsVehicleEngineRunning(vehicle)
			local isBoosting = IsVehicleNitroBoostEnabled(vehicle)
			local isPurging = IsVehicleNitroPurgeEnabled(vehicle)

			if vehicle == 0 or driver ~= player or not isRunning then
				return
			end

			if isRunning then
				if isBoosting == false and isPurging == false and GetGameTimer() > lastNitro + nitroCooldown then
					RechargeNitroFuel
