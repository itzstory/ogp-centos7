#!/bin/bash
sudo yum -y install epel-release wget subversion git mariadb-server
service mariadb start
mysql_secure_installation
mysql -uroot -p$spass -e "CREATE DATABASE gcpstory; CREATE USER 'gcpstory'@localhost IDENTIFIED BY 'gcpstory22'; GRANT ALL PRIVILEGES ON gcpstory.* TO 'gcpstory'@localhost; use gcpstory;"

wget -N "https://github.com/OpenGamePanel/Easy-Installers/raw/master/Linux/CentOS/ogp_panel_rpm-1.0.0-1.noarch.rpm" -O "ogp_panel.rpm"
sudo yum -y install "ogp_panel.rpm"
sudo yum install php-mysql -y
sudo yum install php-mysqli -y

service httpd restart
service php-fpm restart
service php-mysqli restart

clear

echo "."
echo "."
echo "Completed"
echo "DB User: gcpstory"
echo "DB Name: gcpstory"
echo "DB Pass: gcpstory22"
echo "Now use command:  shutdown -r now  to take effect."
echo "After installation, remove file install.php manually"
