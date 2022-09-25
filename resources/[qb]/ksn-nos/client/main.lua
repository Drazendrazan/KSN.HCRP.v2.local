local INPUT_CHARACTER_WHEEL = 19 -- LALT
local INPUT_VEH_ACCELERATE = 71 -- W
local INPUT_VEH_DUCK = 73 -- X
local hasNOS = 0

local function IsNitroControlPressed() --
  if not IsUsingKeyboard(2) then
    DisableControlAction(2, INPUT_VEH_DUCK)
    return IsDisabledControlPressed(2, INPUT_VEH_DUCK)
  end

  return IsControlPressed(0, INPUT_CHARACTER_WHEEL)
end

local function IsDrivingControlPressed()
  return IsControlPressed(0, INPUT_VEH_ACCELERATE)
end

local function NitroLoop(lastVehicle)
  local player  = PlayerPedId()
  local vehicle = GetVehiclePedIsIn(player)
  local driver  = GetPedInVehicleSeat(vehicle, -1)

  if lastVehicle ~= 0 and lastVehicle ~= vehicle then
    SetVehicleNitroBoostEnabled(lastVehicle, false)
    SetVehicleLightTrailEnabled(lastVehicle, false)
    SetVehicleNitroPurgeEnabled(lastVehicle, false)
    TriggerServerEvent("nitro:__sync", false, false, true)
  end

  if vehicle == 0 or driver ~= player then
    return 0
  end

  local model = GetEntityModel(vehicle)
