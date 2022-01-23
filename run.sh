#!/usr/bin/with-contenv bashio

echo "💾 Welcome to the backup blaster! 💾
Auto snapshot backup to
 - Google Drive
 - Dropbox
 - Box
"

nginx -g 'daemon off;' &
npm run start