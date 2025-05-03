-- Config.lua
Config = {}

Config.Debug = false -- Enable/Disable debug mode

Config.Jobs = {
    ['vineyard'] = {
        items = {
            {item = 'cervene_vino', amount = 1, price = 250},
            {item = 'bile_vino', amount = 1, price = 250},
            {item = 'ruzove_vino', amount = 1, price = 250},
        },
        dropOffLocations = {
            vector3(1086.78, 244.12, 80.99),
            vector3(-668.45, -971.5, 22.34),
            vector3(507.78, -1457.94, 29.55),
            vector3(-550.04, -345.66, 35.16),
            vector3(-716.73, -372.23, 34.79),
            vector3(-1350.08, -635.38, 27.8),
            vector3(-1344.44, -240.98, 42.69),
            vector3(478.27, -1943.34, 24.98),
            vector3(-297.91, -1332.98, 31.3),
            vector3(-1471.73, -920.08, 10.02),
            vector3(-212.73, -40.19, 50.06),
            vector3(207.8, -190.8, 54.39)
        }
    },
    ['mechanic'] = {
        items = {
            {item = 'repairkit', amount = 1, price = 1000},
            {item = 'cleaningkit', amount = 1, price = 300}
        },
        dropOffLocations = {
            vector3(300.0, -600.0, 29.0),
            vector3(-300.0, 700.0, 32.0),
            vector3(600.0, 300.0, 31.0)
        }
    }
}

Config.Webhook = 'https://discord.com/api/webhooks/1368320543157129247/LakhdgmtpjBcQGJPTa_c_aRjZuj7JcU0LUxUo9z6LWC75BqwxPFpmARK-G-U4MTuTB7F'

Config.FractionPercentage = 60 -- Percentage that goes to society
Config.PlayerPercentage = 40 -- Percentage that goes to player