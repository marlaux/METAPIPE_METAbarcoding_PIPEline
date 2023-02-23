#!/bin/bash

#SBATCH --account=nn9813k
#SBATCH --job-name=primers_cut
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=8G
#SBATCH --time=72:00:00




set -o errexit
set -o nounset

module --force purge
module load StdEnv
module load cutadapt/1.18-foss-2018b-Python-3.6.6

./DB2_NCBI_primers_cut.sh -r Streptophyta_trnL_NCBI.fasta -F GGGCAATCCTGAGCCAA -R CCATTGAGTCTCTGCACCTATC -p Streptophyta_trnL_NCBI

exit 0
