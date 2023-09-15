#!/bin/bash
#SBATCH --job-name=pytseg
#SBATCH -p gpu
#SBATCH --gres=gpu:1
#SBATCH --nodes=1
#SBATCH --mem=16G
#SBATCH -t 01:30:00
#SBATCH --output=pytseg_%j.out
#SBATCH --error=pytseg_%j.err
#SBATCH --mail-user=jaisongermany@gmail.com
#SBATCH --mail-type=ALL

# Load necessary modules
module load cuda/11.1
module load python/3.9
module load anaconda3
module load pack-user
spack load pytorch
spack load py-torch
spack load torch
spack load matplotlib 
spack load tensor


# Activate virtual environment
source activate seg

#debugging
python —version
python -m torch.utils.collect_env
nvcc -V

# Run Python script
python -u pytseg.py
