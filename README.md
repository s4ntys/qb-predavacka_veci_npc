QBCore Delivery Job Script
A comprehensive QBCore delivery job script for FiveM servers, designed to enhance roleplay with a customizable delivery system. Players can deliver job-specific items to designated locations using the /predatveci command, with 60% of earnings going to the job's society account and 40% as cash to the player. The script includes a Discord webhook for logging deliveries, a debug system, and a 3D text prompt for interaction.
Features

Job-Based Delivery System: Configurable jobs (e.g., taxi, mechanic) with specific items and drop-off locations.
Item Delivery Mechanics: Players must have required items in their inventory to complete deliveries.
Earnings Split: 60% of the total item value goes to the job's society account, 40% to the player as cash.
Discord Webhook Integration: Logs delivery details (player, job, society earnings, player earnings) to a Discord channel.
3D Text Interaction: Displays "[E] Deliver Items" prompt at delivery locations for intuitive interaction.
Debug Mode: Toggleable debug system for troubleshooting and monitoring script status.
Blip Navigation: Dynamic blips guide players to random drop-off locations.
Configurable Settings: Easily customize jobs, items, locations, percentages, and webhook URL.

Installation

Download the Script: Clone or download this repository.
Add to Resources: Place the script folder (e.g., qb-delivery) in your server's resources directory.
Configure the Script: Open config.lua and adjust settings (jobs, items, webhook, etc.) to suit your server.
Ensure Dependencies: Ensure qb-core and qb-management are installed and running on your server.
Add to Server Config: Add ensure qb-delivery to your server.cfg file.
Restart Server: Restart your server or use the refresh and start qb-delivery commands in the server console.

Customization Options

Config.lua:
Config.Debug: Set to true to enable debug mode, which includes console logging and the /debugdelivery command.
Config.Jobs: Define jobs, their required items (name, amount, price), and drop-off coordinates. Example:['taxi'] = {
    items = {
        {item = 'phone', amount = 1, price = 500},
        {item = 'water', amount = 2, price = 100}
    },
    dropOffLocations = {
        vector3(200.0, -800.0, 31.0),
        vector3(-200.0, 600.0, 33.0)
    }
}


Config.Webhook: Replace with your Discord webhook URL for delivery logs.
Config.FractionPercentage & Config.PlayerPercentage: Adjust the earnings split (default: 60% society, 40% player).


Client.lua:
Modify the DrawText3D function to change the 3D text appearance (e.g., font, color, scale).
Adjust the interaction range (default: 5.0 units) in the delivery check loop.


Server.lua:
Customize the Discord webhook embed (e.g., color, title, format) to change the appearance of logs.
Add additional server-side logic for delivery completion if needed.



Usage

Players with configured jobs (e.g., taxi, mechanic) can use the /predatveci command to start a delivery.
They must have the required items in their inventory and navigate to the designated drop-off point.
At the drop-off location, a 3D text prompt ("[E] Deliver Items") appears when within 5 units.
Pressing E completes the delivery if all items are present, distributing earnings and sending a webhook log.

Debugging

Enable Config.Debug = true in config.lua to activate debug mode.
Use the /debugdelivery command in-game to print the current job and delivery status to the console.
Check server logs for detailed delivery information when debug mode is enabled.

Dependencies

qb-core
qb-management

Notes

Ensure your Discord webhook URL is valid and has the necessary permissions to receive messages.
Test the script with debug mode enabled to verify job configurations and item availability.
This script is ideal for server owners looking to add engaging job-based delivery missions with seamless integration and extensive customization options.

License
This project is licensed under the MIT License. See the LICENSE file for details.
Credits

Created by [Your Name]
Built for the QBCore Framework

