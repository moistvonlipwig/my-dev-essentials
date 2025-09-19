# Python Setup (Conda-only)

## Install Miniconda (non-interactive)
```bash
# installs to ~/miniconda3
curl -fsSL -o /tmp/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash /tmp/miniconda.sh -b -p "$HOME/miniconda3"
eval "$($HOME/miniconda3/bin/conda shell.bash hook)"
conda init bash   # adds init lines to ~/.bashrc
