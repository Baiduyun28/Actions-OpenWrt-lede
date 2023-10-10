# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

#echo 'src-git autotimeset https://github.com/sirpdboy/luci-app-autotimeset' >>feeds.conf.default
git clone https://github.com/sirpdboy/luci-app-autotimeset package/luci-app-autotimeset
#echo 'src-git eqosplus https://github.com/sirpdboy/luci-app-eqosplus' >>feeds.conf.default
git clone https://github.com/sirpdboy/luci-app-eqosplus package/luci-app-eqosplus
#echo 'src-git parentcontrol https://github.com/sirpdboy/luci-app-parentcontrol' >>feeds.conf.default
git clone https://github.com/sirpdboy/luci-app-parentcontrol package/luci-app-parentcontrol
svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-cpulimit package/luci-app-cpulimit #版本更新
svn export https://github.com/sirpdboy/sirpdboy-package/trunk/cpulimit package/cpulimit
#svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-timewol package/luci-app-control-timewol #2.2-20200927
#svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-watchcat-plus package/luci-app-watchcat-plus

svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-control-timewol package/luci-app-control-timewol #1.0-3-20220406
#svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-control-webrestriction package/luci-app-control-webrestriction
#svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-control-weburl package/luci-app-control-weburl
#svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-timecontrol package/luci-app-timecontrol #1.1-20220505

#svn export https://github.com/immortalwrt/luci/trunk/openwrt-18.06/applications/luci-app-cpulimit package/luci-app-cpulimit #版本旧
#svn export https://github.com/immortalwrt/luci/trunk/openwrt-18.06/applications/luci-app-timecontrol package/luci-app-timecontrol #1.0-1-20200402
#svn export https://github.com/immortalwrt/luci/trunk/openwrt-18.06/applications/luci-app-timewol package/luci-app-timewol #1.0-3-20190309

#git_clone https://github.com/zzsj0928/luci-app-pushbot

cat feeds.conf.default
