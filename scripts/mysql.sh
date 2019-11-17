function f_mysql {

    sudo apt-get install mysql-server -y
    
    if ! grep -q "^max_connect_errors" /etc/mysql/my.cnf 2> /dev/null; then
        sudo echo "max_connect_errors = 3" >> /etc/mysql/my.cnf
    else
        sudo sed -i 's/max_connect_errors.*/max_connect_errors = 3/' /etc/mysql/my.cnf
    fi

    if ! grep -q "^local-infile" /etc/mysql/my.cnf 2> /dev/null; then
        sudo echo "local-infile = 0" >> /etc/mysql/my.cnf
    else
        sudo sed -i 's/local-infile.*/local-infile = 0/' /etc/mysql/my.cnf
    fi

    if ! grep -q "^skip_show-database" /etc/mysql/my.cnf 2> /dev/null; then
        sudo echo "skip_show-database" >> /etc/mysql/my.cnf
    fi

    sudo mysql_secure_installation

    sudo service mysql restart
  	sudo ufw allow mysql
  	sudo service mysql enable
  	sudo service mysql restart


}