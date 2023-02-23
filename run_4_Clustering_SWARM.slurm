#!/bin/bash
#SBATCH --job-name=cluster
#SBATCH --time=72:00:00
#SBATCH --account=nn9813k
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=8G

set -o errexit
set -o nounset

#./4_clustering_swarm_with_chim_filter_slurm.sh <prefix> <dereplicated fastas directory> <threads>
./4_clustering_swarm_with_chim_filter_pbs.sh trnL /cluster/projects/nn9813k/METAPIPE_latest/dereplicated 8


