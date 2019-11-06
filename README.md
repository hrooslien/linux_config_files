# linux_config_files

This was inspired by a blog post (see pdf in this repo)

To make this work, you need to:
1) Clone this repo into your home directory (you should then have a linux_config_files directory)
2) Repace existing .bashrc, .inputrc, tmux.conf files with symbolic links from your /home/user directory like so:

ln -s ~/linux_config_files/.inputrc .inputrc\
ln -s ~/linux_config_files/.tmux.conf .tmux.conf\
ln -s ~/linux_config_files/.vimrc .vimrc\
ln -s ~/linux_config_files/multihost_bashrc/base_bashrc .bashrc\

