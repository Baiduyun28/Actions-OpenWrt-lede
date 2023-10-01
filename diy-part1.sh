# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

echo 'src-git luci-app-autotimeset  https://github.com/sirpdboy/luci-app-autotimeset' >>feeds.conf.default
echo 'src-git luci-app-ddns-go  https://github.com/sirpdboy/luci-app-ddns-go' >>feeds.conf.default
echo 'src-git luci-app-eqosplus  https://github.com/sirpdboy/luci-app-eqosplus' >>feeds.conf.default
echo 'src-git luci-app-parentcontrol  https://github.com/sirpdboy/luci-app-parentcontrol' >>feeds.conf.default
svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-cpulimit package/luci-app-cpulimit
svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-timewol package/luci-app-control-timewol
svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-watchcat-plus package/luci-app-watchcat-plus

echo 'src-git go-aliyundrive-webdav  https://github.com/jerrykuku/luci-app-go-aliyundrive-webdav' >>feeds.conf.default

svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-control-timewol package/luci-app-control-timewol
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-control-webrestriction package/luci-app-control-webrestriction
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-control-weburl package/luci-app-control-weburl
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-timecontrol package/luci-app-timecontrol

svn export https://github.com/immortalwrt/luci/trunk/openwrt-18.06/applications/luci-app-cpulimit package/luci-app-cpulimit
svn export https://github.com/immortalwrt/luci/trunk/openwrt-18.06/applications/luci-app-timecontrol package/luci-app-timecontrol
svn export https://github.com/immortalwrt/luci/trunk/openwrt-18.06/applications/luci-app-timewol package/luci-app-timewol

#git_clone https://github.com/messense/aliyundrive-webdav aliyundrive && mv -n aliyundrive/openwrt/* ./ ; rm -rf aliyundrive
#git_clone https://github.com/messense/aliyundrive-fuse aliyundrive && mv -n aliyundrive/openwrt/* ./;rm -rf aliyundrive
#git_clone https://github.com/zzsj0928/luci-app-pushbot

# 修改默认主题
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
sed -i "s/luci-theme-bootstrap/luci-theme-argon/g" feeds/luci/collections/luci/Makefile

# 切换传统交换机swconfig
sed -i '132,153d' ./target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts
sed -i '131a &ethernet {\n	compatible = "mediatek,ralink-mt7621-eth";\n	mediatek,switch = <&gsw>;\n};\n\n&gsw {\n	compatible = "mediatek,ralink-mt7621-gsw";' ./target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts
sed -i '64a 	hiwifi,hc5962)\n		ucidef_add_switch "switch0" \\n			"1:lan" "2:lan" "3:lan" "4:wan" "6@eth0"\n		;;' ./target/linux/ramips/mt7621/base-files/etc/board.d/02_network
sed -i '25d' ./target/linux/ramips/mt7621/base-files/etc/board.d/02_network
