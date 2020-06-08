repodir=$(pwd)

# Make backup dir
backupdir="backup/$(date +%s)/"
mkdir -p $backupdir

# Backup then create a symlink for each dotfile
for dotfile in dotfiles/*
do
    echo "DOTFILES - Installing $dotfile"
    basename="$(basename $dotfile)"
    mv "$HOME/.$basename" "$backupdir/$basename"
    ln -s "$repodir/$dotfile" "$HOME/.$basename"
done

# Install Vim bundles
echo "DOTFILES - Installing vim bundles"
mkdir -p ~/.vim/bundle
rm -rf ~/.vim/bundle/*
for repo in $(cat vimbundles.txt)
do
    (cd ~/.vim/bundle && git clone $repo)
done

Install tmux plugins
echo "DOTFILES - Installing tmux plugins"
mkdir -p ~/.tmuxplugins
rm -rf ~/.tmuxplugins/*
for repo in $(cat tmuxplugins.txt)
do
    (cd ~/.tmuxplugins && git clone $repo)
done

echo "DOTFILES - Done"
