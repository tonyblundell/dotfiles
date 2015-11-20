now=`date +"%s"`

echo 'Installing bash config'
mv ~/.bashrc ~/.bashrc.old.$now
ln -s `readlink -f dotfiles/bashrc` ~/.bashrc

mv ~/.inputrc ~/.inputrc.old.$now
ln -s `readlink -f dotfiles/inputrc` ~/.inputrc

echo 'Installing git config'
mv ~/.gitconfig ~/.gitconfig.old.$now
ln -s `readlink -f dotfiles/gitconfig` ~/.gitconfig

echo 'Installing tmux config'
mv ~/.tmux.conf ~/.tmux.conf.old.$now
ln -s `readlink -f dotfiles/tmux.conf` ~/.tmux.conf

echo 'Installing vim config'
mv ~/.vim/vimrc ~/.vim/vimrc.old.$now
ln -s `readlink -f dotfiles/vimrc` ~/.vim/vimrc

echo 'Installing vim bundles'
mv ~/.vim/bundle ~/.vim/bundle.old.$now
mkdir ~/.vim/bundle
for repo in `cat vimbundles.txt`; do
    cd ~/.vim/bundle && git clone $repo
done
