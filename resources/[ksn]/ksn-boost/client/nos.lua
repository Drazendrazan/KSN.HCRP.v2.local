local QBCore = exports['qb-core']:GetCoreObject()

-- Local variables
local NitrousActivated = false
local NitrousBoost = 55.0 -- Change to affect boost percentage from stock
local VehicleNitrous = {}
local Fxs = {}
local IsNearNOSPump = false
local IsNOSFueling = false
local currentNOS = 0.0
local curentNOSCost = 0.0
local todayNOSCost = 0
local currentCash = 0
local currentBank = 0
local NOSSynced = false
local inNOSBlacklist = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('nitrous:GetNosLoadedVehs', function(vehs)
        VehicleNitrous = vehs
    end)
end)

RegisterNetEvent('smallresource:client:LoadNitrous', function() -- Use to load NOS through item (nos tank)
    local IsInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)

    if not NitrousActivated then
        if IsInVehicle and not IsThisModelABike(GetEntityModel(GetVehiclePedIsIn(ped))) then
            if GetPedInVehicleSeat(veh, -1) == ped then
                QBCore.Functions.Progressbar("use_nos", "Filling NOS Tank....", 5500, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['nitrous'], "remove")
                    TriggerServerEvent("QBCore:Server:RemoveItem", 'nitrous', 1)
                    local CurrentVehicle = GetVehiclePedIsIn(PlayerPedId())
                    local Plate = trim(GetVehicleNumberPlateText(CurrentVehicle))
                    TriggerServerEvent('nitrous:server:LoadNitrous', Plate)
                end)
            else
                QBCore.Functions.Notify("You cannot do that from this seat!", "error")
            end
        else
            QBCore.Functions.Notify('You\'re Not In A Car', 'error')
        end
    else
        QBCore.Functions.Notify('You Already Have NOS Active', 'error')
    end
end)

function ManageNOS
