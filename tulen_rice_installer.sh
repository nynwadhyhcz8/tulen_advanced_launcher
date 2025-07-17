#!/bin/bash

# Tulen Chí Tôn Kiếm Tiên - Complete Desktop Rice Setup
# Debian 12 Gnome Desktop Customization Script

set -e

# Colors for output
CYAN='\033[0;36m'
WHITE='\033[1;37m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Print header
print_header() {
    clear
    echo -e "${CYAN}"
    echo "    ⚔️  至尊劍仙桌面美化  ⚔️"
    echo "  「劍指蒼穹，星辰為伴」"
    echo "================================="
    echo -e "${NC}"
}

# Print step
print_step() {
    echo -e "${YELLOW}[步驟] $1${NC}"
}

# Print success
print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

# Print error
print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Check if running as root
check_root() {
    if [[ $EUID -eq 0 ]]; then
        print_error "請不要以 root 用戶運行此腳本"
        exit 1
    fi
}

# Update system
update_system() {
    print_step "更新系統..."
    sudo apt update && sudo apt upgrade -y
    print_success "系統更新完成"
}

# Install base packages
install_base_packages() {
    print_step "安裝基礎套件..."
    sudo apt install -y \
        gnome-shell-extensions \
        gnome-tweaks \
        chrome-gnome-shell \
        git \
        wget \
        curl \
        unzip \
        conky-all \
        plank \
        neofetch \
        fonts-noto-cjk \
        fonts-wqy-zenhei \
        fonts-wqy-microhei \
        gir1.2-gst-plugins-base-1.0 \
        gstreamer1.0-plugins-good \
        firefox-esr
    
    print_success "基礎套件安裝完成"
}

# Install themes
install_themes() {
    print_step "安裝主題..."
    
    # Create directories
    mkdir -p ~/.themes ~/.icons ~/.local/share/backgrounds
    
    # Install GTK theme
    cd /tmp
    git clone https://github.com/vinceliuice/Orchis-theme.git
    cd Orchis-theme
    ./install.sh -c dark -c light --tweaks solid
    
    # Install icon theme
    cd /tmp
    git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
    cd Tela-circle-icon-theme
    ./install.sh -a
    
    print_success "主題安裝完成"
}

# Install fonts
install_fonts() {
    print_step "安裝字體..."
    
    mkdir -p ~/.fonts
    cd ~/.fonts
    
    # Download Chinese fonts
    wget -q https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansCN.zip
    if [ -f "SourceHanSansCN.zip" ]; then
        unzip -q SourceHanSansCN.zip
        rm SourceHanSansCN.zip
    fi
    
    # Refresh font cache
    fc-cache -f -v > /dev/null 2>&1
    
    print_success "字體安裝完成"
}

# Setup conky
setup_conky() {
    print_step "設置 Conky..."
    
    mkdir -p ~/.config/conky
    
    # Create conky config
    cat > ~/.config/conky/conky.conf << 'EOF'
conky.config = {
    alignment = 'top_right',
    background = false,
    border_width = 1,
    cpu_avg_samples = 2,
    default_color = '#00ffff',
    default_outline_color = '#00ffff',
    default_shade_color = '#ffffff',
    draw_borders = false,
    draw_graph_borders = true,
    draw_outline = false,
    draw_shades = false,
    use_xft = true,
    font = 'Ubuntu Mono:size=10',
    gap_x = 20,
    gap_y = 60,
    minimum_height = 5,
    minimum_width = 5,
    net_avg_samples = 2,
    no_buffers = true,
    out_to_console = false,
    out_to_stderr = false,
    extra_newline = false,
    own_window = true,
    own_window_class = 'Conky',
    own_window_type = 'desktop',
    own_window_transparent = true,
    own_window_argb_visual = true,
    own_window_argb_value = 0,
    stippled_borders = 0,
    update_interval = 1.0,
    uppercase = false,
    use_spacer = 'none',
    show_graph_scale = false,
    show_graph_range = false,
    double_buffer = true,
}

conky.text = [[
${color #00ffff}${font Ubuntu:style=Bold:size=16}至尊劍仙 系統監控${font}
${color #ffffff}${hr 2}

${color #00ffff}${font Ubuntu:style=Bold:size=12}⚔️ 修仙境界 (系統信息)${font}
${color #ffffff}劍仙: ${color #00ffff}${USER}@${nodename}
${color #ffffff}修煉時間: ${color #00ffff}${uptime}
${color #ffffff}靈力 (內存): ${color #00ffff}${mem} / ${memmax}
${color #00ffff}${membar 6}
${color #ffffff}真元 (CPU): ${color #00ffff}${cpu}% 
${color #00ffff}${cpubar 6}

${color #00ffff}${font Ubuntu:style=Bold:size=12}⚡ 劍訣運行 (進程)${font}
${color #ffffff}${top name 1}${alignr}${color #00ffff}${top cpu 1}%
${color #ffffff}${top name 2}${alignr}${color #00ffff}${top cpu 2}%
${color #ffffff}${top name 3}${alignr}${color #00ffff}${top cpu 3}%
${color #ffffff}${top name 4}${alignr}${color #00ffff}${top cpu 4}%
${color #ffffff}${top name 5}${alignr}${color #00ffff}${top cpu 5}%

${color #00ffff}${font Ubuntu:style=Bold:size=12}🏔️ 仙界儲存${font}
${color #ffffff}根目錄: ${color #00ffff}${fs_used /} / ${fs_size /}
${color #00ffff}${fs_bar 6 /}
${color #ffffff}可用空間: ${color #00ffff}${fs_free /}

${color #00ffff}${font Ubuntu:style=Bold:size=12}🌐 九天網絡${font}
${color #ffffff}上傳: ${color #00ffff}${upspeed eth0} kb/s
${color #ffffff}下載: ${color #00ffff}${downspeed eth0} kb/s
${color #ffffff}總上傳: ${color #00ffff}${totalup eth0}
${color #ffffff}總下載: ${color #00ffff}${totaldown eth0}

${color #00ffff}${font Ubuntu:style=Bold:size=12}🎯 當前時辰${font}
${color #ffffff}${font Ubuntu:style=Bold:size=14}${time %H:%M:%S}
${color #00ffff}${time %A, %d %B %Y}

${color #00ffff}${hr 2}
${color #ffffff}${font Ubuntu:style=Bold:size=10}「劍指蒼穹，星辰為伴」${font}
]]
EOF

    # Auto-start conky
    if ! grep -q "conky" ~/.bashrc; then
        echo "# Auto-start conky" >> ~/.bashrc
        echo "conky -c ~/.config/conky/conky.conf &" >> ~/.bashrc
    fi
    
    print_success "Conky 設置完成"
}

# Setup wallpaper
setup_wallpaper() {
    print_step "設置動態桌布與應用程式啟動器..."
    
    # Save the updated HTML wallpaper with app launcher
    cat > ~/.local/share/backgrounds/tulen_wallpaper.html << 'EOF'
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tulen Chí Tôn Kiếm Tiên - Desktop Launcher</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #0a0a0a 0%, #1a1a2e 30%, #16213e 60%, #0f3460 100%);
            overflow: hidden;
            font-family: 'serif';
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
        
        .stars {
            position: absolute;
            width: 100%;
            height: 100%;
            background: transparent;
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
        
        .spirit-orb {
            position: absolute;
            width: 80px;
            height: 80px;
            border-radius: 50%;
            cursor: pointer;
            z-index: 15;
            transition: all 0.3s ease;
            animation: orb-float 6s ease-in-out infinite;
            box-shadow: 0 0 30px rgba(0, 255, 255, 0.8);
        }
        
        .spirit-orb:hover {
            transform: scale(1.2);
            box-shadow: 0 0 50px rgba(0, 255, 255, 1);
        }
        
        .spirit-orb.orb1 {
            top: 20%;
            left: 20%;
            background: radial-gradient(circle, #00ffff 0%, #4da6ff 50%, #0066cc 100%);
            animation-delay: 0s;
        }
        
        .spirit-orb.orb2 {
            top: 20%;
            right: 20%;
            background: radial-gradient(circle, #66ffff 0%, #00cccc 50%, #004d4d 100%);
            animation-delay: 1.5s;
        }
        
        .spirit-orb.orb3 {
            bottom: 20%;
            left: 20%;
            background: radial-gradient(circle, #80ffff 0%, #33cccc 50%, #006666 100%);
            animation-delay: 3s;
        }
        
        .spirit-orb.orb4 {
            bottom: 20%;
            right: 20%;
            background: radial-gradient(circle, #ccffff 0%, #66cccc 50%, #336666 100%);
            animation-delay: 4.5s;
        }
        
        .connection-line {
            position: absolute;
            height: 2px;
            background: linear-gradient(90deg, transparent, rgba(0, 255, 255, 0.6), transparent);
            animation: line-pulse 3s ease-in-out infinite;
            z-index: 2;
        }
        
        .line1 {
            top: 25%;
            left: 20%;
            width: 60%;
            transform: rotate(0deg);
            animation-delay: 0s;
        }
        
        .line2 {
            top: 25%;
            right: 20%;
            width: 60%;
            height: 2px;
            transform: rotate(90deg);
            transform-origin: right center;
            animation-delay: 1s;
        }
        
        .app-launcher {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(0);
            width: 400px;
            height: 300px;
            background: linear-gradient(135deg, rgba(0, 0, 0, 0.9), rgba(26, 26, 46, 0.9));
            border-radius: 20px;
            border: 2px solid rgba(0, 255, 255, 0.5);
            box-shadow: 0 0 50px rgba(0, 255, 255, 0.5);
            z-index: 100;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }
        
        .app-launcher.show {
            transform: translate(-50%, -50%) scale(1);
        }
        
        .chinese-title {
            position: absolute;
            top: 8%;
            left: 50%;
            transform: translateX(-50%);
            font-size: 48px;
            color: #00ffff;
            font-weight: bold;
            text-shadow: 0 0 30px rgba(0, 255, 255, 1);
            animation: title-glow 4s ease-in-out infinite;
        }
        
        @keyframes twinkle {
            0%, 100% { opacity: 0.3; transform: scale(1); }
            50% { opacity: 1; transform: scale(1.5); }
        }
        
        @keyframes orb-float {
            0%, 100% { 
                transform: translateY(0px); 
                box-shadow: 0 0 30px rgba(0, 255, 255, 0.8);
            }
            50% { 
                transform: translateY(-10px); 
                box-shadow: 0 0 40px rgba(0, 255, 255, 1);
            }
        }
        
        @keyframes line-pulse {
            0%, 100% { opacity: 0.4; }
            50% { opacity: 1; }
        }
        
        @keyframes title-glow {
            0%, 100% { 
                text-shadow: 0 0 30px rgba(0, 255, 255, 1);
                color: #00ffff;
            }
            50% { 
                text-shadow: 0 0 50px rgba(0, 255, 255, 1), 0 0 80px rgba(255, 255, 255, 0.8);
                color: #ffffff;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="stars" id="starField"></div>
        
        <div class="connection-line line1"></div>
        <div class="connection-line line2"></div>
        
        <div class="spirit-orb orb1" onclick="openLauncher('system')" title="系統工具">
            <div class="orb-label">系統</div>
        </div>
        <div class="spirit-orb orb2" onclick="openLauncher('internet')" title="網絡應用">
            <div class="orb-label">網絡</div>
        </div>
        <div class="spirit-orb orb3" onclick="openLauncher('media')" title="媒體娛樂">
            <div class="orb-label">媒體</div>
        </div>
        <div class="spirit-orb orb4" onclick="openLauncher('development')" title="開發工具">
            <div class="orb-label">開發</div>
        </div>
        
        <div class="chinese-title">至尊劍仙</div>
    </div>
    
    <script>
        function createStars() {
            const starField = document.getElementById('starField');
            const starCount = 200;
            
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
                
                starField.appendChild(star);
            }
        }
        
        function openLauncher(category) {
            // Simple launcher - in real desktop environment, this would open applications
            const apps = {
                system: ['Terminal', 'File Manager', 'System Settings', 'Task Manager'],
                internet: ['Firefox', 'Thunderbird', 'Discord', 'Steam'],
                media: ['VLC', 'GIMP', 'Audacity', 'Blender'],
                development: ['VS Code', 'Git', 'Docker', 'Python']
            };
            
            const appList = apps[category].join('\n• ');
            alert(`${category.toUpperCase()} 應用程式:\n\n• ${appList}\n\n在真實桌面環境中，這些應用程式將被啟動。`);
        }
        
        document.addEventListener('DOMContentLoaded', createStars);
    </script>
</body>
</html>
EOF

    # Create a proper desktop launcher script
    cat > ~/.local/bin/tulen-launcher << 'EOF'
#!/bin/bash

# Tulen Desktop Launcher Script
# This script provides a proper app launcher for desktop environment

case "$1" in
    "system")
        echo "系統工具選單:"
        echo "1. 終端機 (Terminal)"
        echo "2. 檔案管理員 (File Manager)"
        echo "3. 系統設定 (Settings)"
        echo "4. 系統監視器 (System Monitor)"
        echo "5. 調整工具 (Tweaks)"
        
        read -p "選擇 (1-5): " choice
        case $choice in
            1) gnome-terminal & ;;
            2) nautilus & ;;
            3) gnome-control-center & ;;
            4) gnome-system-monitor & ;;
            5) gnome-tweaks & ;;
        esac
        ;;
    "internet")
        echo "網絡應用選單:"
        echo "1. Firefox 瀏覽器"
        echo "2. Thunderbird 郵件"
        echo "3. Steam 遊戲"
        
        read -p "選擇 (1-3): " choice
        case $choice in
            1) firefox & ;;
            2) thunderbird & ;;
            3) steam & ;;
        esac
        ;;
    "media")
        echo "媒體娛樂選單:"
        echo "1. VLC 媒體播放器"
        echo "2. GIMP 影像編輯"
        echo "3. Audacity 音訊編輯"
        
        read -p "選擇 (1-3): " choice
        case $choice in
            1) vlc & ;;
            2) gimp & ;;
            3) audacity & ;;
        esac
        ;;
    "development")
        echo "開發工具選單:"
        echo "1. Visual Studio Code"
        echo "2. Git GUI"
        echo "3. Python IDLE"
        
        read -p "選擇 (1-3): " choice
        case $choice in
            1) code & ;;
            2) git-gui & ;;
            3) python3 -m idlelib & ;;
        esac
        ;;
    *)
        echo "使用方法: $0 {system|internet|media|development}"
        exit 1
        ;;
esac
EOF

    chmod +x ~/.local/bin/tulen-launcher
    
    # Add to PATH if not already there
    if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    fi
    
    print_success "動態桌布與應用程式啟動器設置完成"
}

# Configure terminal
configure_terminal() {
    print_step "配置終端..."
    
    # Create terminal profile (simplified version)
    cat >> ~/.bashrc << 'EOF'

# Tulen Kiếm Tiên Terminal
export PS1='\[\033[1;36m\]⚔️ \[\033[1;37m\]劍仙\[\033[0;36m\]@\[\033[1;37m\]九天\[\033[0m\] \[\033[1;36m\][\[\033[0;37m\]\w\[\033[1;36m\]]\[\033[0m\] \[\033[1;36m\]➤\[\033[0m\] '

# Aliases
alias 系統='neofetch'
alias 清理='clear'
alias 查看='ls -la --color=auto'

# Colors
export LS_COLORS='di=1;36:fi=0;37:ln=1;35:ex=1;32'

# Welcome message
if [[ $- == *i* ]]; then
    echo -e "\033[1;36m    ⚔️  至尊劍仙終端  ⚔️\033[0m"
    echo -e "\033[0;37m  「劍指蒼穹，星辰為伴」\033[0m"
    echo
fi
EOF

    print_success "終端配置完成"
}

# Configure gnome settings
configure_gnome() {
    print_step "配置 Gnome 設置..."
    
    # Set theme
    gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Dark"
    gsettings set org.gnome.desktop.interface icon-theme "Tela-circle-dark"
    gsettings set org.gnome.desktop.interface cursor-theme "Adwaita"
    
    # Set font
    gsettings set org.gnome.desktop.interface font-name "Source Han Sans CN 11"
    gsettings set org.gnome.desktop.interface monospace-font-name "Ubuntu Mono 12"
    
    # Set dark mode
    gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
    
    # Configure dash to dock (if available)
    if gsettings list-schemas | grep -q "org.gnome.shell.extensions.dash-to-dock"; then
        gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "BOTTOM"
        gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode "FIXED"
        gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.3
        gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 48
    fi
    
    print_success "Gnome 設置完成"
}

# Final setup
final_setup() {
    print_step "最終設置..."
    
    # Create desktop entry for wallpaper
    cat > ~/.local/share/applications/tulen-wallpaper.desktop << 'EOF'
[Desktop Entry]
Name=Tulen Wallpaper
Comment=Tulen Kiếm Tiên Animated Wallpaper
Exec=firefox ~/.local/share/backgrounds/tulen_wallpaper.html
Icon=firefox
Terminal=false
Type=Application
Categories=Graphics;
EOF

    # Make scripts executable
    chmod +x ~/.local/share/applications/tulen-wallpaper.desktop
    
    # Update desktop database
    update-desktop-database ~/.local/share/applications/ 2>/dev/null || true
    
    print_success "最終設置完成"
}

# Main installation function
main() {
    print_header
    
    # Check if not root
    check_root
    
    # Install components
    update_system
    install_base_packages
    install_themes
    install_fonts
    setup_conky
    setup_wallpaper
    configure_terminal
    configure_gnome
    final_setup
    
    # Final message
    echo
    echo -e "${CYAN}===============================================${NC}"
    echo -e "${WHITE}🎉 Tulen Chí Tôn Kiếm Tiên Desktop Rice 完成!${NC}"
    echo -e "${CYAN}===============================================${NC}"
    echo
    echo -e "${GREEN}✅ 已完成以下設置:${NC}"
    echo -e "   • 主題和圖標"
    echo -e "   • 中文字體"
    echo -e "   • Conky 系統監控"
    echo -e "   • 動態桌布"
    echo -e "   • 終端美化"
    echo -e "   • Gnome 配置"
    echo
    echo -e "${YELLOW}📝 下一步操作:${NC}"
    echo -e "   1. 重新啟動系統: ${CYAN}sudo reboot${NC}"
    echo -e "   2. 打開 Firefox 並訪問: ${CYAN}https://extensions.gnome.org${NC}"
    echo -e "   3. 安裝推薦的 Gnome Extensions:"
    echo -e "      • Dash to Dock"
    echo -e "      • User Themes"
    echo -e "      • Blur my Shell"
    echo -e "      • Desktop Cube"
    echo -e "   4. 打開 ${CYAN}gnome-tweaks${NC} 進行最終調整"
    echo -e "   5. 使用 ${CYAN}系統${NC} 命令查看系統信息"
    echo
    echo -e "${CYAN}🎮 享受你的 Tulen 劍仙桌面! 劍指蒼穹，星辰為伴! ⚔️${NC}"
    echo
}

# Check if script is being sourced or executed
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
