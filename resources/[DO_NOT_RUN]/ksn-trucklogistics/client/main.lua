-- Set up the tablet object
local tablet = CreateObject(GetHashKey("prop_cs_tablet"), 0, 0, 0, true, true, true)

-- Set up the blip for the tablet
local tabletBlip = AddBlipForCoord(0, 0, 0)
SetBlipSprite(tabletBlip, 434)
SetBlipAsShortRange(tabletBlip, true)

-- Set up the marker for the tablet
local tabletMarker = CreateMarker(0, 0, 0, "cylinder", 1.0, 255, 0, 0, 150, player)

-- Set up the distance at which the player can interact with the tablet
local tabletInteractionDistance = 5.0

-- Set up the prompt for interacting with the tablet
local tabletPrompt = "Press ~INPUT_CONTEXT~ to access the delivery tablet"

-- Set up the camera for the tablet
local tabletCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
SetCamCoord(tabletCam, 0, 0, 0)
SetCamRot(tabletCam, 0, 0, 0)

-- Set up the scaleform for the tablet
local tabletScaleform = RequestScaleformMovie("HACKING_PC")

-- Set up a flag to track whether the tablet is being used
local tabletInUse = false

-- Function to update the position and heading of the tablet
function UpdateTabletPosition(player)
	local playerCoords = GetEntityCoords(player)
	local playerHeading = GetEntityHeading(player)

	SetEntityCoords(tablet, playerCoords)
	SetEntityHeading(tablet, playerHeading)
	SetBlipCoords(tabletBlip, playerCoords)
	SetMarkerCoord(tabletMarker, playerCoords)
end

-- Function to start using the tablet
function StartUsingTablet(player)
	-- Set the flag to indicate that the tablet is being used
	tabletInUse = true

	-- Attach the tablet to the player's hand
	AttachEntityToEntity(tablet, player, GetPedBoneIndex(player, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)

	-- Set the player's controls to disabled
	DisableControlAction(0, 1, true)
	DisableControlAction(0, 2, true)
	DisableControlAction(0, 24, true)
	DisableControlAction(0, 257, true)
	DisableControlAction(0, 25, true)
	DisableControlAction(0, 263, true)
	DisableControlAction(0, 32, true)
	DisableControlAction(0, 34, true)
	DisableControlAction(0, 31, true)
	DisableControlAction(0, 30, true)
	DisableControlAction(0, 45, true)
	DisableControlAction(0, 22, true)
	DisableControlAction(0, 44, true)
	DisableControlAction(0, 37, true)
	DisableControlAction(0, 23, true)
	DisableControlAction(0, 288, true)

  -- Set the camera to focus on the tablet
	SetCamCoord(tabletCam, GetEntityCoords(tablet))
	SetCamRot(tabletCam, 0.0, 0.0, GetEntityHeading(tablet))
	RenderScriptCams(true, false, 0, true, true)

	-- Draw the scaleform for the tablet
	while not HasScaleformMovieLoaded(tabletScaleform) do
		Citizen.Wait(0)
		RequestScaleformMovie(tabletScaleform)
	end

	PushScaleformMovieFunction(tabletScaleform, "SET_LABELS")
	PushScaleformMovieFunctionParameterString("Delivery Missions")
	PushScaleformMovieFunctionParameterString("Select a mission to view details")
	PopScaleformMovieFunctionVoid()

	-- Set up the index for the current delivery mission
	local deliveryMissionIndex = 1

	-- Set up a flag to track whether the player has selected a delivery mission
	local deliveryMissionSelected = false

	-- Set up a flag to track whether the player has accepted a delivery mission
	local deliveryMissionAccepted = false

	-- Set up a flag to track whether the player has completed a delivery mission
	local deliveryMissionCompleted = false

	-- Set up a flag to track whether the player has returned to the tablet after completing a delivery mission
	local deliveryMissionReturned = false

	-- Set up the timer for the delivery mission
	local deliveryMissionTimer = 0

	-- Set up the distance traveled for the delivery mission
	local deliveryMissionDistance = 0

	-- Set up the current level of the delivery mission
	local deliveryMissionLevel = 0

	-- Set up the reward for the delivery mission
	local deliveryMissionReward = 0

	-- Set up the XP multiplier for
  -- Set up a flag to track whether the player has returned to the tablet
local returnedToTablet = false

-- Set up the timer for returning to the tablet
local returnToTabletTimer = 0

-- Set up a flag to track whether the player has exited the truck
local hasExitedTruck = false

while true do
  Citizen.Wait(0)

  -- Update the position and heading of the tablet
  UpdateTabletPosition(player)

  -- Check if the player is pressing the "use" button
  if IsControlJustReleased(0, 51) then
    -- Check if the player is in range of the tablet
    if GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(tablet), true) <= tabletInteractionDistance then
      -- Check if the tablet is already being used
      if not tabletInUse then
        -- Start using the tablet
        StartUsingTablet(player)
      else
        -- Stop using the tablet
        StopUsingTablet(player)
      end
    end
  end

  -- Check if the player is using the tablet
  if tabletInUse then
    -- Set up the current cursor position
    local cursorX, cursorY = GetControlNormal(0, 239), GetControlNormal(0, 240)

    -- Check if the player is pressing the "up" button
    if IsControlJustReleased(0, 172) then
      -- Decrement the delivery mission index
      deliveryMissionIndex = deliveryMissionIndex - 1

      -- Check if the delivery mission index is out of bounds
      if deliveryMissionIndex < 1 then
        -- Set the delivery mission index to the last delivery mission
        deliveryMissionIndex = #deliveryMissions
      end
    end

    -- Check if the player is pressing the "down" button
    if IsControlJustReleased(0, 173) then
      -- Increment the delivery mission index
      deliveryMissionIndex = deliveryMissionIndex + 1

      -- Check if the delivery mission index is out of bounds
      if deliveryMissionIndex > #deliveryMissions then
        -- Set the delivery mission index to the first delivery mission
        deliveryMissionIndex = 1
      end
    end

    -- Check if the player is pressing the "select" button
    if IsControlJustReleased(0, 201) then
      -- Set the flag to indicate that the player has selected a delivery mission
      deliveryMissionSelected = true

      -- Set up the current delivery mission
      local deliveryMission = deliveryMissions[deliveryMissionIndex]

      -- Set up the destination for the delivery mission
      local deliveryMissionDestination = deliveryMission.destination

      -- Set up the level for the delivery mission

      -- Set up the reward for the delivery mission
      deliveryMissionReward = deliveryMission.reward

      -- Set up the XP multiplier for the delivery mission
      local deliveryMissionXPMultiplier = deliveryMission.xpMultiplier

      -- Set up the time limit for the delivery mission
      local deliveryMissionTimeLimit = deliveryMission.timeLimit

      -- Set up the distance limit for the delivery mission
      local deliveryMissionDistanceLimit = deliveryMission.distanceLimit

      -- Set up the message for the delivery mission
      local deliveryMissionMessage = string.format("Delivery Mission:\nDeliver %s to %s within %d minutes\nReward: $%d\nXP Multiplier: %.1f", deliveryMission.name, deliveryMissionDestination, deliveryMissionTimeLimit, deliveryMissionReward, deliveryMissionXPMultiplier)

      -- Set the scaleform message for the delivery mission
      PushScaleformMovieFunction(tabletScaleform, "SET_DATA_SLOT")
      PushScaleformMovieFunctionParameterInt(1)
      PushScaleformMovieFunctionParameterString(deliveryMissionMessage)
      PopScaleformMovieFunctionVoid()

      -- Set the scaleform message for the accept button
      PushScaleformMovieFunction(tabletScaleform, "SET_DATA_SLOT")
      PushScaleformMovieFunctionParameterInt(2)
      PushScaleformMovieFunctionParameterString("Accept")
      PopScaleformMovieFunctionVoid()
    end

    -- Check if the player has selected a delivery mission
    if deliveryMissionSelected then
      -- Check if the cursor is hovering over the accept button
      if cursorX > 0.5 and cursorX < 0.75 and cursorY > 0.55 and cursorY < 0.75 then
        -- Set the flag to indicate that the player has accepted the delivery mission
        deliveryMissionAccepted = true

        -- Clear the scaleform movie
        ClearFullScreenMovie()

        -- Reset the flag for using the tablet
        tabletInUse = false

        -- Reset the flag for selecting a delivery mission
        deliveryMissionSelected = false

        -- Reset the delivery mission index
        deliveryMissionIndex = 1
      end
    end

    -- Check if the player is in a truck
    if IsPedInAnyTruck(player) then
      -- Check if the player has accepted a delivery mission
      if deliveryMissionAccepted then
        -- Set the flag to indicate that the player has started the delivery mission
        deliveryMissionStarted = true

        -- Set the current level of the delivery mission
        deliveryMissionLevel = GetMissionLevel(player)

        -- Set the

        -- Set the delivery mission start time
        deliveryMissionStartTime = GetGameTimer()

        -- Set up the delivery mission blip
        deliveryMissionBlip = AddBlipForCoord(deliveryMissionDestinationCoords.x, deliveryMissionDestinationCoords.y, deliveryMissionDestinationCoords.z)
        SetBlipSprite(deliveryMissionBlip, 1)
        SetBlipColour(deliveryMissionBlip, 2)
        SetBlipRoute(deliveryMissionBlip, true)
        SetBlipRouteColour(deliveryMissionBlip, 2)
        SetBlipScale(deliveryMissionBlip, 0.75)
        SetBlipAsShortRange(deliveryMissionBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Delivery Mission Destination")
        EndTextCommandSetBlipName(deliveryMissionBlip)

        -- Set up the delivery mission marker
        deliveryMissionMarker = CreateMarker(1, deliveryMissionDestinationCoords.x, deliveryMissionDestinationCoords.y, deliveryMissionDestinationCoords.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 10.0, 10.0, 10.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)

        -- Set up the delivery mission checkpoint
        deliveryMissionCheckpoint = CreateCheckpoint(1, deliveryMissionDestinationCoords.x, deliveryMissionDestinationCoords.y, deliveryMissionDestinationCoords.z, deliveryMissionDestinationCoords.x, deliveryMissionDestinationCoords.y, deliveryMissionDestinationCoords.z, 10.0, 255, 0, 0, 200, false, 2)

        -- Set up the delivery mission ped
        deliveryMissionPed = CreatePed(28, deliveryMissionPedModel, deliveryMissionDestinationCoords.x, deliveryMissionDestinationCoords.y, deliveryMissionDestinationCoords.z, 0.0, true, true)
        SetEntityInvincible(deliveryMissionPed, true)
        SetBlockingOfNonTemporaryEvents(deliveryMissionPed, true)

        -- Set up the delivery mission notification
        deliveryMissionNotification = "Press [~g~E~s~] to deliver the goods"

        -- Set up the delivery mission completion notification
        deliveryMissionCompletionNotification = "Delivery mission completed"

        -- Set up the delivery mission fail notification
        deliveryMissionFailNotification = "Delivery mission failed"

        -- Set up the delivery mission success notification
        deliveryMissionSuccessNotification = "Delivery mission success"

        -- Set up the delivery mission timer notification
        deliveryMissionTimerNotification = "Time remaining: %d seconds"

        -- Set up the delivery mission distance notification
        deliveryMissionDistanceNotification = "Distance remaining: %d meters"

        -- Set up the delivery mission distance check interval
        local deliveryMissionDistanceCheckInterval = 1000

        -- Set up the delivery mission distance check timer
        local deliveryMissionDistanceCheckTimer = GetGameTimer()

        -- Set up the delivery mission distance
        local deliveryMissionDistance = GetDistanceBetweenCoords(deliveryMissionStartCoords.x, deliveryMissionStartCoords.y, deliveryMissionStartCoords.z, deliveryMissionDestinationCoords.x, deliveryMissionDestinationCoords.y, deliveryMissionDestination

        -- Check if the player is in a truck
if IsPedInAnyTruck(PlayerPedId()) then
	-- Check if the player is within delivery mission checkpoint range
	if IsPlayerWantedLevelGreater(PlayerId(), 0) then
		-- Set the delivery mission fail notification
		deliveryMissionNotification = deliveryMissionFailNotification

		-- Set the delivery mission as failed
		deliveryMissionFailed = true
	elseif GetDistanceBetweenCoords(deliveryMissionDestinationCoords.x, deliveryMissionDestinationCoords.y, deliveryMissionDestinationCoords.z, GetEntityCoords(PlayerPedId())) <= 10.0 then
		-- Set the delivery mission success notification
		deliveryMissionNotification = deliveryMissionSuccessNotification

		-- Set the delivery mission as successful
		deliveryMissionSuccess = true
	else
		-- Set the delivery mission timer notification
		deliveryMissionNotification = string.format(deliveryMissionTimerNotification, math.max(0, deliveryMissionTimeLimit - (GetGameTimer() - deliveryMissionStartTime) / 1000))

		-- Check if the delivery mission time limit has been reached
		if GetGameTimer() >= deliveryMissionStartTime + deliveryMissionTimeLimit then
			-- Set the delivery mission fail notification
			deliveryMissionNotification = deliveryMissionFailNotification

			-- Set the delivery mission as failed
			deliveryMissionFailed = true
		else
			-- Check if the delivery mission distance check interval has been reached
			if GetGameTimer() >= deliveryMissionDistanceCheckTimer + deliveryMissionDistanceCheckInterval then
				-- Set the delivery mission distance
				deliveryMissionDistance = GetDistanceBetweenCoords(deliveryMissionStartCoords.x, deliveryMissionStartCoords.y, deliveryMissionStartCoords.z, GetEntityCoords(PlayerPedId()))

				-- Set the delivery mission distance check timer
				deliveryMissionDistanceCheckTimer = GetGameTimer()
			end

			-- Set the delivery mission distance notification
			deliveryMissionNotification = string.format(deliveryMissionDistanceNotification, math.floor(deliveryMissionDistance))
		end
	end
else
	-- Set the delivery mission fail notification
	deliveryMissionNotification = deliveryMissionFailNotification

	-- Set the delivery mission as failed
	deliveryMissionFailed = true
end

-- Check if the delivery mission has been completed
if deliveryMissionSuccess then
	-- Display the delivery mission completion notification
	SetNotificationTextEntry("STRING")
	AddTextComponentString(deliveryMissionCompletionNotification)
	DrawNotification(false, false)

	-- Award the player the delivery mission reward
	AddMoneyToChar(PlayerPedId(), deliveryMissionReward)

	-- Remove the delivery mission checkpoint
	RemoveCheckpoint(deliveryMissionCheckpoint)

	-- Remove the delivery mission marker
	RemoveMarker(deliveryMissionMarker)

	-- Remove the delivery mission blip
	RemoveBlip(deliveryMissionBlip)

	-- Remove the delivery mission ped
	DeletePed(deliveryMissionPed)

	-- Set the delivery mission as completed
	deliveryMissionCompleted = true
elseif deliveryMissionFailed then

-- Display the delivery mission fail notification
SetNotificationTextEntry("STRING")
AddTextComponentString(deliveryMissionFailNotification)
DrawNotification(false, false)

-- Remove the delivery mission checkpoint
RemoveCheckpoint(deliveryMissionCheckpoint)

-- Remove the delivery mission marker
RemoveMarker(deliveryMissionMarker)

-- Remove the delivery mission blip
RemoveBlip(deliveryMissionBlip)

-- Remove the delivery mission ped
DeletePed(deliveryMissionPed)

-- Set the delivery mission as failed
deliveryMissionFailed = true
