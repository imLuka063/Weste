ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('luka:westencheck')
AddEventHandler('luka:westencheck', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local item = 'weste2' -- Hier solltest du das richtige Item angeben
    local count = 1

    if xPlayer.getInventoryItem(item).count >= count then
        xPlayer.removeInventoryItem(item, count) 
        TriggerClientEvent('luka:applyArmor', _source) -- Hier benachrichtigen wir den Client, um die Rüstung anzuwenden
    else
        TriggerClientEvent('esx:showNotification', _source, 'Du hast keine Schutzweste!')
    end
end)

RegisterServerEvent('luka:pdwestencheck')
AddEventHandler('luka:pdwestencheck', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local item = 'weste3' -- Hier solltest du das richtige Item angeben
    local count = 1

    if xPlayer.getInventoryItem(item).count >= count then
        xPlayer.removeInventoryItem(item, count) -- Hier entfernen wir die verkauften Artikel
        TriggerClientEvent('luka:applyArmor', _source) -- Hier benachrichtigen wir den Client, um die Rüstung anzuwenden
    else
        TriggerClientEvent('esx:showNotification', _source, 'Du hast keine Schutzweste!')
    end
end)


ESX.RegisterUsableItem('weste2', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('luka:weste2force', source)
end)

ESX.RegisterUsableItem('weste3', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('luka:weste3force', source)
end)
