#!/bin/bash
set -e

# Generate config.php from template using environment variables.
# Moodle 5.x: config.php lives at the installation root (/var/www/moodle/),
# one level above the web root (/var/www/moodle/public/).
envsubst < /var/www/moodle/config.php.template > /var/www/moodle/config.php
chown www-data:www-data /var/www/moodle/config.php

exec "$@"
