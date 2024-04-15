# Install the VE
```
conda create -n ve_working python=3.11.6 -c conda-forge
conda activate ve_working
python3 -m venv ve_working
conda deactivate
. ve_working/bin/activate
pip install -r ve_working.txt
```
