function f_nginx {
	echo -n "Configuring nginx... "

	sudo sed -i "s/# server_tokens off;/server_tokens off;/g" /etc/nginx/nginx.conf
	sudo sed -i 's/server_tokens off;/server_tokens off;\netag off;/' /etc/nginx/nginx.conf
	sudo echo "" > /var/www/html/index.html
	sudo sed -i "s/ssl_prefer_server_ciphers on;/ssl_prefer_server_ciphers on;\nssl_ciphers ECDHE-RSA-AES256-GCM-SHA512:DHE-RSA-AES256-GCM-SHA512:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-SHA384;/" /etc/nginx/nginx.conf
	sudo sed -i "s/ssl_prefer_server_ciphers on;/ssl_prefer_server_ciphers on;\nssl_session_timeout 5m;/" /etc/nginx/nginx.conf
	sudo sed -i "s/ssl_session_timeout 5m;/ssl_session_cache shared:SSL:10m;\nssl_session_timeout 5m;/" /etc/nginx/nginx.conf
	sudo sed -i "s|^\s*try_files \\\$uri \\\$uri/ =404;|try_files \\\$uri \\\$uri/ =404;\nproxy_cookie_path / \"/; secure; HttpOnly\";|" /etc/nginx/sites-available/default
	sudo sed -i "s|root /var/www/html;|root /var/www/html;\nadd_header X-Frame-Options DENY;|" /etc/nginx/sites-available/default
	sudo sed -i "s|root /var/www/html;|root /var/www/html;\nadd_header X-XSS-Protection \"1; mode=block\";|" /etc/nginx/sites-available/default
	sudo sed -i "s|root /var/www/html;|root /var/www/html;\nadd_header Strict-Transport-Security \"max-age=31536000; includeSubdomains;\";|" /etc/nginx/sites-available/default
	sudo sed -i "s|root /var/www/html;|root /var/www/html;\nadd_header X-Content-Type-Options nosniff;|" /etc/nginx/sites-available/default
	sudo sed -i "s|root /var/www/html;|root /var/www/html;\nadd_header Content-Security-Policy \"default-src 'self';\";|" /etc/nginx/sites-available/default
	sudo sed -i "s|root /var/www/html;|root /var/www/html;\nadd_header X-Robots-Tag none;|" /etc/nginx/sites-available/default

	sudo service nginx restart
  	sudo ufw allow nginx
  	sudo service nginx enable
  	sudo service nginx restart
	
	echo "[COMPLETE]"
}