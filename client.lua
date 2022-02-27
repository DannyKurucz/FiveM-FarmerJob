

if cfg.esxLegacy == false then
    ESX = nil -- ESX 
    CreateThread(function()
	    while ESX == nil do
	    	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		    Wait(0)
	    end
    end)
end

RegisterNetEvent('esx:playerLoaded') -- toto načte postavu prostě základ
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local blip = nil
local blipapple = nil
local apple = true
local blippotato = nil
local potato = true
local sellmilk = nil
local sellpotato = nil
local sellapple = nil
local sellmilkmarker = true
local sellapplemarker = true
local sellpotatomarker = true

CreateThread(function()
	while true do
        Citizen.Wait(5000)
        if ESX.PlayerData.job and ESX.PlayerData.job.name == cfg.job['job'] then
            if blip == nil then
                blip = AddBlipForCoord(cfg.blip['blipcow'])
                AddTextEntry('blip', cfg.blip['blipcowname'])
                SetBlipSprite(blip, 89)
                SetBlipColour(blip, 37)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, 1.0)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName('blip')
                EndTextCommandSetBlipName(blip)
            end
			if blipapple == nil then
                blipapple = AddBlipForCoord(cfg.blip['blipapple'])
                AddTextEntry('blip', cfg.blip['blipapplename'])
                SetBlipSprite(blipapple, 76)
                SetBlipColour(blipapple, 1)
                SetBlipDisplay(blipapple, 4)
                SetBlipScale(blipapple, 1.0)
                SetBlipAsShortRange(blipapple, true)
                BeginTextCommandSetBlipName('blip')
                EndTextCommandSetBlipName(blipapple)
            end
            if blippotato == nil then
                blippotato = AddBlipForCoord(cfg.blip['blippotato'])
                AddTextEntry('blip', cfg.blip['blippotatoname'])
                SetBlipSprite(blippotato, 267)
                SetBlipColour(blippotato, 81)
                SetBlipDisplay(blippotato, 4)
                SetBlipScale(blippotato, 1.0)
                SetBlipAsShortRange(blippotato, true)
                BeginTextCommandSetBlipName('blip')
                EndTextCommandSetBlipName(blippotato)
            end
            if sellmilk == nil then
                sellmilk = AddBlipForCoord(cfg.blip['sellmilk'])
                AddTextEntry('blip', cfg.blip['sellmilkname'])
                SetBlipSprite(sellmilk, 293)
                SetBlipColour(sellmilk, 2)
                SetBlipDisplay(sellmilk, 4)
                SetBlipScale(sellmilk, 1.0)
                SetBlipAsShortRange(sellmilk, true)
                BeginTextCommandSetBlipName('blip')
                EndTextCommandSetBlipName(sellmilk)
            end
            if sellpotato == nil then
                sellpotato = AddBlipForCoord(cfg.blip['sellpotato'])
                AddTextEntry('blip', cfg.blip['sellpotatoname'])
                SetBlipSprite(sellpotato, 293)
                SetBlipColour(sellpotato, 2)
                SetBlipDisplay(sellpotato, 4)
                SetBlipScale(sellpotato, 1.0)
                SetBlipAsShortRange(sellpotato, true)
                BeginTextCommandSetBlipName('blip')
                EndTextCommandSetBlipName(sellpotato)
            end
            if sellapple == nil then
                sellapple = AddBlipForCoord(cfg.blip['sellapple'])
                AddTextEntry('blip', cfg.blip['sellapplename'])
                SetBlipSprite(sellapple, 293)
                SetBlipColour(sellapple, 2)
                SetBlipDisplay(sellapple, 4)
                SetBlipScale(sellapple, 1.0)
                SetBlipAsShortRange(sellapple, true)
                BeginTextCommandSetBlipName('blip')
                EndTextCommandSetBlipName(sellapple)
            end

        else
            if blip ~= nil then
                RemoveBlip(blip)
                blip = nil
            end
			if blipapple ~= nil then
                RemoveBlip(blipapple)
                blipapple = nil
            end
            if blippotato ~= nil then
                RemoveBlip(blippotato)
                blippotato = nil
            end
            if sellmilk ~= nil then
                RemoveBlip(sellmilk)
                sellmilk = nil
            end
            if sellpotato ~= nil then
                RemoveBlip(sellpotato)
                sellpotato = nil
            end
            if sellapple ~= nil then
                RemoveBlip(sellapple)
                sellapple = nil
            end

        end
    end
end)

CreateThread(function()
	while true do
        cas = 1000
		local playerPed = PlayerPedId()
        local Coords = GetEntityCoords(PlayerPedId())
        local pos = (cfg.marker['apple'])
		local dist = #(Coords - pos)
        if dist < 10 then
            if ESX.PlayerData.job and ESX.PlayerData.job.name == cfg.job['job'] then
                if apple then
                    apple = true
                    if apple == true then
                        cas = 5
                        ShowFloatingHelpNotification(cfg.translation['apple'], pos)
                        if IsControlJustPressed(0, 38) then
                            apple = true
                            TriggerServerEvent("apple:getapple")
							TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
							Wait(5000)
							ClearPedTasks(playerPed)

                        end
                    end
                end
            end
        end
        Wait(cas)
	end
end)

CreateThread(function()
	while true do
        cas = 1000
		local playerPed = PlayerPedId()
        local Coords = GetEntityCoords(PlayerPedId())
        local pos = (cfg.marker['potato'])
		local dist = #(Coords - pos)
        if dist < 10 then
            if ESX.PlayerData.job and ESX.PlayerData.job.name == cfg.job['job'] then
                if potato then
                    potato = true
                    if potato == true then
                        cas = 5
                        ShowFloatingHelpNotification(cfg.translation['potato'], pos)
                        if IsControlJustPressed(0, 38) then
                            potato = true
                            TriggerServerEvent("potato:getpotato")
							TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
							Wait(5000)
							ClearPedTasks(playerPed)

                        end
                    end
                end
            end
        end
        Wait(cas)
	end
end)
CreateThread(function()
	while true do
        cas = 1000
		local playerPed = PlayerPedId()
        local Coords = GetEntityCoords(PlayerPedId())
        local pos = (cfg.marker['sellmilk'])
		local dist = #(Coords - pos)
        if dist < 5 then
            if ESX.PlayerData.job and ESX.PlayerData.job.name == cfg.job['job'] then
                if sellmilkmarker then
                    sellmilkmarker = true
                    if sellmilkmarker == true then
                        cas = 5
                        ShowFloatingHelpNotification(cfg.translation['sellmilk'], pos)
                        if IsControlJustPressed(0, 38) and dist < 3 then
                            sellmilkmarker = true
							TriggerServerEvent("milk:sell")
							Wait(250)
                        end
                    end
                end
            end
        end
        Wait(cas)
	end
end)
CreateThread(function()
	while true do
        cas = 1000
		local playerPed = PlayerPedId()
        local Coords = GetEntityCoords(PlayerPedId())
        local pos = (cfg.marker['sellapple'])
		local dist = #(Coords - pos)
        if dist < 5 then
            if ESX.PlayerData.job and ESX.PlayerData.job.name == cfg.job['job'] then
                if sellapplemarker then
                    sellapplemarker = true
                    if sellapplemarker == true then
                        cas = 5
                        ShowFloatingHelpNotification(cfg.translation['sellapple'], pos)
                        if IsControlJustPressed(0, 38) and dist < 3 then
                            sellapplemarker = true
							TriggerServerEvent("apple:sell")
							Wait(250)
                        end
                    end
                end
            end
        end
        Wait(cas)
	end
end)

CreateThread(function()
	while true do
        cas = 1000
		local playerPed = PlayerPedId()
        local Coords = GetEntityCoords(PlayerPedId())
        local pos = (cfg.marker['sellpotato'])
		local dist = #(Coords - pos)
        if dist < 5 then
            if ESX.PlayerData.job and ESX.PlayerData.job.name == cfg.job['job'] then
                if sellpotatomarker then
                    sellpotatomarker = true
                    if sellpotatomarker == true then
                        cas = 5
                        ShowFloatingHelpNotification(cfg.translation['sellpotato'], pos)
                        if IsControlJustPressed(0, 38) and dist < 3 then
                            sellpotatomarker = true
							TriggerServerEvent("potato:sell")
							Wait(250)
						
                        end
                    end
                end
            end
        end
        Wait(cas)
	end
end)



RegisterNetEvent("cow:milk")
AddEventHandler("cow:milk", function()
	local playerPed = PlayerPedId()
	TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
	exports.rprogress:MiniGame({
		Difficulty = "Easy",
		Timeout = 5000, -- Duration before minigame is cancelled
		onComplete = function(success)
				if success then
					TriggerServerEvent("cow:getmilk")
					ClearPedTasks(playerPed)
				else
					Notify("Try again")
					ClearPedTasks(playerPed)

				end    
		end,
	})
end)

ShowFloatingHelpNotification = function(msg, pos)
    AddTextEntry('text', msg)
    SetFloatingHelpTextWorldPosition(1, pos.x, pos.y, pos.z)
    SetFloatingHelpTextStyle(2, 1, 25, -1, 3, 0)
    BeginTextCommandDisplayHelp('text')
    EndTextCommandDisplayHelp(2, false, false, -1)
end

exports.qtarget:AddTargetModel({"a_c_cow"}, {
	options = {
		{
			event = "cow:milk",
			icon = "fas fa-box-circle-check",
			label = "Get Milk",
			num = 1
		},
	},
	distance = 2
})

