#!/bin/bash

# Tulen Desktop Launcher System
# Advanced wallpaper launcher with real app execution capability

# Colors for output
CYAN='\033[0;36m'
WHITE='\033[1;37m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_header() {
    echo -e "${CYAN}"
    echo "    ⚔️  至尊劍仙桌面啟動器  ⚔️"
    echo "  「劍指蒼穹，星辰為伴」"
    echo "================================="
    echo -e "${NC}"
}

# Create advanced HTML wallpaper with real app launching capability
create_advanced_wallpaper() {
    mkdir -p ~/.local/share/backgrounds
    
    cat > ~/.local/share/backgrounds/tulen_advanced_launcher.html << 'EOF'
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tulen Desktop Launcher</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            background: linear-gradient(135deg, #0a0a0a 0%, #1a1a2e 30%, #16213e 60%, #0f3460 100%);
            overflow: hidden;
            font-family: 'Source Han Sans CN', 'Microsoft YaHei', sans-serif;
            height: 100vh;
            position: relative;
        }
        
        .container {
            position: relative;
            width: 100vw;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        /* Animated stars background */
        .stars-container {
            position: absolute;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 1;
        }
        
        .star {
            position: absolute;
            background: #00ffff;
            border-radius: 50%;
            animation: twinkle 3s ease-in-out infinite;
        }
        
        .star.small {
            width: 2px;
            height: 2px;
            box-shadow: 0 0 6px #00ffff;
        }
        
        .star.medium {
            width: 4px;
            height: 4px;
            box-shadow: 0 0 10px #00ffff;
        }
        
        .star.large {
            width: 6px;
            height: 6px;
            box-shadow: 0 0 15px #00ffff;
        }
        
        /* Central Taichi */
        .taichi-main {
            position: absolute;
            width: 200px;
            height: 200px;
            animation: rotate-slow 30s linear infinite;
            z-index: 5;
            opacity: 0.8;
        }
        
        .taichi-circle {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            background: linear-gradient(90deg, #00ffff 50%, #ffffff 50%);
            position: relative;
            overflow: hidden;
            box-shadow: 0 0 60px rgba(0, 255, 255, 0.8);
        }
        
        .taichi-circle::before {
            content: '';
            position: absolute;
            top: 0;
            left: 25%;
            width: 50%;
            height: 50%;
            background: #ffffff;
            border-radius: 50%;
        }
        
        .taichi-circle::after {
            content: '';
            position: absolute;
            bottom: 0;
            right: 25%;
            width: 50%;
            height: 50%;
            background: #00ffff;
            border-radius: 50%;
        }
        
        .taichi-dot-blue {
            position: absolute;
            top: 37.5%;
            left: 37.5%;
            width: 25%;
            height: 25%;
            background: #00ffff;
            border-radius: 50%;
            z-index: 2;
        }
        
        .taichi-dot-white {
            position: absolute;
            bottom: 37.5%;
            right: 37.5%;
            width: 25%;
            height: 25%;
            background: #ffffff;
            border-radius: 50%;
            z-index: 2;
        }
        
        /* Spirit Orbs */
        .spirit-orb {
            position: absolute;
            width: 120px;
            height: 120px;
            border-radius: 50%;
            cursor: pointer;
            z-index: 15;
            transition: all 0.4s ease;
            animation: orb-float 6s ease-in-out infinite;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: #ffffff;
            font-size: 14px;
            font-weight: bold;
            text-shadow: 0 0 10px rgba(0, 255, 255, 0.8);
        }
        
        .spirit-orb:hover {
            transform: scale(1.3);
            box-shadow: 0 0 80px rgba(0, 255, 255, 1);
        }
        
        .spirit-orb.orb1 {
            top: 15%;
            left: 15%;
            background: radial-gradient(circle, #00ffff 0%, #4da6ff 50%, #0066cc 100%);
            box-shadow: 0 0 40px rgba(0, 255, 255, 0.8);
            animation-delay: 0s;
        }
        
        .spirit-orb.orb2 {
            top: 15%;
            right: 15%;
            background: radial-gradient(circle, #66ffff 0%, #00cccc 50%, #004d4d 100%);
            box-shadow: 0 0 40px rgba(102, 255, 255, 0.8);
            animation-delay: 1.5s;
        }
        
        .spirit-orb.orb3 {
            bottom: 15%;
            left: 15%;
            background: radial-gradient(circle, #80ffff 0%, #33cccc 50%, #006666 100%);
            box-shadow: 0 0 40px rgba(128, 255, 255, 0.8);
            animation-delay: 3s;
        }
        
        .spirit-orb.orb4 {
            bottom: 15%;
            right: 15%;
            background: radial-gradient(circle, #ccffff 0%, #66cccc 50%, #336666 100%);
            box-shadow: 0 0 40px rgba(204, 255, 255, 0.8);
            animation-delay: 4.5s;
        }
        
        .orb-icon {
            font-size: 36px;
            margin-bottom: 8px;
        }
        
        .orb-label {
            font-size: 16px;
            font-weight: bold;
        }
        
        /* Connecting lines */
        .connection-line {
            position: absolute;
            height: 3px;
            background: linear-gradient(90deg, transparent, rgba(0, 255, 255, 0.8), transparent);
            animation: line-pulse 4s ease-in-out infinite;
            z-index: 3;
        }
        
        .line-horizontal-top {
            top: 20%;
            left: 15%;
            width: 70%;
            animation-delay: 0s;
        }
        
        .line-horizontal-bottom {
            bottom: 20%;
            left: 15%;
            width: 70%;
            animation-delay: 2s;
        }
        
        .line-vertical-left {
            left: 20%;
            top: 15%;
            width: 3px;
            height: 70%;
            animation-delay: 1s;
        }
        
        .line-vertical-right {
            right: 20%;
            top: 15%;
            width: 3px;
            height: 70%;
            animation-delay: 3s;
        }
        
        /* Title */
        .main-title {
            position: absolute;
            top: 5%;
            left: 50%;
            transform: translateX(-50%);
            font-size: 56px;
            color: #00ffff;
            font-weight: bold;
            text-shadow: 0 0 40px rgba(0, 255, 255, 1);
            animation: title-glow 4s ease-in-out infinite;
            z-index: 10;
        }
        
        .subtitle {
            position: absolute;
            bottom: 5%;
            left: 50%;
            transform: translateX(-50%);
            font-size: 24px;
            color: #ffffff;
            text-align: center;
            animation: fade-in-out 6s ease-in-out infinite;
            z-index: 10;
        }
        
        /* App Launcher Modal */
        .app-launcher {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(0);
            width: 500px;
            height: 400px;
            background: linear-gradient(135deg, rgba(0, 0, 0, 0.95), rgba(26, 26, 46, 0.95));
            border-radius: 20px;
            border: 3px solid rgba(0, 255, 255, 0.7);
            box-shadow: 0 0 80px rgba(0, 255, 255, 0.6);
            z-index: 100;
            transition: all 0.4s ease;
            backdrop-filter: blur(15px);
        }
        
        .app-launcher.show {
            transform: translate(-50%, -50%) scale(1);
        }
        
        .launcher-header {
            padding: 20px;
            border-bottom: 2px solid rgba(0, 255, 255, 0.4);
            text-align: center;
            position: relative;
        }
        
        .launcher-title {
            color: #00ffff;
            font-size: 24px;
            font-weight: bold;
            margin: 0;
            text-shadow: 0 0 20px rgba(0, 255, 255, 0.8);
        }
        
        .close-btn {
            position: absolute;
            top: 15px;
            right: 20px;
            background: none;
            border: none;
            color: #00ffff;
            font-size: 28px;
            cursor: pointer;
            transition: all 0.3s ease;
            padding: 5px;
            border-radius: 50%;
        }
        
        .close-btn:hover {
            color: #ffffff;
            background: rgba(0, 255, 255, 0.2);
            transform: scale(1.1);
        }
        
        .app-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            padding: 30px;
            height: 300px;
            overflow-y: auto;
        }
        
        .app-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
            background: rgba(0, 255, 255, 0.15);
            border-radius: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
            border: 2px solid rgba(0, 255, 255, 0.3);
            position: relative;
            overflow: hidden;
        }
        
        .app-item:hover {
            background: rgba(0, 255, 255, 0.25);
            transform: translateY(-8px);
            box-shadow: 0 8px 25px rgba(0, 255, 255, 0.4);
            border-color: rgba(0, 255, 255, 0.8);
        }
        
        .app-item::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            transition: left 0.5s ease;
        }
        
        .app-item:hover::before {
            left: 100%;
        }
        
        .app-icon {
            font-size: 32px;
            margin-bottom: 12px;
            filter: drop-shadow(0 0 8px rgba(0, 255, 255, 0.6));
        }
        
        .app-name {
            color: #ffffff;
            font-size: 14px;
            text-align: center;
            font-weight: bold;
            text-shadow: 0 0 10px rgba(0, 255, 255, 0.5);
        }
        
        /* Animations */
        @keyframes twinkle {
            0%, 100% { opacity: 0.3; transform: scale(1); }
            50% { opacity: 1; transform: scale(1.5); }
        }
        
        @keyframes rotate-slow {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        @keyframes orb-float {
            0%, 100% { 
                transform: translateY(0px); 
            }
            50% { 
                transform: translateY(-15px); 
            }
        }
        
        @keyframes line-pulse {
            0%, 100% { 
                opacity: 0.4; 
                background: linear-gradient(90deg, transparent, rgba(0, 255, 255, 0.4), transparent);
            }
            50% { 
                opacity: 1; 
                background: linear-gradient(90deg, transparent, rgba(0, 255, 255, 1), transparent);
            }
        }
        
        @keyframes title-glow {
            0%, 100% { 
                text-shadow: 0 0 40px rgba(0, 255, 255, 1);
                color: #00ffff;
            }
            50% { 
                text-shadow: 0 0 60px rgba(0, 255, 255, 1), 0 0 100px rgba(255, 255, 255, 0.8);
                color: #ffffff;
            }
        }
        
        @keyframes fade-in-out {
            0%, 100% { opacity: 0.7; }
            50% { opacity: 1; }
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .spirit-orb {
                width: 80px;
                height: 80px;
                font-size: 12px;
            }
            
            .orb-icon {
                font-size: 24px;
            }
            
            .orb-label {
                font-size: 12px;
            }
            
            .app-launcher {
                width: 90%;
                height: 70%;
            }
            
            .app-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="stars-container" id="starsContainer"></div>
        
        <!-- Connecting lines -->
        <div class="connection-line line-horizontal-top"></div>
        <div class="connection-line line-horizontal-bottom"></div>
        <div class="connection-line line-vertical-left"></div>
        <div class="connection-line line-vertical-right"></div>
        
        <!-- Spirit Orbs -->
        <div class="spirit-orb orb1" onclick="openLauncher('system')" title="系統工具">
            <div class="orb-icon">⚙️</div>
            <div class="orb-label">系統</div>
        </div>
        
        <div class="spirit-orb orb2" onclick="openLauncher('internet')" title="網絡應用">
            <div class="orb-icon">🌐</div>
            <div class="orb-label">網絡</div>
        </div>
        
        <div class="spirit-orb orb3" onclick="openLauncher('media')" title="媒體娛樂">
            <div class="orb-icon">🎬</div>
            <div class="orb-label">媒體</div>
        </div>
        
        <div class="spirit-orb orb4" onclick="openLauncher('development')" title="開發工具">
            <div class="orb-icon">💻</div>
            <div class="orb-label">開發</div>
        </div>
        
        <!-- Central Taichi -->
        <div class="taichi-main">
            <div class="taichi-circle">
                <div class="taichi-dot-blue"></div>
                <div class="taichi-dot-white"></div>
            </div>
        </div>
        
        <div class="main-title">至尊劍仙</div>
        <div class="subtitle">
            <div>「劍指蒼穹，星辰為伴」</div>
            <div style="font-size: 18px; margin-top: 10px; opacity: 0.8;">
                Tulen Desktop Launcher
            </div>
        </div>
    </div>
    
    <!-- App Launcher Modal -->
    <div id="appLauncher" class="app-launcher">
        <div class="launcher-header">
            <h3 class="launcher-title" id="launcherTitle">應用程式</h3>
            <button class="close-btn" onclick="closeLauncher()">×</button>
        </div>
        <div class="app-grid" id="appGrid"></div>
    </div>
    
    <script>
        // App categories configuration
        const appCategories = {
            system: {
                title: "系統工具",
                apps: [
                    { name: "終端機", icon: "💻", command: "gnome-terminal", description: "命令行終端" },
                    { name: "文件管理", icon: "📁", command: "nautilus", description: "文件瀏覽器" },
                    { name: "系統監視", icon: "📊", command: "gnome-system-monitor", description: "系統資源監控" },
                    { name: "設定", icon: "⚙️", command: "gnome-control-center", description: "系統設定" },
                    { name: "調整工具", icon: "🔧", command: "gnome-tweaks", description: "桌面調整" },
                    { name: "軟體中心", icon: "📦", command: "gnome-software", description: "軟體安裝" }
                ]
            },
            internet: {
                title: "網絡應用",
                apps: [
                    { name: "Firefox", icon: "🌐", command: "firefox", description: "網頁瀏覽器" },
                    { name: "Thunderbird", icon: "📧", command: "thunderbird", description: "郵件客戶端" },
                    { name: "Discord", icon: "💬", command: "discord", description: "語音聊天" },
                    { name: "Steam", icon: "🎮", command: "steam", description: "遊戲平台" },
                    { name: "Telegram", icon: "📱", command: "telegram-desktop", description: "即時通訊" },
                    { name: "Chrome", icon: "🌍", command: "google-chrome", description: "Google瀏覽器" }
                ]
            },
            media: {
                title: "媒體娛樂",
                apps: [
                    { name: "VLC", icon: "🎬", command: "vlc", description: "媒體播放器" },
                    { name: "GIMP", icon: "🖼️", command: "gimp", description: "圖像編輯" },
                    { name: "Audacity", icon: "🎤", command: "audacity", description: "音頻編輯" },
                    { name: "Blender", icon: "🎨", command: "blender", description: "3D建模" },
                    { name: "OBS Studio", icon: "📹", command: "obs", description: "直播錄製" },
                    { name: "Spotify", icon: "🎵", command: "spotify", description: "音樂播放" }
                ]
            },
            development: {
                title: "開發工具",
                apps: [
                    { name: "VS Code", icon: "💾", command: "code", description: "代碼編輯器" },
                    { name: "Git GUI", icon: "🐙", command: "git-gui", description: "Git圖形界面" },
                    { name: "Docker", icon: "🐳", command: "docker", description: "容器管理" },
                    { name: "Python", icon: "🐍", command: "python3", description: "Python解釋器" },
                    { name: "Node.js", icon: "💚", command: "node", description: "Node.js運行時" },
                    { name: "MySQL", icon: "🗄️", command: "mysql-workbench", description: "數據庫管理" }
                ]
            }
        };
        
        // Create stars
        function createStars() {
            const container = document.getElementById('starsContainer');
            const starCount = 300;
            
            for (let i = 0; i < starCount; i++) {
                const star = document.createElement('div');
                star.className = 'star';
                
                const size = Math.random();
                if (size < 0.6) {
                    star.classList.add('small');
                } else if (size < 0.9) {
                    star.classList.add('medium');
                } else {
                    star.classList.add('large');
                }
                
                star.style.left = Math.random() * 100 + '%';
                star.style.top = Math.random() * 100 + '%';
                star.style.animationDelay = Math.random() * 3 + 's';
                
                container.appendChild(star);
            }
        }
        
        // Open launcher
        function openLauncher(category) {
            const launcher = document.getElementById('appLauncher');
            const title = document.getElementById('launcherTitle');
            const grid = document.getElementById('appGrid');
            
            title.textContent = appCategories[category].title;
            
            grid.innerHTML = '';
            appCategories[category].apps.forEach(app => {
                const appItem = document.createElement('div');
                appItem.className = 'app-item';
                appItem.onclick = () => launchApp(app.command, app.name);
                appItem.innerHTML = `
                    <div class="app-icon">${app.icon}</div>
                    <div class="app-name">${app.name}</div>
                `;
                appItem.title = app.description;
                grid.appendChild(appItem);
            });
            
            launcher.classList.add('show');
        }
        
        // Close launcher
        function closeLauncher() {
            const launcher = document.getElementById('appLauncher');
            launcher.classList.remove('show');
        }
        
        // Launch app
        function launchApp(command, name) {
            // In a real desktop environment, this would execute the command
            // For now, we'll use a system call through a local script
            
            // Try to execute via local launcher script
            try {
                const xhr = new XMLHttpRequest();
                xhr.open('POST', '/launch-app', true);
                xhr.setRequestHeader('Content-Type', 'application/json');
                xhr.send(JSON.stringify({command: command}));
            } catch (e) {
                // Fallback: show notification
                console.log('Launching:', command);
                
                // Create notification
                const notification = document.createElement('div');
                notification.style.cssText = `
                    position: fixed;
                    top: 20px;
                    right: 20px;
                    background: linear-gradient(135deg, rgba(0, 255, 255, 0.9), rgba(0, 150, 150, 0.9));
                    color: white;
                    padding: 15px 20px;
                    border-radius: 10px;
                    box-shadow: 0 5px 15px rgba(0, 255, 255, 0.5);
                    z-index: 1000;
                    font-weight: bold;
                    animation: slideIn 0.3s ease;
                `;
                notification.textContent = `正在啟動: ${name}`;
                document.body.appendChild(notification);
                
                setTimeout(() => {
                    notification.remove();
                }, 3000);
            }
            
            closeLauncher();
        }
        
        // Event listeners
        document.addEventListener('click', function(event) {
            const launcher = document.getElementById('appLauncher');
            const orbs = document.querySelectorAll('.spirit-orb');
            
            if (!launcher.contains(event.target) && 
                !Array.from(orbs).some(orb => orb.contains(event.target))) {
                closeLauncher();
            }
        });
        
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') {
                closeLauncher();
            }
        });
        
        // Add slide-in animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes slideIn {
                from {
                    transform: translateX(100%);
                    opacity: 0;
                }
                to {
                    transform: translateX(0);
                    opacity: 1;
                }
            }
        `;
        document.head.appendChild(style);
        
        // Initialize
        document.addEventListener('DOMContentLoaded', function() {
            createStars();
            
            // Add welcome message
            setTimeout(() => {
                const welcome = document.createElement('div');
                welcome.style.cssText = `
                    position: fixed;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    background: rgba(0, 0, 0, 0.8);
                    color: #00ffff;
                    padding: 20px;
                    border-radius: 10px;
                    border: 2px solid #00ffff;
                    text-align: center;
                    font-size: 18px;
                    z-index: 1000;
                    animation: fadeIn 0.5s ease;
                `;
                welcome.innerHTML = `
                    <h3>🎮 歡迎使用至尊劍仙桌面啟動器！</h3>
                    <p>點擊四個靈力球啟動應用程式</p>
                    <button onclick="this.parentElement.remove()" style="
                        background: #00ffff;
                        border: none;
                        color: black;
                        padding: 8px 16px;
                        border-radius: 5px;
                        cursor: pointer;
                        margin-top: 10px;
                    ">開始使用</button>
                `;
                document.body.appendChild(welcome);
            }, 1000);
        });
    </script>
</body>
</html>
EOF
}

# Create desktop launcher service
create_launcher_service() {
    mkdir -p ~/.local/bin
    
    cat > ~/.local/bin/tulen-app-launcher << 'EOF'
#!/bin/bash

# Tulen App Launcher Service
# This script provides a bridge between the HTML launcher and system applications

APP_COMMAND="$1"
APP_NAME="$2"

# Log the launch attempt
echo "$(date): Launching $APP_NAME ($APP_COMMAND)" >> ~/.local/share/tulen-launcher.log

# Check if the application exists
if command -v "$APP_COMMAND" &> /dev/null; then
    # Launch the application in the background
    nohup "$APP_COMMAND" &> /dev/null &
    
    # Send notification
    if command -v notify-send &> /dev/null; then
        notify-send "至尊劍仙啟動器" "正在啟動: $APP_NAME" -i applications-system -t 3000
    fi
    
    echo "$(date): Successfully launched $APP_NAME" >> ~/.local/share/tulen-launcher.log
else
    # Application not found
    if command -v notify-send &> /dev/null; then
        notify-send "至尊劍仙啟動器" "找不到應用程式: $APP_NAME" -i dialog-error -t 3000
    fi
    
    echo "$(date): Failed to launch $APP_NAME - command not found" >> ~/.local/share/tulen-launcher.log
fi
EOF

    chmod +x ~/.local/bin/tulen-app-launcher
}

# Create a simple HTTP server for app launching
create_launch_server() {
    cat > ~/.local/bin/tulen-launch-server << 'EOF'
#!/usr/bin/env python3

import http.server
import socketserver
import json
import subprocess
import os
import sys
from urllib.parse import urlparse

class LaunchHandler(http.server.SimpleHTTPRequestHandler):
    def do_POST(self):
        if self.path == '/launch-app':
            content_length = int(self.headers['Content-Length'])
            post_data = self.rfile.read(content_length)
            
            try:
                data = json.loads(post_data.decode('utf-8'))
                command = data.get('command', '')
                
                if command:
                    # Launch the application
                    subprocess.Popen([command], 
                                   stdout=subprocess.DEVNULL, 
                                   stderr=subprocess.DEVNULL,
                                   preexec_fn=os.setsid)
                    
                    self.send_response(200)
                    self.send_header('Content-type', 'application/json')
                    self.end_headers()
                    response = {'status': 'success', 'message': f'Launched {command}'}
                    self.wfile.write(json.dumps(response).encode())
                else:
                    self.send_response(400)
                    self.end_headers()
                    
            except Exception as e:
                self.send_response(500)
                self.end_headers()
print(f"Error: {e}")
       else:
           self.send_response(404)
           self.end_headers()

def start_server():
   PORT = 8765
   Handler = LaunchHandler
   
   with socketserver.TCPServer(("", PORT), Handler) as httpd:
       print(f"Tulen Launch Server running on port {PORT}")
       httpd.serve_forever()

if __name__ == "__main__":
   start_server()
EOF

   chmod +x ~/.local/bin/tulen-launch-server
}

# Create desktop entry
create_desktop_entry() {
   mkdir -p ~/.local/share/applications
   
   cat > ~/.local/share/applications/tulen-launcher.desktop << 'EOF'
[Desktop Entry]
Name=Tulen Desktop Launcher
Name[zh_CN]=至尊劍仙桌面啟動器
Comment=Tulen Desktop Launcher with animated wallpaper
Comment[zh_CN]=至尊劍仙桌面啟動器與動態桌布
Exec=firefox ~/.local/share/backgrounds/tulen_advanced_launcher.html
Icon=applications-system
Terminal=false
Type=Application
Categories=System;Utility;
StartupNotify=true
EOF

   cat > ~/.local/share/applications/tulen-launcher-server.desktop << 'EOF'
[Desktop Entry]
Name=Tulen Launch Server
Name[zh_CN]=至尊劍仙啟動服務
Comment=Background service for Tulen Desktop Launcher
Comment[zh_CN]=至尊劍仙桌面啟動器後台服務
Exec=~/.local/bin/tulen-launch-server
Icon=applications-system
Terminal=false
Type=Application
Categories=System;Utility;
StartupNotify=false
Hidden=true
EOF

   # Make desktop entries executable
   chmod +x ~/.local/share/applications/tulen-launcher.desktop
   chmod +x ~/.local/share/applications/tulen-launcher-server.desktop
}

# Create autostart entries
create_autostart() {
   mkdir -p ~/.config/autostart
   
   cat > ~/.config/autostart/tulen-launch-server.desktop << 'EOF'
[Desktop Entry]
Type=Application
Name=Tulen Launch Server
Exec=~/.local/bin/tulen-launch-server
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
EOF
}

# Install desktop launcher system
install_launcher_system() {
   print_header
   
   echo -e "${YELLOW}正在安裝至尊劍仙桌面啟動器系統...${NC}"
   
   # Create components
   create_advanced_wallpaper
   echo -e "${GREEN}✅ 創建進階動態桌布${NC}"
   
   create_launcher_service
   echo -e "${GREEN}✅ 創建啟動器服務${NC}"
   
   create_launch_server
   echo -e "${GREEN}✅ 創建啟動服務器${NC}"
   
   create_desktop_entry
   echo -e "${GREEN}✅ 創建桌面條目${NC}"
   
   create_autostart
   echo -e "${GREEN}✅ 配置自動啟動${NC}"
   
   # Update desktop database
   update-desktop-database ~/.local/share/applications/ 2>/dev/null || true
   
   echo
   echo -e "${CYAN}===============================================${NC}"
   echo -e "${WHITE}🎉 至尊劍仙桌面啟動器安裝完成！${NC}"
   echo -e "${CYAN}===============================================${NC}"
   echo
   echo -e "${GREEN}✅ 已完成安裝:${NC}"
   echo -e "   • 進階動態桌布與啟動器"
   echo -e "   • 應用程式啟動服務"
   echo -e "   • 後台HTTP服務器"
   echo -e "   • 桌面條目和自動啟動"
   echo
   echo -e "${YELLOW}📝 使用方法:${NC}"
   echo -e "   1. 啟動服務器: ${CYAN}~/.local/bin/tulen-launch-server &${NC}"
   echo -e "   2. 打開啟動器: ${CYAN}firefox ~/.local/share/backgrounds/tulen_advanced_launcher.html${NC}"
   echo -e "   3. 或從應用程式選單啟動: ${CYAN}Tulen Desktop Launcher${NC}"
   echo
   echo -e "${YELLOW}🔧 設定為桌布:${NC}"
   echo -e "   可以使用 Komorebi 或類似工具將HTML設為動態桌布"
   echo
   echo -e "${GREEN}🎮 點擊四個靈力球即可啟動應用程式！${NC}"
   echo -e "${CYAN}「劍指蒼穹，星辰為伴」⚔️✨${NC}"
}

# Main execution
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
   install_launcher_system
fi
