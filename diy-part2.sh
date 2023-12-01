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

# 修改默认IP为 10.0.0.2
#sed -i 's/192.168.1.1/10.0.0.2/g' package/base-files/files/bin/config_generate
 
# 修改默认主机名
#sed -i '/uci commit system/iuci set system.@system[0].hostname='Soft_Router'' package/lean/default-settings/files/zzz-default-settings
 
# 加入编译者信息
#sed -i 's/OpenWrt /Kinoko build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g' package/lean/default-settings/files/zzz-default-settings

rm -rf package/feeds/luci/luci-app-aliyundrive-webdav
rm -rf package/feeds/packages/aliyundrive-webdav
rm -rf package/feeds/luci/luci-app-aliyundrive-fuse
rm -rf package/feeds/packages/aliyundrive-fuse
git clone https://github.com/messense/aliyundrive-webdav aliyundrive && mv -n aliyundrive/openwrt/* ./package/ ; rm -rf aliyundrive
#svn export https://github.com/kenzok8/openwrt-packages/trunk/aliyundrive-webdav package/aliyundrive-webdav
#svn export https://github.com/kenzok8/openwrt-packages/trunk/luci-app-aliyundrive-webdav package/luci-app-aliyundrive-webdav
git clone https://github.com/messense/aliyundrive-fuse aliyundrive && mv -n aliyundrive/openwrt/* ./package/;rm -rf aliyundrive
#git_clone https://github.com/zzsj0928/luci-app-pushbot

rm -rf package/feeds/luci/luci-app-qbittorrent
rm -rf package/feeds/packages/qbittorrent
svn export https://github.com/immortalwrt/luci/branches/openwrt-18.06-k5.4/applications/luci-app-qbittorrent  package/luci-app-qbittorrent
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/qBittorrent-Enhanced-Edition package/qBittorrent-Enhanced-Edition
#svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-qbittorrent  package/luci-app-qbittorrent
#svn export https://github.com/kiddin9/openwrt-packages/trunk/qBittorrent-Enhanced-Edition package/qBittorrent-Enhanced-Edition

rm -rf package/feeds/packages/transmission
git clone https://github.com/transmission/transmission/ package/feeds/packages/transmission
./scripts/feeds install -p package/feeds/packages/transmission

# 修改默认主题
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' package/feeds/luci/luci/Makefile

# 切换传统交换机swconfig
#sed -i '132,153d' ./target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts
#sed -i '131a &ethernet {\n	compatible = "mediatek,ralink-mt7621-eth";\n	mediatek,switch = <&gsw>;\n};\n\n&gsw {\n	compatible = "mediatek,ralink-mt7621-gsw";' ./target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts
#sed -i '64a 	hiwifi,hc5962)\n		ucidef_add_switch "switch0" \\n			"1:lan" "2:lan" "3:lan" "4:wan" "6@eth0"\n		;;' ./target/linux/ramips/mt7621/base-files/etc/board.d/02_network
#sed -i '25d' ./target/linux/ramips/mt7621/base-files/etc/board.d/02_network
