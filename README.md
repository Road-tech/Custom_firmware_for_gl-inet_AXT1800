Gl-inet AXT1800 固件

固件自动拉取编译，如有bug劳烦报告下！

此固件未添加官方UI！

## 固件相关

编译配置文件参考了[JiaY-shi](https://github.com/JiaY-shi)的[build-gl.inet](https://github.com/JiaY-shi/build-gl.inet)，以及[monw](https://github.com/monw)的[gl-infra-builder](https://github.com/monw/gl-infra-builder)

此固件基于[gl-inet](https://github.com/gl-inet)的官方开源仓库[gl-infra-builder](https://github.com/gl-inet/gl-infra-builder)，属openwrt 21.02，5.4内核。

这个自动编译脚本的优势，相对别的而言，我是以官方的profiles追加自己的profiles的形式实现的，这样官方更新了profiles，加了什么应用我这边都能自动编译，不用修改。而有的大佬会把几个profiles整合成一个，这样官方更新了，还需要自己手动更新，就麻烦点了。当然利弊各位自己权衡。

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
