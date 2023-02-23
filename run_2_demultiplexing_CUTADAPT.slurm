#!/bin/bash

#SBATCH --job-name=demulti
#SBATCH --time=72:00:00
#SBATCH --account=nn9623k
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=8G

set -o errexit
set -o nounset

#PREPARE THE PAIRS OF TAGS FOR DEMULTIPLEXING (POSSIBLE ORIENTATIONS)
#>>>For Illumina merged reads type 'linked' (BEST OPTION ILLUMINA PAIRED-END)
#>>>For Illumina combinatorial type 'combinatorial'
#>>>For Illumina exact paired dual index type 'unique'
#>>>For Ion torrent dual index not anchored type 'ion'
#>>>For Ion dual index 3' anchored type 'ion3'
#>>>For Ion dual index 5' anchored type 'ion5'
#>>>For Ion dual index both anchored 'ionboth' (BEST OPTION FOR iON DUAL INDEXED)

#perl 2a_preparing_tags_LCPI.pl <tags/mapping file> <mode>
perl 2a_preparing_tags_LCPI.pl trnL_sub_tags.txt linked

module --quiet purge
module load StdEnv
module load cutadapt/2.10-GCCcore-9.3.0-Python-3.8.2

#RUN THE DEMULTIPLEXING
#THE LAST ARGUMENT IS THE ERROR RATE.
#THE ERROR RATE IS CALCULATED LIKE THIS:
#FOR ALLOWING 3 ERRORS IN A 12bp TAG, IS 3/12=0.25
#FOR ALLOWING ONLY 1 ERROR IN 12bp TAG, IS 1/12=0.08
#CUTADAPT DEFAULT ERROR RATE IS 0.2

#./2b_demulti_dual_index_linked.sh <merged.fastq> <error rate>
./2b_demulti_dual_index_linked.sh trnL.assembled.fastq 0.2
#./2b_demulti_dual_index_ionboth.sh ITS_Ion_dataset.fastq 0.25



