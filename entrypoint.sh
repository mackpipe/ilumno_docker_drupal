#!/bin/bash
set -e

  # Drupal settings
  echo >&2 "Copiando settings.php"
  cp /tmp/settings.php /var/www/html/app/web/sites/default/settings.php
  cp /tmp/settings.local.php /var/www/html/app/web/sites/default/settings.local.php

  # Change to the application directory
  cd /var/www/html/app

  # Install the RESTUI module to be able to activate REST services
  composer require drupal/restui

  # Install the Drush module for bash operations
  # composer require drush/drush

  # Create the custom modules folder
  MODULOS_CUSTOM=/var/www/html/app/web/modules/custom
  if [ -d "$MODULOS_CUSTOM" ]
  then
    echo >&2 "Folder for custom modules already exists"
  else
    mkdir $MODULOS_CUSTOM
  fi

  # It changes to the Drupal custom modules folder
  cd $MODULOS_CUSTOM

  # Clone the ilumno_programs repository
  echo >&2 "Clona el repositorio de git ilumno_programs"
  git clone https://github.com/mackpipe/ilumno_programs.git

  # Clone the ilumno_programs_rest repository
  echo >&2 "Clona el repositorio de git ilumno_programs_rest"
  git clone https://github.com/mackpipe/ilumno_programs_rest.git

  # Activate the modules needed for the test
  # As an initial drupal backup is loaded where these modules are already
  # configured and activated, these lines are not necessary
  #echo >&2 "Activate the modules needed for the test"
  #cd /var/www/html/app
  #vendor/drush/drush en restui ilumno_programs ilumno_programs_rest -y

  echo >&2 "========================================================================"
  echo >&2
  echo >&2 " This container is running Drupal8 with composer on Mysql"
  echo >&2
  echo >&2 "========================================================================"

exec "$@";
