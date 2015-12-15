# Make backup dir
backupdir="backup/$(date +%s)/"
mkdir -p $backupdir

# Backup then create a symlink for each dotfile
for dotfile in dotfiles/*
do
    basename="$(basename $dotfile)"
    mv "$HOME/.$basename" "$backupdir/$basename"
    ln -s $(readlink -f $dotfile) "$HOME/.$basename"
done

# Install Vim bundles
mkdir -p ~/.vim/bundle
for repo in $(cat vimbundles.txt)
do
    cd ~/.vim/bundle && git clone $repo
done
