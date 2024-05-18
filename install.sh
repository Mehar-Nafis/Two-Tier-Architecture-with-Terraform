    #!/bin/bash
    apt-get update
    apt-get install -y apache2 php php-mysql
    systemctl start apache2
    systemctl enable apache2
    
    wget https://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz
    cp -r wordpress/* /var/www/html/
    
    chown -R www-data:www-data /var/www/html/
    
    # Configure WordPress with RDS details
    cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
    
    DB_NAME="project_db"
    DB_USER="admin"
    DB_PASSWORD="password"
    DB_HOST="${db_endpoint}"
    
    sed -i "s/database_name_here/$DB_NAME/" /var/www/html/wp-config.php
    sed -i "s/username_here/$DB_USER/" /var/www/html/wp-config.php
    sed -i "s/password_here/$DB_PASSWORD/" /var/www/html/wp-config.php
    sed -i "s/localhost/$DB_HOST/" /var/www/html/wp-config.php
    sudo rm -rf /var/www/html/index.html
