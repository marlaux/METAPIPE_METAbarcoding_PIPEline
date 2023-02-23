#!/bin/bash

#SBATCH --job-name=build_OTUtable
#SBATCH --time=72:00:00
#SBATCH --account=nn9813k
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=16G


set -o errexit
set -o nounset


module --force purge
module load StdEnv
module load Python/2.7.15-GCCcore-8.2.0

#./6a_build_OTU_table.sh <representatives.fas> <.qual file> <Blast_results_formatted2OTUtable.tab> <path to dereplicated fasta files>
./6a_build_OTU_table.sh trnL_cluster_representatives.fas trnL.qual Blast_results_formatted2OTUtable.tab /cluster/projects/nn9813k/METAPIPE_latest/dereplicated
#./6b_filter_OTU_table.sh <OTU_table_complete.tab> <.qual file>
./6b_filter_OTU_table.sh trnL_OTU_table_complete.tab trnL.qual
rm tmp*


