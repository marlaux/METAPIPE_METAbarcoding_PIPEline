#!/bin/bash

#SBATCH --job-name=cleanclip
#SBATCH --time=72:00:00
#SBATCH --account=nn9813k
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=8G


set -o errexit
set -o nounset

#get your primers reverse complement in this website:
#http://arep.med.harvard.edu/labgc/adnan/projects/Utilities/revcomp.html

#for details: ./3_tag_primer_clipping_clean_derep_slurm.sh -h
./3_tag_primer_clipping_clean_derep_slurm.sh -b trnL_sub_tags.txt -F GGGCAATCCTGAGCCAA -R CCATTGAGTCTCTGCACCTATC -f TTGGCTCAGGATTGCCC -r GATAGGTGCAGAGACTCAATGG -p trnL -l 20 -d /cluster/projects/nn9813k/METAPIPE_latest/demulti_linked_samples


