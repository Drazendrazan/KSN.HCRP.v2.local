QBCore = exports['qb-core']:GetCoreObject()
local RainbowNeon = false
LastEngineMultiplier = 1.0

function setVehData(veh,data)
  local multp = 0.12  -- NOS Multiplyer
  local dTrain = 0.0  -- base drivetrain
  if tonumber(data.drivetrain) == 2 then dTrain = 0.5 elseif tonumber(data.drivetrain) == 3 then dTrain = 1.0 end  --base multiplication for NOS boost base on drivetrain
  if not DoesEntityExist(veh) or not data then return nil end
  SetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDriveForce", data.boost * multp) -- takes handlingdata "fInitialDriveForce" from affected vehicle and multiplies by multp (0.12 at current) 
  SetVehicleHandlingFloat(veh, "CHandlingData", "fDriveInertia", data.acceleration * multp)
