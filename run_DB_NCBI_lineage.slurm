#!/bin/bash

#SBATCH --account=nn9813k
#SBATCH --job-name=lineage
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=8G
#SBATCH --time=72:00:00




set -o errexit
set -o nounset

#For details: ./DB_NCBI_lineage_slurm.sh -h
./DB_NCBI_lineage_slurm.sh -r Streptophyta_trnL_NCBI_cutted_references.fasta -p Streptophyta_trnL_NCBI

exit 0
