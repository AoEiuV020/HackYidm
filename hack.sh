#!/bin/sh

# 默认下载的wpub格式小说居然没有登录验证，  
# 绕开本地验证就能用了，良心大大的，
# 搜索“版权受限”找到相关判断，写死通过，

name=yidm_3.1.9
rm -rf $name
apktool -r -s d $name.apk
sed -i 's/this.checkIsLimit()/false/g' $name/assets/index.android.bundle
# 另有一处没调用方法，直接判断的，也要改，
sed -i 's/return!o&&d>0?i.default.createElement/return false?i.default.createElement/' $name/assets/index.android.bundle
apktool b $name
ls $name/dist/$name.apk
