-- Create a new blip for the federal agency
local agencyBlip = AddBlipForCoord(441.47143554688, -981.21661376953, 30.689594268799)

-- Set the blip to be a federal agency blip
SetBlipSprite(agencyBlip, 60)
SetBlipAsShortRange(agencyBlip, true)

-- Set the blip name and display it
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Federal Agency")
EndTextCommandSetBlipName(agencyBlip)

-- Create a marker for the federal agency
local agencyMarker = CreateMarker(441.47143554688, -981.21661376953, 30.689594268799, "cylinder", 1.0, 0, 0, 0, 0)

-- Create a ped for the federal agency
local agencyPed = CreatePed(4, 0xD47303AC, 441.47143554688, -981.21661376953, 30.689594268799, 0.0, true, false)

-- Set the ped as friendly
SetPedAsCop(agencyPed, true)
SetPedRelationshipGroupHash(agencyPed, GetHashKey("AGENCY"))

-- Set the ped to patrol the area around the federal agency
TaskStartScenarioInPlace(agencyPed, "WORLD_HUMAN_COP_IDLES", 0, true)

-- Set up a interaction event for the federal agency
AddTextEntry('FE_THDR_GTAO', 'Press E to interact with the federal agency')

-- Create a function to handle player interaction with the federal agency
function OnAgencyInteraction(playerPed, coords)
  local playerPedCoords = GetEntityCoords(playerPed, false)

  -- Check if the player is within range of the federal agency marker
  if GetDistanceBetweenCoords(playerPedCoords, coords, true) < 2.0 then
    -- Display the interaction prompt
    ShowHelpTextThisFrame('FE_THDR_GTAO', false)

    -- Check if the player pressed the interaction key
    if IsControlJustReleased(0, 38) then
      -- Open a menu for the player to choose an interaction
      local options = {
        'Report a crime',
        'Request backup',
        'Get an agency vehicle',
        'Arrest a player',
        'Trace a player\'s phone'
      }

      local option, index = DisplayOptionsMenu('Federal Agency', options)

      if option == 'Report a crime' then
        -- Code to handle crime reporting goes here
      elseif option == 'Request backup' then
        -- Code to handle backup requests goes here
      elseif option == 'Get an agency vehicle' then
        -- Code to handle vehicle requests goes here
      elseif option == 'Arrest a player' then
        -- Code to handle player arrests goes here
      elseif option == 'Trace a player\'s phone' then
        -- Code to handle phone tracing goes here
      end
    end
  end
end

-- Create a loop to check for player interaction with the federal agency
