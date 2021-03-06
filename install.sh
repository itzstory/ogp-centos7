#!/bin/bash
sudo yum -y install epel-release wget subversion git mariadb-server
service mariadb start
mysql_secure_installation
mysql -uroot -p$spass -e "CREATE DATABASE ogpstory; CREATE USER 'ogpstory'@localhost IDENTIFIED BY 'ogpstory22'; GRANT ALL PRIVILEGES ON ogpstory.* TO 'ogpstory'@localhost; use ogpstory;"

wget -N "https://github.com/OpenGamePanel/Easy-Installers/raw/master/Linux/CentOS/ogp_panel_rpm-1.0.0-1.noarch.rpm" -O "ogp_panel.rpm"
sudo yum -y install "ogp_panel.rpm"
sudo yum install php-mysql -y
sudo yum install php-mysqli -y
php -m | grep mysqli
service httpd restart

clear
echo "."
echo "."
echo "Completed"
echo "DB User: ogpstory"
echo "DB Name: ogpstory"
echo "DB Pass: ogpstory22"
echo "After installation, remove file install.php manually"
