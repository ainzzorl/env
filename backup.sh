# Add to crontab:
# 0 12 * * * /Users/lacungus/env/backup.sh >> /Users/lacungus/env/log/backup.log 2>&1

echo "Starting backup"
date

datestr=$(date '+%Y-%m-%d-%H-%M-%S')

src="$HOME/Library/Mobile Documents/com~apple~CloudDocs/lac.kdbx"
dest_icloud="$HOME/Library/Mobile Documents/com~apple~CloudDocs/backups/keepass/lac-$datestr.kdbx"
echo "Copying '$src' to '$dest_icloud'"
cp "$src" "$dest_icloud"

src="$HOME/opt/hvcm/hvcm.sqlite"
dest_icloud="$HOME/Library/Mobile Documents/com~apple~CloudDocs/backups/hvcm/hvcm-$datestr.sqlite"
echo "Copying '$src' to '$dest_icloud'"
cp "$src" "$dest_icloud"

echo "Done"
