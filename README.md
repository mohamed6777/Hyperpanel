This pipeline is designed to detect and visualise Mutational Signatures in Hypermutated Tumors

Designed and Edited by : Mohamed Elsayed Youssef

Supervised by : Dr. Philipp Euskirchen

HOW TO USE:
1. download and install 'Conda, or miniconda' Package manager
2. use the config files as a parameter for conda to creat the work environments >   
    - conda env create -f environment.yml
    
    does not work on Login Nodes > use “run” command
    - source activate env_name
3. use 

Take care to be connected to a computing node, if on the cluster: srun --time 4-00 --mem=8G --ntasks=8 --pty bash -i