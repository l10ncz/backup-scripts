#!/bin/bash
set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
BACKUP_ID="$(date +'%Y-%m-%d-%H-%M')"
LOCAL_BACKUP_DIR="${SCRIPT_DIR}/${BACKUP_ID}"

mkdir "${LOCAL_BACKUP_DIR}"
cd "${LOCAL_BACKUP_DIR}"

echo 'Backup L10N.cz ...'

echo 'Backup database ...'
ssh l10ncz@yasha.ubuntu.cz 'bash -s' < "${SCRIPT_DIR}/backup-db-wiki-l10n-cz.sh"
scp l10ncz@yasha.ubuntu.cz:'/tmp/wiki-l10n-cz.sql.gz' "${LOCAL_BACKUP_DIR}"
ssh l10ncz@yasha.ubuntu.cz 'rm /tmp/wiki-l10n-cz.sql.gz'

echo 'Backup /var/www/l10n.cz ...'
bash "${SCRIPT_DIR}/backup-var-www-l10ncz.sh"

cd -
