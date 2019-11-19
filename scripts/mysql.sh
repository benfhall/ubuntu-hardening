function f_mysql {

    apt-get install mysql-server -y
    
    if ! grep -q "^max_connect_errors" /etc/mysql/my.cnf 2> /dev/null; then
        echo "max_connect_errors = 3" >> /etc/mysql/my.cnf
    else
        sed -i 's/max_connect_errors.*/max_connect_errors = 3/' /etc/mysql/my.cnf
    fi

    if ! grep -q "^local-infile" /etc/mysql/my.cnf 2> /dev/null; then
        echo "local-infile = 0" >> /etc/mysql/my.cnf
    else
        sed -i 's/local-infile.*/local-infile = 0/' /etc/mysql/my.cnf
    fi

    if ! grep -q "^skip_show-database" /etc/mysql/my.cnf 2> /dev/null; then
        echo "skip_show-database" >> /etc/mysql/my.cnf
    fi

    mysql_secure_installation

  	ufw allow mysql

}