local fuelTruckLocation = {x = 441.47143554688, y = -981.21661376953, z = 30.689594268799}
local fuelTruckBlip = nil
local fuelTruckMarker = nil

-- Create a blip on the map to mark the location of the fuel truck
fuelTruckBlip = AddBlipForCoord(fuelTruckLocation.x, fuelTruckLocation.y, fuelTruckLocation.z)
SetBlipSprite(fuelTruckBlip, 361)
SetBlipScale(fuelTruckBlip, 0.7)
SetBlipColour(fuelTruckBlip, 2)
SetBlipAsShortRange(fuelTruckBlip, true)

-- Create a marker at the location of the fuel truck
fuelTruckMarker = CreateMarker(4, fuelTruckLocation.x, fuelTruckLocation.y, fuelTruckLocation.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 3.0, 255, 0, 0, 50, false, true, 2, false, false, false, false)

-- Set up a server event to handle player interaction with the fuel truck
AddEventHandler(
	"playerEnterMarker",
	function(marker)
		if marker == fuelTruckMarker then
			TriggerClientEvent("openFuelMenu", source)
		end
	end
)

-- Set up a server event to handle requests to refuel a vehicle
RegisterServerEvent("refuelVehicle")
AddEventHandler(
	"refuelVehicle",
	function(vehicleId)
		local player = source
		local vehicle = GetVehiclePedIsIn(player)

		if vehicle == 0 or vehicle ~= vehicleId then
			TriggerClientEvent("showNotification", player, "You must be in the vehicle you want
