ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_guntest:storeStatus')
AddEventHandler('esx_guntest:storeStatus', function(source)
	TriggerClientEvent('esx_guntest:hasShotGun', source)
end)
