# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

git clone https://github.com/sirpdboy/luci-app-autotimeset package/luci-app-autotimeset
git clone https://github.com/sirpdboy/luci-app-eqosplus package/luci-app-eqosplus
git clone https://github.com/sirpdboy/luci-app-parentcontrol package/luci-app-parentcontrol
svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-cpulimit package/luci-app-cpulimit #版本更新
svn export https://github.com/sirpdboy/sirpdboy-package/trunk/cpulimit package/cpulimit
#svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-timewol package/luci-app-control-timewol #2.2-20200927
svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-watchcat-plus package/luci-app-watchcat-plus

svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-control-timewol package/luci-app-control-timewol #1.0-3-20220406

#svn export https://github.com/immortalwrt/luci/trunk/openwrt-18.06/applications/luci-app-cpulimit package/luci-app-cpulimit #版本旧
#svn export https://github.com/immortalwrt/luci/trunk/openwrt-18.06/applications/luci-app-timewol package/luci-app-timewol #1.0-3-20190309

svn export https://github.com/openwrt/luci/trunk/applications/luci-app-ser2net package/luci-app-ser2net
sed -i 's/include ..\/..\/luci.mk/include $(TOPDIR)\/feeds\/luci\/luci.mk/g' package/luci-app-ser2net/Makefile

sed -i '11~16d' packages/net/transmission/Makefile
sed -i '10a PKG_VERSION:=4.0.4\
>PKG_RELEASE:=1\
>\
>PKG_SOURCE:=\$(PKG_NAME)-\$(PKG_VERSION).tar.xz\
>PKG_SOURCE_URL:=https:\/\/github.com\/transmission\/transmission\/releases\/download\/\$(PKG_VERSION)\/\
>PKG_HASH:=15f7b4318fdfbffb19aa8d9a6b0fd89348e6ef1e86baa21a0806ffd1893bd5a6' packages/net/transmission/Makefile

#git_clone https://github.com/zzsj0928/luci-app-pushbot

cat feeds.conf.default
