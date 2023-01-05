local refuelingTruck = nil
local isRefueling = false

-- Set up a marker for the refueling truck
local refuelingTruckMarker = {
	type = 1,
	x = 441.471435,
	y = -1675.117188,
	z = 28.6923,
	color = {r = 0, g = 255, b = 0},
	scale = 0.7
}

-- Set up a blip for the refueling truck
local refuelingTruckBlip = {
	x = 441.471435,
	y = -1675.117188,
	z = 28.6923,
	color = 2,
	scale = 0.7
}

-- Set up a prompt for interacting with the refueling truck
local refuelingTruckPrompt = {
	text = "Press ~INPUT_CONTEXT~ to open the refueling truck menu.",
	button1 = "Refuel",
	button2 = "Close"
}

-- Set up a notification for when the player begins refueling a vehicle
local refuelingStartedNotification = {
	text = "Refueling started.",
	type = 0,
	timeout = 2000
}

-- Set up a notification for when the player stops refueling a vehicle
local refuelingStoppedNotification = {
	text = "Refueling stopped.",
	type = 0,
	timeout = 2000
}

-- Set up a notification for when the player does not have enough money to refuel a vehicle
local refuelingFailedNotification = {
	text = "You do not have enough money to refuel this vehicle.",
	type = 0,
	timeout = 2000
}

-- Set up a notification for when the player has refilled a vehicle
local refuelingSuccessNotification = {
	text = "Vehicle refueled.",
	type = 0,
	timeout = 2000
}

-- Set up a notification for when the player is not close enough to a vehicle to refuel it
local refuelingRangeNotification = {
	text = "You are not close enough to a vehicle to refuel it.",
	type = 0,
	timeout = 2000
}

-- Set up a notification for when the player is not in a vehicle
local refuelingNotInVehicleNotification = {
	text = "You must be in a vehicle to refuel it.",
	type = 0
