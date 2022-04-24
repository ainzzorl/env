datestr=$(date '+%Y-%m-%d-%H-%M-%S')
dest_dropbox="$HOME/Dropbox/backups/keepass/lac-$datestr.kdbx"
cp "$HOME/Dropbox/lac.kdbx" $dest_dropbox
dest_icloud="$HOME/Library/Mobile Documents/com~apple~CloudDocs/backups/keepass/lac-$datestr.kdbx"
cp "$HOME/Dropbox/lac.kdbx" "$dest_icloud"
