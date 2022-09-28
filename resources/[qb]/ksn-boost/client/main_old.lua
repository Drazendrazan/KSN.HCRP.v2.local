QBCore = exports['qb-core']:GetCoreObject()
LastEngineMultiplier = 1.0

function setVehData(veh,data) -- takes vehicle data from the CHandlingData and multiplies by local variables found below.
  --
  local multp = 0.12  -- NOS Multiplyer
  local dTrain = 0.0  -- base drivetrain
  --
  if tonumber(data.drivetrain) == 2 then dTrain = 0.5 elseif tonumber(data.drivetrain)
  if not DoesEntityExist(veh) or not data then return nil end
  SetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDriveForce", data.boost * multp)
  SetVehicleHandlingFloat(veh, "CHandlingData", "fDriveInertia", data.acceleration * multp)
  SetVehicleEnginePowerMultiplier(veh, data.gearchange * multp)
  LastEngineMultiplier = data.gearchange * multp
  SetVehicleHandlingFloat(veh, "CHandlingData", "fDriveBiasFront", dTrain*1.0)
  SetVehicleHandlingFloat(veh, "CHandlingData", "fBrakeBiasFront", data.breaking * multp)
end

function resetVeh(veh) -- takes vehicle data from CHandlingData and resets to base levels. at least for nos. CHandlingData is not affected by this.
  SetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDriveForce", 1.0)
  SetVehicleHandlingFloat(veh, "CHandlingData", "fDriveInertia", 1.0)
  SetVehicleEnginePowerMultiplier(veh, 1.0)
  SetVehicleHandlingFloat(veh, "CHandlingData", "fDriveBiasFront", 0.5)
  SetVehicleHandlingFloat(veh, "CHandlingData", "fBrakeBiasFront", 1.0)
end
