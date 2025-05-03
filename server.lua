-- Server.lua
local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-delivery:completeDelivery')
AddEventHandler('qb-delivery:completeDelivery', function(job, items)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player then
        -- Remove items
        for _, item in pairs(items) do
            Player.Functions.RemoveItem(item.item, item.amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.item], 'remove', item.amount)
        end
        
        -- Calculate payment
        local totalPrice = 0
        for _, item in pairs(items) do
            totalPrice = totalPrice + (item.price * item.amount)
        end
        
        local societyAmount = math.floor(totalPrice * (Config.FractionPercentage / 100))
        local playerAmount = math.floor(totalPrice * (Config.PlayerPercentage / 100))
        
        -- Add money
        Player.Functions.AddMoney('cash', playerAmount)
        exports['qb-management']:AddMoney(job, societyAmount)
        
        -- Send webhook
        local embed = {
            {
                ["color"] = 3066993,
                ["title"] = "Delivery Completed",
                ["description"] = string.format("Player: %s\nJob: %s\nSociety Received: $%d\nPlayer Received: $%d",
                    Player.PlayerData.name, job, societyAmount, playerAmount),
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        
        PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', 
            json.encode({username = "Delivery Bot", embeds = embed}), 
            { ['Content-Type'] = 'application/json' }
        )
        
        if Config.Debug then
            print(string.format("[DELIVERY] Player: %s | Job: %s | Society: $%d | Player: $%d",
                Player.PlayerData.name, job, societyAmount, playerAmount))
        end
    end
end)