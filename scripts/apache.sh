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

  a2dismod -f autoindex
  a2enmod headers

  sudo iptables -I INPUT -p tcp --dport 80 -i eth0 -m state --state NEW -m recent --set
  sudo iptables -I INPUT -p tcp --dport 80 -i eth0 -m state --state NEW -m recent --update --seconds 60 --hitcount 5 -j DROP
  iptables-save > /root/my.active.firewall.rules

  sudo service apache2 enable
  sudo service apache2 restart

}
