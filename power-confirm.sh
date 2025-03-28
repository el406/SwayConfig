#!/bin/bash

# Show a notification for confirmation
makoctl dispatch notification -a power-button-confirmation "Power Button Pressed" "Press again within 10 seconds to shut down"

# Wait for a second press within a timeout
if swaymsg -t get_binding_state | grep -q "power-confirm"; then
    swaymsg mode "default"
    systemctl poweroff
else
    swaymsg mode "power-confirm"
    sleep 10
    swaymsg mode "default"
fi

