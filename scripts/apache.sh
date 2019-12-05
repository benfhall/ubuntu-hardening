function f_apache {

  apt-get install apache2 -y

  # Protection Against Fingerprinting
  sed -i -e 's/ServerSignature On/ServerSignature Off/' /etc/apache2/apache2.conf
  sed -i -e 's/ServerTokens OS/ServerTokens Prod/' /etc/apache2/apache2.conf

  # Disabling Directory Listing 
  sed -r -i -e 's|^([[:space:]]*)</Directory>|\n\n\1\t# Hardening Related Configurations ===============\n\1</Directory>|g' /etc/apache2/apache2.conf
  sed -r -i -e 's|^([[:space:]]*)</Directory>|\1\tOptions -Indexes\n\1</Directory>|g' /etc/apache2/apache2.conf
  
  # Disable Server Side Includes and Symbolic Links
  sed -r -i -e 's|^([[:space:]]*)</Directory>|\1\tOptions -Includes\n\1\tOptions -FollowSymLinks\n\1</Directory>|g' /etc/apache2/apache2.conf

  # Limit Request Size To Prevent DOS
  sed -r -i -e 's|^([[:space:]]*)</Directory>|\1\tLimitRequestBody 512000\n\1\tOptions -FollowSymLinks\n\1</Directory>|g' /etc/apache2/apache2.conf 

  # Disable Risky HTTP Methods
  sed -r -i -e 's|^([[:space:]]*)</Directory>|\n\1\t<LimitExcept GET POST HEAD>\n\1\t\tdeny from all\n\1\t</LimitExcept>\n\n</Directory>|g' /etc/apache2/apache2.conf

  # Enable XSS Protection For Modern Browsers
  echo '' >> /etc/apache2/apache2.conf 
  echo '<IfModule mod_headers.c>' >> /etc/apache2/apache2.conf 
  echo 'Header set X-XSS-Protection 0' >> /etc/apache2/apache2.conf 
  echo '</IfModule>' >> /etc/apache2/apache2.conf 

  # Protect Apache Binary Files
  chown -R root:root /etc/httpd/conf /etc/httpd/bin >/dev/null 2>&1 &
  chmod -R 750 /etc/httpd/conf /etc/httpd/bin >/dev/null 2>&1 &

  ufw allow apache2
}
