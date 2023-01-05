-- Set the ped's position
local pedX = 441.47143554688
local pedY = -981.21661376953
local pedZ = 30.689594268799

-- Create the ped
local ped = CreatePed(4, 0xD47303AC, pedX, pedY, pedZ, 0.0, true, false)

-- Give the ped a briefcase
GiveWeaponToPed(ped, 0x88C78EB7E70AC5E9, 1, false, true)

-- Set up the ped's AI
TaskWanderStandard(ped, true, true)

-- Set up a interaction event for the ped
AddTextEntry('FE_THDR_GTAO', 'Press E to steal the briefcase')

-- Create a function to handle player interaction with the ped
function OnPedInteraction(playerPed, coords)
  local playerPedCoords = GetEntityCoords(playerPed, false)

  -- Check if the player is within range of the ped
  if GetDistanceBetweenCoords(playerPedCoords, coords, true) < 2.0 then
    -- Display the interaction prompt
    ShowHelpTextThisFrame('FE_THDR_GTAO', false)

    -- Check if the player pressed the interaction key
    if IsControlJustReleased(0, 38) then

    -- Check if the player is holding a weapon
      if IsPedArmed(playerPed, 7) then

    -- Give the player the briefcase
      GiveWeaponToPed(playerPed, 0x88C78EB7E70AC5E9, 1, false, true)

      -- Remove the ped from the world
      SetEntityAsMissionEntity(ped, false, true)
      DeleteEntity(ped)
    end
  end
end

-- Create a loop to check for player interaction with the ped
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    local playerPed = PlayerPedId()
    local pedCoords = GetEntityCoords(ped, false)

    OnPedInteraction(playerPed, pedCoords)
  end
end)
