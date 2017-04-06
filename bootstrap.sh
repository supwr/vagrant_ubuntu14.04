#!/usr/bin/env bash

apt-get update
sudo apt-get install -y apache2
if ! [ -L /var/www/html ]; then
  rm -rf /var/www/html
  ln -fs /vagrant/ /var/www/html
fi

sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
sudo apt-get install -y mysql-server


add-apt-repository -y ppa:ondrej/php
apt-get update
apt-get install -y php7.0
apt-get install -y php7.0-mysql

apt-get install -y libapache2-mod-php7.0 php7.0-mysql php7.0-curl php7.0-json php7.0-dom

sudo curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
sudo apt-get install -y git

sudo apt-get install -y libapache2-mod-php7.0

cd /etc/apache2/sites-available
sudo mv 000-default.conf default-bkp.conf

cat > /etc/apache2/sites-available/000-default.conf << "EOF"
<VirtualHost *:80>
    DocumentRoot /var/www/html
    <Directory /var/www/html>
       Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>  
</VirtualHost>
EOF

sudo a2enmod rewrite

sudo service apache2 restart
