# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# 添加 OpenAppFilter 应用过滤插件
#git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilter

# 修改默认主题
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
sed -i "s/luci-theme-bootstrap/luci-theme-argon/g" feeds/luci/collections/luci/Makefile

# 切换传统交换机swconfig
sed -i '132,153d' ./target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts
sed -i '131a &ethernet {\n	compatible = "mediatek,ralink-mt7621-eth";\n	mediatek,switch = <&gsw>;\n};\n\n&gsw {\n	compatible = "mediatek,ralink-mt7621-gsw";' ./target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts
sed -i '64a 	hiwifi,hc5962)\n		ucidef_add_switch "switch0" \\n			"1:lan" "2:lan" "3:lan" "4:wan" "6@eth0"\n		;;' ./target/linux/ramips/mt7621/base-files/etc/board.d/02_network
sed -i '25d' ./target/linux/ramips/mt7621/base-files/etc/board.d/02_network
