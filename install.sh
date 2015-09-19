echo 'You might need to change your default shell to zsh: `chsh -s /bin/zsh` (or `sudo vim /etc/passwd`)'

dir="$HOME/Development"
mkdir -p $dir
cd $dir
git clone --recursive git://github.com/carcer/dotfiles.git
cd dotfiles
sudo bash symlink-dotfiles.sh
