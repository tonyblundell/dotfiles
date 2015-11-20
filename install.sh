now=`date +"%s"`
pwd=`echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"`

echo 'Installing bash config'
mv ~/.bashrc ~/.bashrc.old.$now 2>/dev/null
ln -s "$pwd"dotfiles/bashrc ~/.bashrc

mv ~/.inputrc ~/.inputrc.old.$now 2>/dev/null
ln -s "$pwd"dotfiles/inputrc ~/.inputrc

mv ~/.git-prompt.sh ~/.git-prompt.sh.old.$now 2>/dev/null
ln -s "$pwd"dotfiles/git-prompt.sh ~/.git-prompt.sh

echo 'Installing git config'
mv ~/.gitconfig ~/.gitconfig.old.$now 2>/dev/null
ln -s "$pwd"dotfiles/gitconfig ~/.gitconfig

echo 'Installing tmux config'
mv ~/.tmux.conf ~/.tmux.conf.old.$now 2>/dev/null
ln -s "$pwd"dotfiles/tmux.conf ~/.tmux.conf

echo 'Installing vim config'
mkdir -p ~/.vim 2>/dev/null
mv ~/.vim/vimrc ~/.vim/vimrc.old.$now 2>/dev/null
ln -s "$pwd"dotfiles/vimrc ~/.vim/vimrc

echo 'Installing vim bundles'
mv ~/.vim/bundle ~/.vim/bundle.old.$now 2>/dev/null
mkdir -p ~/.vim/bundle 2>/dev/null
for repo in `cat vimbundles.txt`; do
    cd ~/.vim/bundle && git clone $repo
done
