-- Set up a server event to handle requests to refuel a vehicle
RegisterServerEvent("refuelVehicle")
AddEventHandler(
	"refuelVehicle",
	function(vehicleId)
		local player = source
		local vehicle = GetVehiclePedIsIn(player)

		if vehicle == 0 or vehicle ~= vehicleId then
			TriggerClientEvent("showNotification", player, "You must be in the vehicle you want to refuel.")
			return
		end

		local vehicleOwner = GetEntityOwner(vehicle)
		if vehicleOwner ~= player then
			TriggerClientEvent("showNotification", player, "You do not have permission to refuel this vehicle.")
			return
		end

		-- Check if the nitro tank is already full
		if GetNitroFuelLevel(vehicle) >= GetNitroTankSize(vehicle) then
			TriggerClientEvent("showNotification", player, "The nitro tank is already full.")
			return
		end

		-- Charge the player a fee for refilling the nitro tank
		local fee = 100
		if not CanPlayerAfford(player, fee) then
			TriggerClientEvent("showNotification", player, "You cannot afford to refuel the nitro tank.")
			return
		end
		RemovePlayerMoney(player, fee)

		-- Refill the nitro tank
		SetNitroFuelLevel(vehicle, GetNitroTankSize(vehicle))
		TriggerClientEvent("showNotification", player, "The nitro tank has been refilled.")
	end
)
