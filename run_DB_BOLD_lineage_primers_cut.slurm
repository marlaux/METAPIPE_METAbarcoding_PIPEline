#!/bin/bash

#SBATCH --account=nn9813k
#SBATCH --job-name=BOLD_refs
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=8G
#SBATCH --time=72:00:00




set -o errexit
set -o nounset

#./DB2_BOLD_lineage_primers_cut.sh <BOLD_references_downloaded.fasta> <primerF> <primerR>
./DB2_BOLD_lineage_primers_cut.sh BOLD_Blattodea_COI_Brazil.tsv GCHCCHGAYATRGCHTTYCC TCDGGRTGNCCRAARAAYCA


exit 0
