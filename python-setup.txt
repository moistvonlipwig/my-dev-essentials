sudo apt update
sudo apt install -y python3-pip

python3 -m pip install --user black flake8 pylint

python3 -m venv ~/.venvs/h1-ai-env
source ~/.venvs/vim-tools/bin/activate
pip install black flake8 pylint

Using Conda
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

Using Conda Env
conda env export > environment.yml
conda env create -f environment 

Updating env
Make sure the environment is not active. If it is, run:

Bash
conda deactivate

Run the update command:
Bash
conda env update --file environment.yml --prune


