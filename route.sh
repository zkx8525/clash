#!/bin/bash

# 检查是否有 root 权限
if [[ $EUID -ne 0 ]]; then
   echo "请使用 root 权限运行此脚本" 
   exit 1
fi

# 定义配置文件路径
config_file="/etc/XrayR/config.yml"
route_json_url="https://raw.githubusercontent.com/zkx8525/clash/main/route.json"
route_json_file="/etc/XrayR/route.json"

# 备份原始配置文件
cp "$config_file" "$config_file.backup"

# 修改配置文件
sed -i 's|#/etc/XrayR/route.json|/etc/XrayR/route.json|g' "$config_file"
sed -i 's|#/etc/XrayR/custom_outbound.json|/etc/XrayR/custom_outbound.json|g' "$config_file"

# 下载新的 route.json 文件
wget -O "$route_json_file" "$route_json_url"

# 重新运行 xrayr
systemctl restart xrayr

echo "配置文件已更新。原始配置文件备份为 $config_file.backup"
