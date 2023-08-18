#!/bin/bash

# Function to get the current game version
get_current_game_version() {
    # Gotta hit the steam api
    # curl -s 'https://valheim-version-page.com' | grep -oP 'Version: \K\d+\.\d+\.\d+'
    echo "0.0.0"  # Placeholder
}

# Get the server version
get_server_version() {
    # Need to find out where the server logs its version
    # cat /path/to/server/log | grep -oP 'Version: \K\d+\.\d+\.\d+' | tail -1
    echo "0.0.0"  # Placeholder
}

current_game_version=$(get_current_game_version)
server_version=$(get_server_version)

if [ "$current_game_version" != "$server_version" ]; then
    # Kill the server process
    pkill -f      # Adjust this if the process name is different
    echo "Server killed due to version mismatch!"
    sleep 300     # Sleeps 5 minutes to hopefully allow steam to auto update server
    # Run server again
    ./valheim_server.x86_64 -name "Your Server Name" -port 2456 -world "YourWorldName" -password "YourPassword" -public 1
fi
