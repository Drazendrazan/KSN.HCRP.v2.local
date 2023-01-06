-- Load the vehicles.meta file
local vehicles = xmlLoadFile("vehicles.meta")

-- Create two gas station markers and blips
local gasStation1 = createMarker(x1, y1, z1, "cylinder", 3, 255, 0, 0)
local gasStation2 = createMarker(x2, y2, z2, "cylinder", 3, 255, 0, 0)
local gasStation1Blip = createBlip(x1, y1, z1, 55)
local gasStation2Blip = createBlip(x2, y2, z2, 55)

-- Define the base price of gasoline
local basePrice = 10

-- Calculate the current price of gasoline based on the current value of incity coins
function calculatePrice(incityCoins)
    return basePrice * incityCoins
end

-- Event handler for when a player enters a gas station marker
addEventHandler("onMarkerHit", root, function(player)
    -- Check if the player is in a vehicle
    if not isPedInVehicle(player) then
        return
    end

    -- Get the player's vehicle and its name
    local vehicle = getPedOccupiedVehicle(player)
    local name = getVehicleName(vehicle)

    -- Get the fuel capacity of the vehicle from the vehicles.meta file
    local fuelCapacity = xmlNodeGetAttribute(xmlFindChild(vehicles, "vehicle", "name", name), "fuelCapacity")

    -- Calculate the amount of fuel needed to fill the vehicle's tank
    local fuelNeeded = math.ceil(fuelCapacity - vehicleFuelLevel)

    -- Calculate the total cost of the fuel
    local totalCost = fuelNeeded * calculatePrice(incityCoins)

    -- Check if the player can afford the fuel
    if getPlayerMoney(player) < totalCost then
        outputChatBox("You can't afford this much fuel!", player)
        return
    end

    -- Take the money from the player
    takePlayerMoney(player, totalCost)

    -- Give the vehicle the fuel it needs
    setVehicleFuelLevel(vehicle, fuelCapacity)

    -- Let the player know their vehicle has been refuelled
    outputChatBox("Your vehicle has been refuelled!", player)
end)
