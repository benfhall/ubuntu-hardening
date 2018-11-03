function f_apache {
  echo "Configuring apache"

  sudo sed -i 's/.*FileETag.*//' /etc/apache2/apache2.conf
  sudo echo "FileETag None" >> /etc/apache2/apache2.conf
  sudo sed -i 's/.*RewriteEngine.*//' /etc/apache2/apache2.conf
  sudo echo "RewriteEngine On" >> /etc/apache2/apache2.conf
  sudo sed -i 's/.*RewriteCond.*//' /etc/apache2/apache2.conf
  sudo echo "RewriteCond %{THE_REQUEST} !HTTP/1\.1$" >> /etc/apache2/apache2.conf
  sudo sed -i 's/.*RewriteRule.*//' /etc/apache2/apache2.conf
  sudo echo "RewriteRule .* - F" >> /etc/apache2/apache2.conf
  sudo sed -i 's/.*TraceEnable.*//' /etc/apache2/apache2.conf
  sudo echo "TraceEnable off" >> /etc/apache2/apache2.conf
  sudo sed -i 's/.*Timeout.*//' /etc/apache2/apache2.conf
  sudo echo "Timeout 45" >> /etc/apache2/apache2.conf
  sudo sed -i 's/.*ServerSignature.*//' /etc/apache2/apache2.conf
  sudo echo "ServerSignature Off" >> /etc/apache2/apache2.conf
  sudo sed -i 's/.*ServerTokens.*//' /etc/apache2/apache2.conf
  sudo echo "Servertokens Prod" >> /etc/apache2/apache2.conf
  sudo sed -i "s/SSLProtocol all -SSLv3/SSLProtocol –ALL +TLSv1 +TLSv1.1 +TLSv1.2/" /etc/apache2/mods-available/ssl.conf
  sudo sed -i "s/SSLCipherSuite HIGH:\!aNULL/SSLCipherSuite HIGH:\!MEDIUM:\!aNULL:\!MD5:\!RC4/" /etc/apache2/mods-available/ssl.conf
  
  sudo echo "Header edit Set-Cookie ^(.*)\$ \$1;HttpOnly;Secure" >> /etc/apache2/conf-available/security.conf
  sudo echo "Header always append X-Frame-Options SAMEORIGIN" >> /etc/apache2/conf-available/security.conf
  sudo echo "Header set X-XSS-Protection \"1; mode=block\"" >> /etc/apache2/conf-available/security.conf
  sudo echo "Header always set Strict-Transport-Security \"max-age=31536000; includeSubDomains\"" >> /etc/apache2/conf-available/security.conf
  sudo echo "Header set X-Content-Type-Options: \"nosniff\"" >> /etc/apache2/conf-available/security.conf
  sudo echo "Header set Content-Security-Policy \"default-src 'self';\"" >> /etc/apache2/conf-available/security.conf

  sudo echo "<Directory />" >> /etc/apache2/conf-available/security.conf
  sudo echo "Options -Indexes" >> /etc/apache2/conf-available/security.conf
  sudo echo "AllowOverride None" >> /etc/apache2/conf-available/security.conf
  sudo echo "Order Deny,Allow" >> /etc/apache2/conf-available/security.conf
  sudo echo "Deny from all" >> /etc/apache2/conf-available/security.conf
  sudo echo "</Directory>" >> /etc/apache2/conf-available/security.conf

  sudo echo "<Directory /var/www/html>" >> /etc/apache2/conf-available/security.conf
  sudo echo "Options -Indexes -Includes" >> /etc/apache2/conf-available/security.conf
  sudo echo "AllowOverride None" >> /etc/apache2/conf-available/security.conf
  sudo echo "Order Allow,Deny" >> /etc/apache2/conf-available/security.conf
  sudo echo "Allow from All" >> /etc/apache2/conf-available/security.conf
  sudo echo "</Directory>" >> /etc/apache2/conf-available/security.conf

  a2dismod -f autoindex
  a2enmod headers

  sudo iptables -I INPUT -p tcp --dport 80 -i eth0 -m state --state NEW -m recent --set
  sudo iptables -I INPUT -p tcp --dport 80 -i eth0 -m state --state NEW -m recent --update --seconds 60 --hitcount 5 -j DROP
  iptables-save > /root/my.active.firewall.rules

  sudo service apache2 enable
  sudo service apache2 restart

}
