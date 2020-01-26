## linux_config_files

This was inspired by a blog post (see pdf in this repo)

To make this work, you need to:
1) Clone this repo into your home directory (you should then have a linux_config_files directory)
2) Repace existing .bashrc, .inputrc, tmux.conf files with symbolic links from your /home/user directory like so:

```shell
ln -s ~/linux_config_files/.inputrc .inputrc
ln -s ~/linux_config_files/.tmux.conf .tmux.conf
ln -s ~/linux_config_files/.vimrc .vimrc
ln -s ~/linux_config_files/multihost_bashrc/base_bashrc .bashrc
```

### Ultisnips
I use Ultisnips in my .vimrc, which stores the snippets in ~/.vim/Ultisnips. In order to keep my .snippets files synched across machines, I move new files created in .vim/Ultisnips/ to linux_config_files/ultisnips and replace them with hardlinks. 
