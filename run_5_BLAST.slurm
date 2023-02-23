#!/bin/bash

#SBATCH --account=nn9813k
#SBATCH --job-name=Blast
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=8G
#SBATCH --time=72:00:00




set -o errexit
set -o nounset

module --force purge
module load StdEnv
module load BLAST+/2.12.0-gompi-2021b

#for details: ./5_BLAST_options.sh -h
./5_BLAST_options.sh -f trnL_cluster_representatives2blast.fas -d Streptophyta_trnL_NCBI.uniq.fasta -s 0.97 -c 0.5 -t 8 -o trnL_NCBI_target97
#EXAMPLE NT
#./5_BLAST_options.sh -f my_dataset_cluster_representatives_clean.fas -d NT -s 0.90 -c 0.6 -t 8 -o my_dataset_NT


exit 0

