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

#删除配置文件最后一行结束语
sed -i '$d' package/base-files/files/bin/config_generate

# 添加WWAN接口以及防火墙
# sed -i '$a uci set network.wwan=interface' package/base-files/files/bin/config_generate
# sed -i '$a uci set network.wwan.ifname=eth2' package/base-files/files/bin/config_generate
# sed -i '$a uci set network.wwan.proto=dhcp' package/base-files/files/bin/config_generate
# sed -i '$a uci set network.wwan.up=1' package/base-files/files/bin/config_generate
# sed -i "19a \ \ \ \ \ \ \ \ list   network          'wwan' " package/network/config/firewall/files/firewall.config

# 设置风扇30度起转
echo "uci set glfan.@globals[0].temperature='30'" >> package/base-files/files/bin/config_generate
echo "uci set glfan.@globals[0].intergration='4'" >> package/base-files/files/bin/config_generate
echo "uci set glfan.@globals[0].differential='20'" >> package/base-files/files/bin/config_generate
echo "uci commit glfan" >> package/base-files/files/bin/config_generate

# 设定内网默认ip为192.168.8.1
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

# 修改主机名
sed -i 's/OpenWrt/GL-AXT1800/' package/base-files/files/bin/config_generate
sed -i '/DISTRIB_REVISION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_REVISION='GL.iNet AXT1800'" >> package/base-files/files/etc/openwrt_release
# sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
# echo "DISTRIB_DESCRIPTION='OpenWrt R22.7.1 '" >> package/base-files/files/etc/openwrt_release

# 补充配置文件最后一行结束语
sed -i '$a uci commit' package/base-files/files/bin/config_generate

# 设定主题luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon-2102/g' feeds/luci/collections/luci/Makefile
sed -i 's/CONFIG_PACKAGE_luci-theme-bootstrap=y/# CONFIG_PACKAGE_luci-theme-bootstrap is not set/g' .config

# 设定root密码为password
# sed -i '1d' package/base-files/files/etc/shadow
# sed -i '1i root:$1$H\/ab6bvd$yWkIzUrKuLPTNHY9akBDC0:18988:0:99999:7:::'  package/base-files/files/etc/shadow
