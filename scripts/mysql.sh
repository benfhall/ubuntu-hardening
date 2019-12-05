function f_mysql {

    grep -q '^max_connect_errors' /etc/mysql/my.cnf && sed -i 's/^max_connect_errors.*/max_connect_errors = 3/' /etc/mysql/my.cnf || echo 'max_connect_errors = 3' >> /etc/mysql/my.cnf
    grep -q '^local-infile' /etc/mysql/my.cnf && sed -i 's/^local-infile.*/local-infile = 0/' /etc/mysql/my.cnf || echo 'local-infile = 0' >> /etc/mysql/my.cnf
    grep -q '^skip_show-database' /etc/mysql/my.cnf && sed -i 's/^skip_show-database.*/skip_show-database/' /etc/mysql/my.cnf || echo 'skip_show-database' >> /etc/mysql/my.cnf
    grep -q '^bind-address' /etc/mysql/my.cnf && sed -i 's/^bind-address.*/bind-address=127.0.0.1/' /etc/mysql/my.cnf || echo 'bind-address=127.0.0.1' >> /etc/mysql/my.cnf

    mysql_secure_installation

    chown -R root:root /etc/mysql/
    chmod 0644 /etc/mysql/my.cnf

  	ufw allow mysql

}