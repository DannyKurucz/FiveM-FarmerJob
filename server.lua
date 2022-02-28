if cfg.esxLegacy == false then
    ESX = nil
    TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
end

RegisterNetEvent("getItem", function(item)
    local src = source
    local Player = ESX.GetPlayerFromId(src)

    if item ~= "apple" or item ~= "milk" or item ~= "patato" then
        DropPlayer(src, "Opps!")
    else
        if Player.canCarryItem(item, 1) then
            Player.addInventoryItem(item, 1)
        else
            TriggerClientEvent('esx:showNotification', src, cfg.translation['limit'])
        end
    end
end)

RegisterNetEvent("sellItem", function(item, getMoney)
    local src = source
    local Player = ESX.GetPlayerFromId(src)

    if getMoney ~= cfg.Money then
        DropPlayer(src, "Opps!")
    else
        if Player.getInventoryItem(item, 1).count >= 1 then
            Player.removeInventoryItem(item, 1)
            Player.addMoney(getMoney)
        else
            TriggerClientEvent('esx:showNotification', src, "There's not enough " ..item.. " on it!")
        end
    end
end)
