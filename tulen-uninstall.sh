#!/bin/bash
echo "Removing Tulen Desktop..."
rm -rf ~/.local/share/backgrounds/tulen_*
rm -rf ~/.local/bin/tulen-*
rm -rf ~/.config/autostart/tulen-*
rm -rf ~/.local/share/applications/tulen-*
pkill conky
echo "Tulen Desktop removed!"
