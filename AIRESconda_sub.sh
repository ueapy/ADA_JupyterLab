#!/bin/bash -e
#SBATCH --mail-type=NONE      #Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH -p compute-24-96    #Which queue to use
#SBATCH --mem=10G           ##memory allocation
#SBATCH --time=0-03:00       #Time (DD-HH:MM)
#SBATCH --job-name=AIRESconda  #Job name
#SBATCH -o AIRESconda.out       #Standard output log
#SBATCH -e AIRESconda.err       #Standard error log (where tunnel is specified)

#Load conda
module add python/anaconda/2020.11/3.8

#Activate environment
source activate AIRESenv

echo 'Ensure the system python version and the conda environment python verion match:'
python_sys=$(which python)
python_conda=$(python -c 'import sys;print(sys.prefix)')

echo ''
echo 'System python = '$python_sys
echo 'Conda python = '$python_conda
echo ''

#Get tunnel information
echo 'Local ssh command: ssh -N -L 8888:'$HOSTNAME':8888 abc12def@ada.uea.ac.uk'
echo 'Visit .err file for browser url'

#Set up a Jupyter Lab session on the host node

jupyter lab --no-browser --ip $HOSTNAME 

