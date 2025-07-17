#!/bin/bash
# Backup Tulen Desktop Config
tar -czf ~/tulen-desktop-backup.tar.gz ~/.local/share/backgrounds/tulen_advanced_launcher.html ~/.config/conky/conky.conf ~/.local/bin/tulen-* ~/.bashrc
echo "Backup completed: ~/tulen-desktop-backup.tar.gz"
