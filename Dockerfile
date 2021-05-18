# Image from which is taken as a basis to install Drupal8 and Apache
FROM drupal:8-apache
# Updates the package system, and the necessary libraries for the project are installed
# Mysql-client is necessary to be able to use drush
# vim editor in the container
# git to download the necessary repos
RUN apt-get update && apt-get install -y \
	curl \
	vim \
	mariadb-client \
	git

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && \
	mv composer.phar /usr/local/bin/composer && \
	ln -s /root/.composer/vendor/bin/drush /usr/local/bin/drush

# Install Drush using Composer
RUN composer require drupal/console:~1.0 --prefer-dist --optimize-autoloader && \
	composer global require drush/drush && \
	composer global update

# Install XDEBUG
RUN pecl install -f xdebug \
	&& echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini;

# The container's package repository is cleaned up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# File Change root folder Example(docroot)
COPY ./apache-drupal.conf /etc/apache2/sites-enabled/000-default.conf

# Copy the configuration files for Drupal
COPY ./config/settings.php /tmp/settings.php
COPY ./config/settings.local.php /tmp/settings.local.php

# All files from the html root are deleted, the target
# is to download drupal through composer, and not use drupal
# which loads the container by default
RUN rm -rf /var/www/html/*

WORKDIR /var/www/html/

# We change to the directory of the document root
RUN cd /var/www/html/

# The drupal project is created from composer, the project is
# store in app folder
RUN composer create-project drupal/recommended-project:8.9.15 app

# The entrypoit file is copied to be able to carry out processes when loading
# of the container, such as file copies, or assigning permissions specials
COPY entrypoint.sh /var/www/html/app/web/

# Permissions assignment
RUN chmod -R 775 /var/www/html/app/web/entrypoint.sh

# Entry point
ENTRYPOINT ["/var/www/html/app/web/entrypoint.sh"]

CMD ["apache2-foreground"]
