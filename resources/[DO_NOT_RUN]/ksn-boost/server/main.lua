local QBCore = exports['qb-core']:GetCoreObject()



QBCore.Functions.CreateUseableItem("NOS", function(source)
    TriggerClientEvent('smallresource:client:LoadNitrous', source)
end)

RegisterNetEvent('NOS:server:LoadNitrous', function(Plate)
    TriggerClientEvent('NOS:client:LoadNitrous', -1, Plate)
end)

RegisterNetEvent('NOS:server:SyncFlames', function(netId)
    TriggerClientEvent('NOS:client:SyncFlames', -1, netId, source)
end)

RegisterNetEvent('NOS:server:UnloadNitrous', function(Plate)
    TriggerClientEvent('NOS:client:UnloadNitrous', -1, Plate)
end)

RegisterNetEvent('NOS:server:UpdateNitroLevel', function(Plate, level)
    TriggerClientEvent('NOS:client:UpdateNitroLevel', -1, Plate, level)
end)

RegisterNetEvent('NOS:server:StopSync', function(plate)
    TriggerClientEvent('NOS:client:StopSync', -1, plate)
end)
