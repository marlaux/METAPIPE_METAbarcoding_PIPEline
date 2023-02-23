#!/bin/bash

#SBATCH --account=nn9813k
#SBATCH --job-name=Pear
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=8G 
#SBATCH --time=72:00:00


set -o errexit 
set -o nounset 

module --quiet purge
module load StdEnv
module load PEAR/0.9.11-GCCcore-9.3.0

#for details: ./1_merge_pear.sh -h
./1_merge_pear.sh -f trnL_S1_L001_R1_001_sub.fastq -r trnL_S1_L001_R2_001_sub.fastq -o trnL -p 0.001 -s 20 -t 8

exit 0
