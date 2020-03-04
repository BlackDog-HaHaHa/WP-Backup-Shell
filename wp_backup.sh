#!/usr/bin/bash

date=`date "+%Y-%m-%d"`
wwwroot="wwwroot"
web="blog.blacklinux.cn"
web_sql="wordpress"
sql_user="root"
sql_passwd="123456"

# 创建备份文件夹
mkdir $date

# 网站文件打包
tar czvf ./$date/$web.tar.gz /$wwwroot/$web

# 数据库打包
mysqldump -u$sql_user -p$sql_passwd -B $web_sql > ./$date/$date.sql

# 配置文件打包
cp /etc/nginx/nginx.conf ./$date/
cp /etc/nginx/conf.d/$web.conf ./$date/
cp /etc/nginx/ssl/$web.* ./$date/
cp /etc/php-fpm.d/www.conf ./$date/
cp /root/.config/rclone/rclone.conf ./$date/

# 整合
tar czvf $web-$date.tar.gz ./$date
rm -rf $date