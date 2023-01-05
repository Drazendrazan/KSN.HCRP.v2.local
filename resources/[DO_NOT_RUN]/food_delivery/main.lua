-- Create a new blip for the food delivery business
local deliveryBlip = AddBlipForCoord(441.47143554688, -981.21661376953, 30.689594268799)

-- Set the blip to be a delivery blip
SetBlipSprite(deliveryBlip, 85)
SetBlipAsShortRange(deliveryBlip, true)

-- Set the blip name and display it
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Food Delivery Business")
EndTextCommandSetBlipName(deliveryBlip)

-- Create a marker for the delivery business
local deliveryMarker = CreateMarker(441.47143554688, -981.21661376953, 30.689594268799, "cylinder", 1.0, 0, 0, 0, 0)

-- Set up a interaction event for the delivery business
AddTextEntry('FE_THDR_GTAO', 'Press E to interact with the delivery business')

-- Create a function to handle player interaction with the delivery business
function OnDeliveryInteraction(playerPed, coords)
  local playerPedCoords = GetEntityCoords(playerPed, false)

  -- Check if the player is within range of the delivery business marker
  if GetDistanceBetweenCoords(playerPedCoords, coords, true) < 2.0 then
    -- Display the interaction prompt
    ShowHelpTextThisFrame('FE_THDR_GTAO', false)

    -- Check if the player pressed the interaction key
    if IsControlJustReleased(0, 38) then
      -- Open a menu for the player to choose an interaction
      local options = {
        'Get a delivery vehicle',
        'Start a delivery'
      }

      local option, index = DisplayOptionsMenu('Food Delivery Business', options)

      if option == 'Get a delivery vehicle' then
        -- Code to handle vehicle requests goes here
      elseif option == 'Start a delivery' then
        -- Create a delivery blip for the player
        local deliveryBlip = AddBlipForEntity(playerPed)

        -- Set the delivery blip to be a delivery blip
        SetBlipSprite(deliveryBlip, 85)
        SetBlipAsShortRange(deliveryBlip, true)

        -- Set the delivery blip name and display it
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Food Delivery")
        EndTextCommandSetBlipName(deliveryBlip)

        -- Set up a interaction event for the delivery
        AddTextEntry('FE_THDR_GTAO', 'Press E to deliver the food')

        -- Create a function to handle player interaction with the delivery
        function OnDelivery(playerPed, coords)
          local playerPedCoords = GetEntityCoords(playerPed, false)

          -- Check if the player is within range of the delivery location
          if GetDistanceBetweenCoords(playerPedCoords, coords, true) < 2.0 then
            -- Display the interaction prompt
            ShowHelpTextThisFrame('FE_THDR_GTAO', false)

            -- Check if the player pressed
