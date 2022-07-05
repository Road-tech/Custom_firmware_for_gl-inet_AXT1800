#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 添加WWAN接口以及防火墙
sed -i '$d' package/base-files/files/bin/config_generate
sed -i '$a uci set network.wwan=interface' package/base-files/files/bin/config_generate
sed -i '$a uci set network.wwan.ifname=eth2' package/base-files/files/bin/config_generate
sed -i '$a uci set network.wwan.proto=dhcp' package/base-files/files/bin/config_generate
sed -i '$a uci set network.wwan.up=1' package/base-files/files/bin/config_generate
sed -i '$a uci commit' package/base-files/files/bin/config_generate
sed -i "19a \ \ \ \ \ \ \ \ list   network          'wwan' " package/network/config/firewall/files/firewall.config

# 设定内网默认ip为192.168.8.1
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

# 默认开启Wifi、设定Wi-Fi名为Road-MagicBox
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/OpenWrt/Road-MagicBox/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 设定主题luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改主机名
sed -i 's/OpenWrt/MagicBox/g' package/base-files/files/bin/config_generate

# 设定root密码为password
sed -i '1d' package/base-files/files/etc/shadow
sed -i '1i root:$1$H\/ab6bvd$yWkIzUrKuLPTNHY9akBDC0:18988:0:99999:7:::'  package/base-files/files/etc/shadow
