Copy code
-- Create a new blip for the police department
local policeBlip = AddBlipForCoord(441.47143554688, -981.21661376953, 30.689594268799)

-- Set the blip to be a police department blip
SetBlipSprite(policeBlip, 60)
SetBlipAsShortRange(policeBlip, true)

-- Set the blip name and display it
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Police Department")
EndTextCommandSetBlipName(policeBlip)

-- Create a marker for the police department
local policeMarker = CreateMarker(441.47143554688, -981.21661376953, 30.689594268799, "cylinder", 1.0, 0, 0, 0, 0)

-- Create a ped for the police department
local policePed = CreatePed(4, 0xD47303AC, 441.47143554688, -981.21661376953, 30.689594268799, 0.0, true, false)

-- Set the ped as friendly
SetPedAsCop(policePed, true)
SetPedRelationshipGroupHash(policePed, GetHashKey("COP"))

-- Set the ped to patrol the area around the police department
TaskStartScenarioInPlace(policePed, "WORLD_HUMAN_COP_IDLES", 0, true)

-- Set up a interaction event for the police department
AddTextEntry('FE_THDR_GTAO', 'Press E to interact with the police department')

-- Create a function to handle player interaction with the police department
function OnPoliceInteraction(playerPed, coords)
  local playerPedCoords = GetEntityCoords(playerPed, false)

  -- Check if the player is within range of the police department marker
  if GetDistanceBetweenCoords(playerPedCoords, coords, true) < 2.0 then
    -- Display the interaction prompt
    ShowHelpTextThisFrame('FE_THDR_GTAO', false)

    -- Check if the player pressed the interaction key
    if IsControlJustReleased(0, 38) then
      -- Open a menu for the player to choose an interaction
      local options = {
        'Report a crime',
        'Request backup',
        'Get a police vehicle'
      }

      local option, index = DisplayOptionsMenu('Police Department', options)

      if option == 'Report a crime' then
        -- Code to handle crime reporting goes here
      elseif option == 'Request backup' then
        -- Code to handle backup requests goes here
      elseif option == 'Get a police vehicle' then
        -- Code to handle police vehicle requests goes here
      end
    end
  end
end

-- Create a loop to check for player interaction with the police department
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    local playerPed = PlayerPedId()
    local playerPedCoords = GetEntityCoords(playerPed, false)

    OnPoliceInteraction(playerPed, policeMarkerCoords)
  end
end)
