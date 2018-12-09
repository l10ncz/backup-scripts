#!/bin/bash
set -e

REMOTE_BACKUP_FILE='/tmp/var-www-l10ncz.tar.gz'

echo "Creating backup file ${REMOTE_BACKUP_FILE}"
ssh l10ncz@yasha.ubuntu.cz "tar --exclude='*/home/*' --exclude='*/logs/*' -C /var/www/l10n.cz -czf ${REMOTE_BACKUP_FILE} ./"

echo "Downloading ${REMOTE_BACKUP_FILE}"
scp l10ncz@yasha.ubuntu.cz:"${REMOTE_BACKUP_FILE}" './'

echo "Removing remote file ${REMOTE_BACKUP_FILE}"
ssh l10ncz@yasha.ubuntu.cz "rm ${REMOTE_BACKUP_FILE}"
