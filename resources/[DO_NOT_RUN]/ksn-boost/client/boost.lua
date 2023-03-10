local vehicles = {}

function SetNitroBoostScreenEffectsEnabled(enabled) --sets animations on screens
	if enabled then
		AnimpostfxStop("RaceTurbo") -- reset RaceTurbo to off
		AnimpostfxPlay("RaceTurbo", 0, false)
		SetTimecycleModifier("rply_motionblur") -- Enables MotionBlur on screen
		ShakeGameplayCam("SKY_DIVING_SHAKE", 0.25) -- you can modify this for how much screen shake you see
	else
		StopGameplayCamShaking(true) -- stop screen shake
		SetTransitionTimecycleModifier("default", 0.35)
	end
end

function IsVehicleNitroBoostEnabled(vehicle)
	return vehicles[vehicle] and vehicles[vehicle].enabled or false
end

function SetVehicleNitroBoostEnabled(vehicle, enabled) -- Enable NitroBoost Function in vehicles
	if IsVehicleNitroBoostEnabled(vehicle) == enabled then
		return
	end

	if IsPedInVehicle(PlayerPedId(), vehicle) or not enabled then --ensure that vehicle has a player in it
		SetNitroBoostScreenEffectsEnabled(enabled)
	end

	SetVehicleBoostActive(vehicle, enabled)
	vehicles[vehicle] = {
		enabled = enabled,
		nitroTankSize = GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveForce") * 10
	}
end

Citizen.CreateThread(
	function()
		local function BackfireLoop()
			-- TODO: Only do this for nearby vehicles.
			for vehicle in pairs(vehicles) do
				CreateVehicleExhaustBackfire(vehicle, 1.25)
			end
		end

		while true do
			Citizen.Wait(0)
			BackfireLoop()
		end
	end
)

Citizen.CreateThread(
	function()
		local function BoostLoop()
			local player = PlayerPedId()
			local vehicle = GetVehiclePedIsIn(player)
			local driver = GetPedInVehicleSeat(vehicle, -1)
			local enabled = IsVehicleNitroBoostEnabled(vehicle)

			if vehicle == 0 or driver ~= player or not enabled then
				return
			end

			-- TODO: Use better math. The effect of nitro is quite extreme for cars with
			-- custom handling, while slow cars have almost no effect from this at all.
			-- Also, maybe torque is not the correct setting to change.
			if not IsVehicleStopped(vehicle) then
				local vehicleData = vehicles[vehicle]
				local vehicleModel = GetEntityModel(vehicle)
				local currentSpeed = GetEntitySpeed(vehicle)
				local maximumSpeed = GetVehicleModelEstimatedMaxSpeed(vehicleModel)
				local multiplier = 2.5 * maximumSpeed / currentSpeed
        if multiplier < 1.1 then
					multiplier = 1.1
				end

				SetVehicleCheatPowerIncrease(vehicle, multiplier)
			end
		end

		while true do
			Citizen.Wait(0)
			BoostLoop()
		end
	end
)
