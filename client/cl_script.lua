ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterCommand('weste', function(source, args, rawCommand)
    local playerPed = PlayerPedId()
    local lib, anim = 'anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01' -- TODO: Bessere Animationen

    TriggerServerEvent('luka:westencheck')
end, false)

RegisterCommand('pdweste', function(source, args, rawCommand)
    local playerPed = PlayerPedId()
    local lib, anim = 'anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01' -- TODO: Bessere Animationen

    TriggerServerEvent('luka:pdwestencheck')
end, false)


RegisterKeyMapping('weste', 'Schutzweste nutzen', 'keyboard', '')
RegisterKeyMapping('pdweste', 'Policeweste nutzen', 'keyboard', '')

RegisterNetEvent('luka:applyArmor')
AddEventHandler('luka:applyArmor', function()
    local playerPed = PlayerPedId()
    local lib, anim = 'anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01' -- TODO: Bessere Animationen

    RequestAnimDict(lib)

    while not HasAnimDictLoaded(lib) do
        Wait(500)
    end

    TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

    SetTimeout(1200, function()
        ClearPedSecondaryTask(playerPed)
    end)

    exports['an_progBar']:run(12, 'Weste benutzen', '#00bfff') -- Fortschrittsleiste für 2 Sekunden anzeigen

    TriggerEvent('esx:showNotification', 'Du hast eine Schutzweste benutzt!')
    AddArmourToPed(playerPed, 100)
end)




RegisterNetEvent('luka:applyAmmo')
AddEventHandler('luka:applyAmmo', function()
    local playerPed = GetPlayerPed(-1)
    local weaponHash = GetSelectedPedWeapon(playerPed)
    
    if weaponHash ~= nil then
        AddAmmoToPed(playerPed, weaponHash, 150)
        ESX.ShowNotification('150 Schuss wurden zur Waffe hinzugefügt!')
    else
        ESX.ShowNotification('Du musst eine Waffe in der Hand haben, um Munition hinzuzufügen!')
    end
end)
