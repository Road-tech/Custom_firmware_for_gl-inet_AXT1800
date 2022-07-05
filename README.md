大R杂货 迷你4G无线路由 双频WiFi支持5G 随身便携 OpenWrt系统

MagicBox AC750 双频路由 QCA9531+9887

![](https://raw.githubusercontent.com/Road-tech/Road-blog-Figure/main/2021/12/29-11-14-55-IMG_2409.JPG)

## 硬件配置：

- 高通 QCA9531 550Mhz CPU + 9887 5G Wi-Fi 芯片

- 16M闪存 / 128M内存

- 433Mbps + 300Mbps 双频 Wi-Fi

- USB 扩展口（ LTE 版两个 / Wi-Fi 版一个）

- 两个百兆网口（默认 1WAN 1LAN）

- TF 卡槽（Wi-Fi 版无）

- LTE 版为 Type-C 供电 / Wi-Fi 版为 Micro USB 供电。

- 4G LTE 版为下图3D打印的黑色尼龙外壳 / Wi-Fi 版为上图亚克力外壳
  
  ![](https://raw.githubusercontent.com/Road-tech/Road-blog-Figure/main/2021/12/29-11-14-45-IMG_2410.JPG)

- ## 固件相关

此固件基于[coolsnowwolf](https://github.com/coolsnowwolf)的[lede稳定版](https://github.com/coolsnowwolf/openwrt)，属于openwrt 19.07，以纯净稳定为特色。

考虑到9531的性能和闪存大小，相较于[Openwrt](https://github.com/Road-tech/Openwrt-AC750-QCA9531-9887)版本集成更多应用，如果需要纯净版，可以[点击跳转](https://github.com/Road-tech/Openwrt-AC750-QCA9531-9887)。

不过依旧没有集成任何爬墙插件，闪存太小，性能太弱，感觉没什么可用的价值。

默认集成LTE所需的kmod-usb-net、kmod-usb-net-rndis、usb-modeswitch驱动，默认添加WWAN网卡和防火墙，默认开启WIFI，开箱即用，无需手动配置。

默认集成mwan并配置好，会自动判断网络接口的状态并按优先级去选择，优先级为 有线 > 4G卡， 即同时只插网线或者4G卡时，会自动选择网线或者4G卡。同时插入网线和4G卡，会优先选择有线网络。当有线网络出现问题时，会自动切换到4G卡。当有线网络恢复，切换回有线网络，以此类推。

如果需要定制，可以自行fork修改，都有详细备注。

## Openwrt配置相关

- 默认管理页面: 192.168.8.1

- 默认密码: password

- 默认SSID：Road-MagicBox

- LTE/4G 接口自动设置

## Openwrt 集成应用

自动编译脚本源自[P3TERX](https://github.com/P3TERX)/[Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)

脚本使用说明：[English](https://github.com/P3TERX/Actions-OpenWrt) | [中文](https://p3terx.com/archives/build-openwrt-with-github-actions.html)
