#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

git clone https://github.com/vernesong/OpenClash.git $GITHUB_WORKSPACE/OpenClash
cp -r $GITHUB_WORKSPACE/OpenClash/luci-app-openclash $GITHUB_WORKSPACE/gl-infra-builder/feeds/glinet/luci-app-openclash

git clone https://github.com/jerrykuku/luci-theme-argon.git $GITHUB_WORKSPACE/gl-infra-builder/feeds/glinet/luci-theme-argon

svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-ramfree $GITHUB_WORKSPACE/gl-infra-builder/feeds/glinet/luci-app-ramfree
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-zerotier $GITHUB_WORKSPACE/gl-infra-builder/feeds/glinet/luci-app-zerotier
svn co https://github.com/coolsnowwolf/packages/trunk/net/zerotier $GITHUB_WORKSPACE/gl-infra-builder/feeds/glinet/zerotier

# pushd wlan-ap/openwrt
 
# popd
