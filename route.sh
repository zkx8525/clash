#!/bin/bash

# 设置配置文件路径
config_file="/etc/XrayR/config.yml"

# 修改配置文件中的路径
sed -i 's|# /etc/XrayR/route.json|/etc/XrayR/route.json|g' "$config_file"
sed -i 's|# /etc/XrayR/custom_outbound.json|/etc/XrayR/custom_outbound.json|g' "$config_file"

# 下载新的route.json文件
curl -o /etc/XrayR/route.json https://raw.githubusercontent.com/zkx8525/clash/main/route.json

echo "配置文件已更新。"
XrayR restart
