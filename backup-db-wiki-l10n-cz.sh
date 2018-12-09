#!/bin/bash
set -e

db_name="$(grep '$wgDBname' /var/www/l10n.cz/wiki/LocalSettings.php | cut -d '"' -f2)"
db_user="$(grep '$wgDBuser' /var/www/l10n.cz/wiki/LocalSettings.php | cut -d '"' -f2)"
db_password="$(grep '$wgDBpassword' /var/www/l10n.cz/wiki/LocalSettings.php | cut -d '"' -f2)"

mysqldump --user="$db_user" --password="$db_password" --databases "$db_name" | gzip -c > '/tmp/wiki-l10n-cz.sql.gz'
