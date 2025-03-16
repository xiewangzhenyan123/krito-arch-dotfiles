#!/bin/bash
source .zshrc
# 获取可用的 Wi-Fi 网络列表
wifi_list=$(nmcli --fields "SSID" device wifi list | sed -n '1!p' | awk 'NF')

# 使用 rofi 选择 Wi-Fi 网络
selected_wifi=$(echo "$wifi_list" | rofi -dmenu -i -p "Select Wi-Fi" -lines 10 -width 50)

# 如果用户选择了网络
if [ -n "$selected_wifi" ]; then
    # 提示用户输入密码
    wifi_password=$(rofi -dmenu -p "Enter password for $selected_wifi" -password)

    # 连接选定的 Wi-Fi 网络
    if [ -n "$wifi_password" ]; then
        nmcli device wifi connect "$selected_wifi" password "$wifi_password"
    else
        nmcli device wifi connect "$selected_wifi"
    fi
fi