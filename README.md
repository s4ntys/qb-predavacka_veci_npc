## QBCore Delivery Job Script 🚚
A feature-rich QBCore delivery job script for FiveM servers, designed to enhance roleplay with a customizable delivery system. Players can deliver job-specific items to random locations using the /predatveci command, with earnings split 60% to the job's society account and 40% as cash to the player. The script includes Discord webhook logging, a debug system, and an intuitive 3D text prompt for deliveries.

## ✨ Features

Job-Based Delivery System: Configure unique jobs (e.g., taxi, mechanic) with specific items and drop-off locations.
Item Delivery Mechanics: Players must carry required items to complete deliveries.
Earnings Distribution: Automatically splits earnings (60% society, 40% player).
Discord Webhook Integration: Logs delivery details (player, job, earnings) to a Discord channel.
3D Text Interaction: Displays "[E] Deliver Items" at drop-off points for seamless interaction.
Debug Mode: Toggleable debug system with in-game commands and console logging.
Dynamic Navigation: Random drop-off locations with blip-based guidance.
Highly Configurable: Easily adjust jobs, items, locations, percentages, and more.


## 🛠️ Installation

### Download the Script:
- Clone or download this repository to your server.


### Add to Resources:
- Place the qb-delivery folder in your server's resources directory.


### Configure Settings:
- Open config.lua and customize jobs, items, webhook URL, and other settings.


### Ensure Dependencies:
- Ensure qb-core and qb-management are installed and running.


### Update Server Config:
- Add ensure qb-delivery to your server.cfg.


### Start the Script:
- Restart your server or use refresh followed by start qb-delivery in the console.




⚙️ Customization Options
```Config.lua
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

```

## Client.lua

Modify the DrawText3D function to customize 3D text appearance (font, color, scale).
Adjust the interaction range (default: 5.0 units) in the delivery check loop.

## Server.lua

Customize the Discord webhook embed (color, title, format) for personalized logs.
Add custom server-side logic for delivery completion.


## 🎮 Usage

Players with configured jobs (e.g., taxi, mechanic) can use /predatveci to start a delivery.
They must carry the required items and follow the blip to a random drop-off point.
At the location, a 3D text prompt ("[E] Deliver Items") appears when within 5 units.
Press E to complete the delivery, distributing earnings and logging to Discord.


## 🐛 Debugging

Enable Config.Debug = true in config.lua for detailed logging.
Use /debugdelivery in-game to check the current job and delivery status.
Monitor server console for delivery details when debug mode is active.


## 📋 Dependencies

QBCore Framework
QB-Management


## ℹ️ Notes

Verify your Discord webhook URL is valid and has proper permissions.
Test with debug mode enabled to ensure job configurations and item availability.
Perfect for servers aiming to add immersive job-based delivery missions.


## 📜 License
This project is licensed under the MIT License. See the LICENSE file for details.

## 🙌 Credits

Author: [SanTy]
Framework: QBCore
Purpose: Built to enhance FiveM roleplay with engaging delivery jobs


## ⭐ Star this repository if you find it useful! Contributions and feedback are welcome!
