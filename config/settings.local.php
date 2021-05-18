<?php

/**
 * @file
 * Local configuration.
 */

$databases['default']['default'] = [
  'database' => getenv('DRUPAL_DB_NAME'),
  'username' => getenv('DRUPAL_DB_USER'),
  'password' => getenv('DRUPAL_DB_PASSWORD'),
  'prefix' => '',
  'host' => getenv('DRUPAL_DB_HOST'),
  'port' => getenv('MYSQL_PORT'),
  'namespace' => 'Drupal\\Core\\Database\\Driver\\mysql',
  'driver' => 'mysql',
];

$settings['config_sync_directory'] = '../config/sync';

/**
 * Add domain to function your drupal.
 */
$settings['trusted_host_patterns'] = [
  'localhost',
];
