#!/bin/bash
#SBATCH --job-name=angsd
#SBATCH --partition=bmh
#SBATCH --account=millermrgrp
#SBATCH --time=08:00:00
#SBATCH --mem=256G
#SBATCH --cpus-per-task=12

module load angsd
angsd -nthreads 12 \
-minInd $min_ind -bam bamlists/nwrk.bamlist -out outputs/101.2/snps-nwrk \
-ref /home/jsweeney/newark/genomes/genome.fasta \
-minMaf 0.05 -minMapQ 20 -minQ 20 -GL 1 -doMajorMinor 1 -doMaf 1 -SNP_pval 1e-6 \
-doGeno 2 -doPost 1 -postCutoff 0.95 -doPlink 2 > outputs/101.2/snps-fil.out 2> outputs/101.2/snps-nwrk.err