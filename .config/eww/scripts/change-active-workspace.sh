#!/bin/bash

# 获取滚动方向和工作区编号
scroll_direction=$1
current_workspace=$2

# 定义工作区总数（根据你的配置调整）
total_workspaces=10

# 根据滚动方向切换工作区
if [[ "$scroll_direction" == "up" ]]; then
    # 切换到上一个工作区
    new_workspace=$((current_workspace - 1))
    if [[ $new_workspace -lt 1 ]]; then
        new_workspace=$total_workspaces
    fi
elif [[ "$scroll_direction" == "down" ]]; then
    # 切换到下一个工作区
    new_workspace=$((current_workspace + 1))
    if [[ $new_workspace -gt $total_workspaces ]]; then
        new_workspace=1
    fi
else
    # 如果滚动方向无效，退出脚本
    exit 1
fi

# 使用 hyprctl 切换到新的工作区
hyprctl dispatch workspace "$new_workspace"