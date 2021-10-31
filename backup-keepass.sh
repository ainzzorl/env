datestr=$(date '+%Y-%m-%d-%H-%M-%S')
dest="$HOME/Dropbox/backups/keepass/lac-$datestr.kdbx"
cp "$HOME/Dropbox/lac.kdbx" $dest
