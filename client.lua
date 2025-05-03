-- Client.lua
local QBCore = exports['qb-core']:GetCoreObject()
local isDelivering = false
local currentJob = nil
local deliveryBlip = nil

RegisterCommand('predatveci', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local job = PlayerData.job.name
    
    if Config.Jobs[job] then
        if not isDelivering then
            StartDelivery(job)
        else
            QBCore.Functions.Notify('Už máš aktívnu donášku!', 'error')
        end
    else
        QBCore.Functions.Notify('Táto práca nemá nastavenú donášku!', 'error')
    end
end, false)

function StartDelivery(job)
    currentJob = job
    isDelivering = true
    
    local items = Config.Jobs[job].items
    local randomLocation = Config.Jobs[job].dropOffLocations[math.random(#Config.Jobs[job].dropOffLocations)]
    
    -- Create blip
    deliveryBlip = AddBlipForCoord(randomLocation.x, randomLocation.y, randomLocation.z)
    SetBlipSprite(deliveryBlip, 1)
    SetBlipColour(deliveryBlip, 3)
    SetBlipRoute(deliveryBlip, true)
    
    QBCore.Functions.Notify('Choď na označené miesto a doruč predmety!', 'success')
    
    -- Delivery check
    Citizen.CreateThread(function()
        while isDelivering do
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            
            if #(coords - randomLocation) < 5.0 then
                -- Draw 3D text
                DrawText3D(randomLocation.x, randomLocation.y, randomLocation.z + 1.0, '<font face="Fire Sans">[E] Doručiť predmety</font>') ---- <font face="Fire Sans">[E] Doručiť predmety/font>
                
                if IsControlJustPressed(0, 38) then
                    local hasAllItems = true
                    local PlayerData = QBCore.Functions.GetPlayerData()
                    
                    -- Check if player has all required items
                    for _, item in pairs(items) do
                        local hasItem = false
                        for _, invItem in pairs(PlayerData.items) do
                            if invItem.name == item.item and invItem.amount >= item.amount then
                                hasItem = true
                                break
                            end
                        end
                        if not hasItem then
                            hasAllItems = false
                            break
                        end
                    end
                    
                    if hasAllItems then
                        TriggerServerEvent('qb-delivery:completeDelivery', job, items)
                        RemoveBlip(deliveryBlip)
                        isDelivering = false
                        currentJob = nil
                        QBCore.Functions.Notify('Donáška úspešná!', 'success')
                    else
                        QBCore.Functions.Notify('Nemáš všetky potrebné predmety!', 'error')
                    end
                end
            end
            Citizen.Wait(0)
        end
    end)
end

-- Function to draw 3D text
function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.25, 0.25)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end

-- Debug print
if Config.Debug then
    RegisterCommand('debugdelivery', function()
        print('Current Job:', currentJob)
        print('Is Delivering:', isDelivering)
    end, false)
end