function f_apache {

  sudo apt-get install apache2 -y

  # Protection Against Fingerprinting
  sudo sed -i -e 's/ServerSignature On/ServerSignature Off/' $APACHE_CONFIG
  sudo sed -i -e 's/ServerTokens OS/ServerTokens Prod/' $APACHE_CONFIG

  # Disabling Directory Listing 
  sudo sed -r -i -e 's|^([[:space:]]*)</Directory>|\n\n\1\t# Hardening Related Configurations ===============\n\1</Directory>|g' $APACHE_CONFIG
  sudo sed -r -i -e 's|^([[:space:]]*)</Directory>|\1\tOptions -Indexes\n\1</Directory>|g' $APACHE_CONFIG
  
  # Disable Server Side Includes and Symbolic Links
  sudo sed -r -i -e 's|^([[:space:]]*)</Directory>|\1\tOptions -Includes\n\1\tOptions -FollowSymLinks\n\1</Directory>|g' $APACHE_CONFIG

  # Limit Request Size To Prevent DOS
  sudo sed -r -i -e 's|^([[:space:]]*)</Directory>|\1\tLimitRequestBody 512000\n\1\tOptions -FollowSymLinks\n\1</Directory>|g' $APACHE_CONFIG 

  # Disable Risky HTTP Methods
  sudo sed -r -i -e 's|^([[:space:]]*)</Directory>|\n\1\t<LimitExcept GET POST HEAD>\n\1\t\tdeny from all\n\1\t</LimitExcept>\n\n</Directory>|g' $APACHE_CONFIG

  # Enable XSS Protection For Modern Browsers
  sudo echo '' >> $APACHE_CONFIG 
  sudo echo '<IfModule mod_headers.c>' >> $APACHE_CONFIG 
  sudo echo 'Header set X-XSS-Protection 0' >> $APACHE_CONFIG 
  sudo echo '</IfModule>' >> $APACHE_CONFIG 

  # Protect Apache Binary Files
  sudo chown -R root:root /etc/httpd/conf /etc/httpd/bin >/dev/null 2>&1 &
  sudo chmod -R 750 /etc/httpd/conf /etc/httpd/bin >/dev/null 2>&1 &

  sudo ufw allow apache2
  sudo service apache2 enable
  sudo service apache2 restart
}
