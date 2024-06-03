#!/bin/bash
#sample
for i in *.fastq.gz; do
    lemur -i ${i} \
          -o output-$(basename ${i} .fastq.gz) \
          -d rv221bacarc-rv222fungi/ \
          --tax-path rv221bacarc-rv222fungi/taxonomy.tsv \
          -r species \
          -t 10;
done

#!/bin/bash
#sample
for i in *.fastq.gz; do
    filtlong --min_length 2000 -–min_mean_q 95 ${i} | gzip > $(basename ${i} .fastq.gz)_filt.fastq.gz;
done


# sylph
/home/mbi/sylph/gtdb_genomes_reps_r220/gtdb-r220-c200-dbv1.syldb

sylph profile *.fastq.gz /home/mbi/sylph/gtdb_genomes_reps_r220/gtdb-r220-c200-dbv1.syldb -u -t 10 -o results_ont_mocks.tsv

# no FP but F. nucleatum is classified as F. animalis
sylph profile \
    SRR17913199_1.fastq.gz \
    /home/mbi/sylph/sylph_dbs/gtdb-r220-c200-dbv1.syldb \
    /home/mbi/sylph/sylph_dbs/fungi-refseq-2023nov28-c200-v0.3.syldb \
    /home/mbi/sylph/sylph_dbs/imgvr_c200_v0.3.0.syldb -u -t 10 -o results_multidomain.tsv


refseq_build.py -p extreme -o . -e 1117,766 -s 10 --latin --block "unknown,uncultured,unidentified,unclassified,unresolved"
