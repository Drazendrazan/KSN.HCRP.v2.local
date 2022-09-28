local QBCore = exports['qb-core']:GetCoreObject()



QBCore.Functions.CreateUseableItem("NOSv2", function(source)
    TriggerClientEvent('smallresource:client:LoadNitrous', source)
end)

RegisterNetEvent('NOSv2:server:LoadNitrous', function(Plate)
    TriggerClientEvent('NOSv2:client:LoadNitrous', -1, Plate)
end)

RegisterNetEvent('NOSv2:server:SyncFlames', function(netId)
    TriggerClientEvent('NOSv2:client:SyncFlames', -1, netId, source)
end)

RegisterNetEvent('NOSv2:server:UnloadNitrous', function(Plate)
    TriggerClientEvent('NOSv2:client:UnloadNitrous', -1, Plate)
end)

RegisterNetEvent('NOSv2:server:UpdateNitroLevel', function(Plate, level)
    TriggerClientEvent('NOSv2:client:UpdateNitroLevel', -1, Plate, level)
end)

RegisterNetEvent('NOSv2:server:StopSync', function(plate)
    TriggerClientEvent('NOSv2:client:StopSync', -1, plate)
end)
