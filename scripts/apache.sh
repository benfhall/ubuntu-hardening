function f_apache {
  echo "Configuring apache"

  sudo sed -i 's/FileETag.*//' /etc/apache2/apache2.conf
  sudo echo "FileETag None" >> /etc/apache2/apache2.conf
  sudo sed -i 's/RewriteEngine.*//' /etc/apache2/apache2.conf
  sudo echo "RewriteEngine On" >> /etc/apache2/apache2.conf
  sudo sed -i 's/RewriteCond.*//' /etc/apache2/apache2.conf
  sudo echo "RewriteCond %{THE_REQUEST} !HTTP/1\.1$" >> /etc/apache2/apache2.conf
  sudo sed -i 's/RewriteRule.*//' /etc/apache2/apache2.conf
  sudo echo "RewriteRule .* - F" >> /etc/apache2/apache2.conf
  sudo sed -i 's/TraceEnable.*//' /etc/apache2/apache2.conf
  sudo echo "TraceEnable off" >> /etc/apache2/apache2.conf
  sudo sed -i 's/Timeout.*//' /etc/apache2/apache2.conf
  sudo echo "Timeout 45" >> /etc/apache2/apache2.conf

  sudo service enable apache2
  sudo service restart apache2

}
