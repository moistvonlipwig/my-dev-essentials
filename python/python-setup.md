# Python Setup (Conda-only)

## Install Miniconda (non-interactive)
```bash
# installs to ~/miniconda3
curl -fsSL -o /tmp/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash /tmp/miniconda.sh -b -p "$HOME/miniconda3"
eval "$($HOME/miniconda3/bin/conda shell.bash hook)"
conda init bash   # adds init lines to ~/.bashrc

## Cuda Setup
conda deactivate
conda env remove -n h1_ai_env
conda create -n h1_ai_env python=3.11
conda activate h1_ai_env
conda install pytorch==2.5.1 torchvision torchaudio pytorch-cuda=12.4 -c pytorch -c nvidia
conda list | grep cuda
