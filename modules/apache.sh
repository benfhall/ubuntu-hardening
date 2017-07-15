#!/bin/bash
function apachef()
{
	if echo "$apacheq" | grep -iq "^y" ;then
		clear
    
    sudo a2enmod rewrite

    sudo echo "ServerTokens Prod" >> /etc/apache2/apache2.conf
    sudo echo "ServerSignature Off" >> /etc/apache2/apache2.conf
    sudo echo "TraceEnable off" >> /etc/apache2/apache2.conf
    sudo echo "FileETag None" >> /etc/apache2/apache2.conf
    sudo echo "Timeout 60" >> /etc/apache2/apache2.conf

    sudo groupadd apache
    sudo useradd -G apache apache
    sudo chown -R apache:apache /opt/apache
    sudo sed -i 's/User ${APACHE_RUN_USER}/User apache/g' /etc/apache2/apache2.conf
    sudo sed -i 's/Group ${APACHE_RUN_GROUP}/Group apache/g' /etc/apache2/apache2.conf

    sudo sed -i 's/Options Indexes/Options/g' /etc/apache2/apache2.conf
    sudo sed -i 's/Options Includes/Options/g' /etc/apache2/apache2.conf
    sudo sed -i 's/AllowOverride All/AllowOverride None/g' /etc/apache2/apache2.conf
    sudo sed -i 's/<Directory /var/www/>/
      <Directory /var/www/>
        <LimitExcept GET POST HEAD>
          deny from all
        </LimitExcept>
    /g' /etc/apache2/apache2.conf
    sudo sed -i 's/<Directory /var/www/>/<Directory /var/www/> Header edit Set-Cookie ^(.*)$ $1;HttpOnly;Secure/g' /etc/apache2/apache2.conf
    sudo sed -i 's/<Directory /var/www/>/<Directory /var/www/>  Header always append X-Frame-Options SAMEORIGIN/g' /etc/apache2/apache2.conf
    sudo sed -i 's/<Directory /var/www/>/<Directory /var/www/>  Header set X-XSS-Protection “1; mode=block”/g' /etc/apache2/apache2.conf
    sudo sed -i 's/<Directory /var/www/>/<Directory /var/www/>
      RewriteEngine On
      RewriteCond %{THE_REQUEST} !HTTP/1.1$
      RewriteRule .* - [F]
    /g' /etc/apache2/apache2.conf
    chmod -R 750

    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.key -out localhost.crt
    openssl req -out localhost.csr -new -newkey rsa:2048 -nodes -keyout localhost.key

    sudo service apache2 restart
    echo "apache security hardened"
	else
		clear

		echo "apache security not hardened!"
	fi
}
