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
sed -i '$a uci set network.wwan=interface' package/base-files/files/bin/config_generate
sed -i '$a uci set network.wwan.ifname=eth2' package/base-files/files/bin/config_generate
sed -i '$a uci set network.wwan.proto=dhcp' package/base-files/files/bin/config_generate
sed -i '$a uci set network.wwan.up=1' package/base-files/files/bin/config_generate
echo "uci set glfan.@globals[0].temperature='30'" >> package/base-files/files/bin/config_generate
sed -i "19a \ \ \ \ \ \ \ \ list   network          'wwan' " package/network/config/firewall/files/firewall.config

# 设定内网默认ip为192.168.8.1
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

# 设定主题luci-theme-argon
echo "uci set luci.main.mediaurlbase='/luci-static/argon'" >> package/base-files/files/bin/config_generate

# 默认开启2.4G Wifi、设定Wi-Fi名为GL-AXT1800、区域设为美国、WiFi密码为password、带宽40Mhz、频道自动、功率30dB
echo "uci set wireless.radio1.disabled=0" >> package/base-files/files/bin/config_generate
echo "uci set wireless.default_radio1.ssid='GL-AXT1800'" >> package/base-files/files/bin/config_generate
echo "uci set wireless.radio1.country='US'" >> package/base-files/files/bin/config_generate
echo "uci set wireless.default_radio1.encryption='psk2'" >> package/base-files/files/bin/config_generate
echo "uci set wireless.default_radio1.key='password'" >> package/base-files/files/bin/config_generate
echo "uci set wireless.radio1.htmode='HE40'" >> package/base-files/files/bin/config_generate
echo "uci set wireless.radio1.channel='auto'" >> package/base-files/files/bin/config_generate
echo "uci set wireless.radio1.txpower='30'" >> package/base-files/files/bin/config_generate

# 默认开启5G Wifi、设定Wi-Fi名为GL-AXT1800-5G、区域设为美国、WiFi密码为password、频道自动、功率30dB
echo "uci set wireless.radio0.disabled=0" >> package/base-files/files/bin/config_generate
echo "uci set wireless.default_radio0.ssid='GL-AXT1800-5G'" >> package/base-files/files/bin/config_generate
echo "uci set wireless.radio0.country='US'" >> package/base-files/files/bin/config_generate
echo "uci set wireless.default_radio0.encryption='psk2'" >> package/base-files/files/bin/config_generate
echo "uci set wireless.default_radio0.key='password'" >> package/base-files/files/bin/config_generate
echo "uci set wireless.radio0.channel='auto'" >> package/base-files/files/bin/config_generate
echo "uci set wireless.radio0.txpower='30'" >> package/base-files/files/bin/config_generate

# 修改主机名
echo "uci set system.cfg01e48a.hostname='axt1800'" >> package/base-files/files/bin/config_generate
sed -i 's/OpenWrt/AXT1800/' package/base-files/files/bin/config_generate
sed -i '/DISTRIB_REVISION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_REVISION='GL.iNet AXT1800'" >> package/base-files/files/etc/openwrt_release
sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_DESCRIPTION='OpenWrt R22.7.1 '" >> package/base-files/files/etc/openwrt_release

# 补充配置文件最后一行结束语
sed -i '$a uci commit' package/base-files/files/bin/config_generate

# 设定root密码为password
sed -i '1d' package/base-files/files/etc/shadow
sed -i '1i root:$1$H\/ab6bvd$yWkIzUrKuLPTNHY9akBDC0:18988:0:99999:7:::'  package/base-files/files/etc/shadow
