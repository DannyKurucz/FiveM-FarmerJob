if cfg.esxLegacy == false then
    ESX = nil
    TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
end

RegisterNetEvent("cow:getmilk")
AddEventHandler("cow:getmilk", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.canCarryItem("milk", 1) then
        xPlayer.addInventoryItem("milk", 1)
    else
        TriggerClientEvent('esx:showNotification', source, cfg.translation['limit'])

    end
end)

RegisterNetEvent("apple:getapple")
AddEventHandler("apple:getapple", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.canCarryItem("apple", 1) then
        xPlayer.addInventoryItem("apple", 1)
    else
        TriggerClientEvent('esx:showNotification', source, cfg.translation['limit'])
    end
end)

RegisterNetEvent("potato:getpotato")
AddEventHandler("potato:getpotato", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.canCarryItem("potato", 1) then
        xPlayer.addInventoryItem("potato", 1)
    else
        TriggerClientEvent('esx:showNotification', source, cfg.translation['limit'])

    end
end)

local maxmoney = 1100
RegisterNetEvent("milk:sell")
AddEventHandler("milk:sell", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local money = 1000
    if xPlayer ~= nil then
        if money >= maxmoney then
            xPlayer.kick("Cheater")
        else
            local randomMoney = math.random(30,60)
            if xPlayer.getInventoryItem("milk").count > 0 then
                xPlayer.addMoney(randomMoney)
                xPlayer.removeInventoryItem("milk", 1)
            else
                TriggerClientEvent('esx:showNotification', source, cfg.translation['nomilk'])

            end
        end
    end
end)

local maxmoney = 1100
RegisterNetEvent("apple:sell")
AddEventHandler("apple:sell", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local money = 1000
    if xPlayer ~= nil then
        if money >= maxmoney then
            xPlayer.kick("Cheater")
        else
            local randomMoney = math.random(30,60)
            if xPlayer.getInventoryItem("apple").count > 0 then
                xPlayer.addMoney(randomMoney)
                xPlayer.removeInventoryItem("apple", 1)
                
            else
                TriggerClientEvent('esx:showNotification', source, cfg.translation['noapple'])
            end
        end
    end
end)

local maxmoney = 1100
RegisterNetEvent("potato:sell")
AddEventHandler("potato:sell", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local money = 1000
    if xPlayer ~= nil then
        if money >= maxmoney then
            xPlayer.kick("Cheater")
        else
            local randomMoney = math.random(30,60)
            if xPlayer.getInventoryItem("potato").count > 0 then
                xPlayer.addMoney(randomMoney)
                xPlayer.removeInventoryItem("potato", 1)
            else
                TriggerClientEvent('esx:showNotification', source, cfg.translation['nopotato'])

            end
        end
    end
end)