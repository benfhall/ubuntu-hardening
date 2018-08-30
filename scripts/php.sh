function f_php {
  echo "Configuring PHP"

  sudo apt-get install php5_suhosin -y

  sudo sed -i 's/.*safe_mode.*//' /etc/php5/apache2/php.ini
  sudo echo "safe_mode = On" >> /etc/php5/apache2/php.ini
  sudo sed -i 's/.*safe_mode_gid.*//' /etc/php5/apache2/php.ini
  sudo echo "safe_mode_gif = On" >> /etc/php5/apache2/php.ini
  sudo sed -i 's/.*sql.safe_mode.*//' /etc/php5/apache2/php.ini
  sudo echo "sql.safe_mode = On" >> /etc/php5/apache2/php.ini
  sudo sed -i 's/.*register_globals.*//' /etc/php5/apache2/php.ini
  sudo echo "register_globals = Off" >> /etc/php5/apache2/php.ini
  sudo sed -i 's/.*expose_php.*//' /etc/php5/apache2/php.ini
  sudo echo "expose_php = Off" >> /etc/php5/apache2/php.ini
  sudo sed -i 's/.*track_errors.*//' /etc/php5/apache2/php.ini
  sudo echo "track_errors = Off" >> /etc/php5/apache2/php.ini
  sudo sed -i 's/.*html_errors.*//' /etc/php5/apache2/php.ini
  sudo echo "html_errors = Off" >> /etc/php5/apache2/php.ini
  sudo sed -i 's/.*display_errors.*//' /etc/php5/apache2/php.ini
  sudo echo "display_errors = Off" >> /etc/php5/apache2/php.ini
  sudo sed -i 's/.*allow_url_fopen.*//' /etc/php5/apache2/php.ini
  sudo echo "allow_url_fopen = Off" >> /etc/php5/apache2/php.ini
  sudo sed -i 's/.*allow_url_include =.*//' /etc/php5/apache2/php.ini
  sudo echo "allow_url_include = Off" >> /etc/php5/apache2/php.ini
  sudo sed -i 's/.*file_uploads.*//' /etc/php5/apache2/php.ini
  sudo echo "file_uploads = Off" >> /etc/php5/apache2/php.ini
  sudo sed -i 's/.*upload_tmp_dir.*//' /etc/php5/apache2/php.ini
  sudo echo "upload_tmp_dir = /var/php_tmp" >> /etc/php5/apache2/php.ini
  sudo sed -i 's/.*upload_max_filesize.*//' /etc/php5/apache2/php.ini
  sudo echo "upload_max_filesize = 2M" >> /etc/php5/apache2/php.ini
  sudo sed -i 's/.*max_execution_time.*//' /etc/php5/apache2/php.ini
  sudo echo "max_execution_time = 10" >> /etc/php5/apache2/php.ini
  sudo sed -i 's/.*max_input_time.*//' /etc/php5/apache2/php.ini
  sudo echo "max_input_time = 30" >> /etc/php5/apache2/php.ini
  sudo sed -i 's/.*memory_limit.*//' /etc/php5/apache2/php.ini
  sudo echo "memory_limit = 40M" >> /etc/php5/apache2/php.ini
  sudo sed -i 's/.*post_max_size.*//' /etc/php5/apache2/php.ini
  sudo echo "post_max_size=1K" >> /etc/php5/apache2/php.ini
  sudo sed -i 's/.*session.cookie_httponly.*//' /etc/php5/apache2/php.ini
  sudo echo "session.cookie_httponly = 1" >> /etc/php5/apache2/php.ini
  sudo sed -i 's/.*magic_quotes_gpc.*//' /etc/php5/apache2/php.ini
  sudo echo "magic_quotes_gpc=Off" >> /etc/php5/apache2/php.ini

  sudo sed -i 's/.*extension.*//' /etc/php5/conf.d/suhosin.ini
  sudo echo "extension=suhosin.so" >> /etc/php5/conf.d/suhosin.ini
  sudo sed -i 's/.*suhosin.session.encrypt.*//' /etc/php5/conf.d/suhosin.ini
  sudo echo "suhosin.session.encrypt = Off" >> /etc/php5/conf.d/suhosin.ini
  sudo sed -i 's/.*suhosin.log.syslog.*//' /etc/php5/conf.d/suhosin.ini
  sudo echo "suhosin.log.syslog=511" >> /etc/php5/conf.d/suhosin.ini
  sudo sed -i 's/.*suhosin.executor.include.mix_traversal.*//' /etc/php5/conf.d/suhosin.ini
  sudo echo "suhosin.executor.include.mix_traversal=4" >> /etc/php5/conf.d/suhosin.ini
  sudo sed -i 's/.*suhosin.executor.disable_eval.*//' /etc/php5/conf.d/suhosin.ini
  sudo echo "suhosin.executor.disable_eval=On" >> /etc/php5/conf.d/suhosin.ini
  sudo sed -i 's/.*suhosin.executor.disable_emodifier.*//' /etc/php5/conf.d/suhosin.ini
  sudo echo "suhosin.executor.disable_emodifier=On" >> /etc/php5/conf.d/suhosin.ini
  sudo sed -i 's/.*suhosin.mail.protect.*//' /etc/php5/conf.d/suhosin.ini
  sudo echo "suhosin.mail.protect=2" >> /etc/php5/conf.d/suhosin.ini
  sudo sed -i 's/.*suhosin.sql.bailout_on_error.*//' /etc/php5/conf.d/suhosin.ini
  sudo echo "suhosin.sql.bailout_on_error=On" >> /etc/php5/conf.d/suhosin.ini

  sudo sed -i 's/.*suhosin.cookie.max_vars.*//' /etc/php5/conf.d/suhosin.ini
  sudo sed -i 's/.*suhosin.get.max_array_index_length.*//' /etc/php5/conf.d/suhosin.ini
  sudo sed -i 's/.*suhosin.post.max_array_index_length.*//' /etc/php5/conf.d/suhosin.ini
  sudo sed -i 's/.*suhosin.post.max_totalname_length .*//' /etc/php5/conf.d/suhosin.ini
  sudo sed -i 's/.*suhosin.post.max_vars.*//' /etc/php5/conf.d/suhosin.ini
  sudo sed -i 's/.*suhosin.request.max_totalname_length.*//' /etc/php5/conf.d/suhosin.ini
  sudo sed -i 's/.*suhosin.request.max_varname_length.*//' /etc/php5/conf.d/suhosin.ini

  sudo echo "suhosin.cookie.max_vars = 2048" >> /etc/php5/conf.d/suhosin.ini
  sudo echo "suhosin.get.max_array_index_length = 256" >> /etc/php5/conf.d/suhosin.ini
  sudo echo "suhosin.post.max_array_index_length = 256" >> /etc/php5/conf.d/suhosin.ini
  sudo echo "suhosin.post.max_totalname_length = 8192" >> /etc/php5/conf.d/suhosin.ini
  sudo echo "suhosin.post.max_vars = 2048" >> /etc/php5/conf.d/suhosin.ini
  sudo echo "suhosin.request.max_totalname_length = 8192" >> /etc/php5/conf.d/suhosin.ini
  sudo echo "suhosin.request.max_varname_length = 256" >> /etc/php5/conf.d/suhosin.ini
  
  sudo service apache2 enable
  sudo service apache2 restart
}
