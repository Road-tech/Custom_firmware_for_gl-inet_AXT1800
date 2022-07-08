Gl-inet AXT1800 固件
固件仍在调试中，请勿使用！！！！

## 固件相关

编译配置文件参考了[JiaY-shi](https://github.com/JiaY-shi)的[build-gl.inet](https://github.com/JiaY-shi/build-gl.inet)，以及[monw](https://github.com/monw)的[gl-infra-builder](https://github.com/monw/gl-infra-builder)

此固件基于[gl-inet](https://github.com/gl-inet)的官方开源仓库[gl-infra-builder](https://github.com/gl-inet/gl-infra-builder)，属openwrt 21.02，5.4内核。

默认集成LTE所需的kmod-usb-net、kmod-usb-net-rndis、usb-modeswitch驱动，默认添加WWAN网卡和防火墙，默认开启WIFI，开箱即用，无需手动配置。

默认集成mwan并配置好，会自动判断网络接口的状态并按优先级去选择，优先级为 有线 > 4G卡， 即同时只插网线或者4G卡时，会自动选择网线或者4G卡。同时插入网线和4G卡，会优先选择有线网络。当有线网络出现问题时，会自动切换到4G卡。当有线网络恢复，切换回有线网络，以此类推。

如果需要定制，可以自行fork修改，都有详细备注。

## Openwrt配置相关

- 默认管理页面: 192.168.8.1

- 默认密码: password

- 默认SSID：GL-AXT1800 / GL-AXT1800-5G

- LTE/4G 接口自动设置

- 默认使用argon主题

- 集成Passwall、Openclash、adguardhome、advanced（高级设置）、aliddns、aria2、ddns、frpc、frps、tinyproxy、ttyd、uhttpd、watchcat、wireguard、wol等常用工具

## 关于自动编译脚本

自动编译脚本源自[P3TERX](https://github.com/P3TERX)/[Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)

脚本使用说明：[English](https://github.com/P3TERX/Actions-OpenWrt) | [中文](https://p3terx.com/archives/build-openwrt-with-github-actions.html)
