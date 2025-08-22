# make sure you have a recent Vim build
sudo apt update
sudo apt install -y vim-gtk3 curl git

# install vim-plug for Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Launch vim and run
:PlugInstall

sudo apt install fdfind
echo "alias fd=fdfind" >> ~/.bashrc && source ~/.bashrc

# For CoC (Node.js LTS)
sudo apt install -y nodejs npm
# or install a newer Node via NodeSource if Ubuntu's is old

# Linters/formatters used by your config
python3 -m pip install --user black flake8 pylint
sudo apt install -y clang-format clangd ripgrep fd-find

