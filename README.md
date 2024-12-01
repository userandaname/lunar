# Lunar for Roblox

Lunar is a comprehensive admin suite for Roblox, built from the ground up to provide robust and efficient administrative tools for game developers and administrators.

## Features

- **Command Handling**: Easily manage player commands such as visibility, speed, and tool allocation.
- **Data Management**: Save and restore player data seamlessly with integrated DataStore support.
- **GUI Management**: Intuitive and draggable GUI elements for a better user experience.
- **Sound Management**: Play and manage sounds for various in-game events.
- **Notification System**: Display notifications to players with customizable messages.
- **Rate Limiting**: Prevent command spamming with built-in rate-limiting.

## Installation

1. Clone the repository to your local machine:

```bash
    git clone https://github.com/userandaname/lunar
```

2. Open the project in Roblox Studio.
3. Copy the file `./binaries/Lunar.rbxm` onto your workspace in Roblox Studio.
4. That's it! Lunar Stable will now start up and auto-configure once you start your game.
5. If you want to develop for Lunar, then toggle the ShouldRunDev value to True.
6. Import the LunarModule folder onto your workspace in Roblox Studio, ensuring that all `.rbxm` files have been imported correctly too.
7. That's also it! Lunar will now load Lunar Dev - the developmental copy of Lunar on your Studio game.

## Usage

### Command Handling

Commands can be managed through the `CommandHandler` scripts located in both server and client scripts:
- Server: [`src/LunarModule/LunarServerScripts/CommandHandler.lua`](src/LunarModule/LunarServerScripts/CommandHandler.lua)
- Client: [`src/LunarModule/LunarLocalScripts/CommandHandler.lua`](src/LunarModule/LunarLocalScripts/CommandHandler.lua)

### Data Management

You can save and restore player data using the `SaveDataServer` and `SaveDataClient` scripts:
- Server: [`src/LunarModule/LunarServerScripts/SaveDataServer.lua`](src/LunarModule/LunarServerScripts/SaveDataServer.lua)
- Client: [`src/LunarModule/LunarLocalScripts/SaveDataClient.lua`](src/LunarModule/LunarLocalScripts/SaveDataClient.lua)

### GUI Management

Manage GUI elements with the `GUIHandler` script:
- Client: [`src/LunarModule/LunarLocalScripts/GUIHandler.lua`](src/LunarModule/LunarLocalScripts/GUIHandler.lua)

### Sound Management

Play and manage sounds using the `PlaySound` script:
- Client: [`src/LunarModule/LunarLocalScripts/PlaySound.lua`](src/LunarModule/LunarLocalScripts/PlaySound.lua)

### Notification System

Display notifications to players with the `ShowNotificationFrame` script:
- Client: [`src/LunarModule/LunarLocalScripts/ShowNotificationFrame.lua`](src/LunarModule/LunarLocalScripts/ShowNotificationFrame.lua)

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes. Ensure your code follows the necessary standards to work well with Lunar for Roblox, and includes appropriate tests.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.