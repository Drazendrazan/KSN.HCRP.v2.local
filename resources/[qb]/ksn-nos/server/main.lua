ESX = nil
TriggerEvent(
	"esx:getSharedObject",
	function(obj)
		ESX = obj
	end
)
local QBCore = exports['qb-core']:GetCoreObject()
