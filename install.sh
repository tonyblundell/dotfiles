now=`date +"%s"`
pwd=`echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"`

echo 'Installing bash config'
mv ~/.bashrc ~/.bashrc.old.$now
ln -s $pwd/dotfiles/bashrc ~/.bashrc

mv ~/.inputrc ~/.inputrc.old.$now
ln -s $pwd/inputrc ~/.inputrc

mv ~/.git-prompt.sh ~/.git-prompt.sh.old.$now
ln -s $pwd/git-prompt.sh ~/.git-prompt.sh

echo 'Installing git config'
mv ~/.gitconfig ~/.gitconfig.old.$now
ln -s $pwd/gitconfig ~/.gitconfig

echo 'Installing tmux config'
mv ~/.tmux.conf ~/.tmux.conf.old.$now
ln -s $pwd/tmux.conf ~/.tmux.conf

echo 'Installing vim config'
mv ~/.vim/vimrc ~/.vim/vimrc.old.$now
ln -s $pwd/vimrc ~/.vim/vimrc

echo 'Installing vim bundles'
mv ~/.vim/bundle ~/.vim/bundle.old.$now
mkdir -p ~/.vim/bundle
for repo in `cat vimbundles.txt`; do
    cd ~/.vim/bundle && git clone $repo
done
