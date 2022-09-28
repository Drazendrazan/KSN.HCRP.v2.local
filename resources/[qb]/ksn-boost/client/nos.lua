local QBCore = exports['qb-core']:GetCoreObject()

-- Local variables
local NitrousActivated = false
local NitrousBoost = 55.0 -- Change to affect boost percentage from stock
local VehicleNitrous = {}
local Fxs = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('nitrous:GetNosLoadedVehs', function(vehs)
        VehicleNitrous = vehs
    end)
end)
