#/bin/bash

TMP_FASTA=$(mktemp --tmpdir=".")
PREFIX="${1}"
PWD="${2}"
THREADS="${3}"
GLOBAL_DB=${PREFIX}_global_dp.fas

####################################################################F
# Global dereplication
#####################################################################
cat "${PWD}"/*_dp.fasta > "${TMP_FASTA}"

vsearch --derep_fulllength "${TMP_FASTA}" \
        --sizein \
        --sizeout \
        --fasta_width 0 \
        --output ${GLOBAL_DB} > /dev/null

rm -f ${TMP_FASTA}

#####################################################################
#clustering with SWARM
#####################################################################

TMP_REPRESENTATIVES=$(mktemp --tmpdir=".")

swarm   \
    -d 1 -f -t ${THREADS} -z \
    -s ${PREFIX}_cluster.stats \
    -w ${TMP_REPRESENTATIVES} \
    -o ${PREFIX}_cluster.swarms < "${GLOBAL_DB}"

########################################################################
# Sort clustering representatives
########################################################################

REPRESENTATIVES=${PREFIX}_cluster_representatives.fas

vsearch \
        --fasta_width 0 \
        --sortbysize ${TMP_REPRESENTATIVES} \
        --output ${REPRESENTATIVES}
rm ${TMP_REPRESENTATIVES}

FINAL=${REPRESENTATIVES/_representatives.fas/_representatives2blast.fas}
sed -e '/^>/ s/;size=/_/g' -e '/^>/ s/;//g' "${REPRESENTATIVES}" > "${FINAL}"

#####################################################################
# Chimera checking
#####################################################################
TMP_NOCHIMERAS=$(mktemp --tmpdir=".")
UCHIME=${REPRESENTATIVES/.fas/.uchime}
CHIMERAS=${REPRESENTATIVES/.fas/.chimeras}
#nonchimeras sorting with renaming
NOCHIMERAS=${REPRESENTATIVES/.fas/_nochimeras_tmp.fas}

vsearch --uchime_denovo "${REPRESENTATIVES}" \
        --chimeras "${CHIMERAS}"        \
        --abskew 2      \
        --fasta_score   \
        --nonchimeras "${TMP_NOCHIMERAS}"   \
        --sizeout       \
        --uchimeout "${UCHIME}"

vsearch \
        --fasta_width 0 \
        --sortbysize ${TMP_NOCHIMERAS} \
        --output ${NOCHIMERAS}
rm ${TMP_NOCHIMERAS}

#General abundance editing
FINAL2=${NOCHIMERAS/_tmp.fas/.fas}
sed -e '/^>/ s/;size=/_/g' -e '/^>/ s/;//g' "${NOCHIMERAS}" > "${FINAL2}"
mkdir chimera_out
mv *_nochimeras.fas *.chimeras chimera_out
rm ${NOCHIMERAS}

