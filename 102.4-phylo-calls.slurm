#!/bin/bash
#SBATCH --job-name=angsd
#SBATCH --partition=bmh
#SBATCH --account=millermrgrp
#SBATCH --time=15:00:00
#SBATCH --mem=256G
#SBATCH --cpus-per-task=12

module load bcftools
 angsd -nthreads 12 \
-minInd 163 -bam bamlists/181.bamlist -out outputs/102/snps-05 \
-ref /home/jsweeney/genomes/genome.fasta \
-minMaf 0.05 -minMapQ 20 -minQ 20 -GL 1 -doMajorMinor 1 -doMaf 1 -SNP_pval 1e-6 \
-doGeno 2 -doPost 1 -postCutoff 0.95 -doPlink 2 \
> outputs/102/snps-05.out 2> outputs/102/snps-05.err 

plink --tfile outputs/102/snps-05 --recode vcf bgz --out outputs/102/snps-05-recode --keep-allele-order --allow-extra-chr

bcftools reheader --samples bamlists/181.names outputs/102/snps-05-recode.vcf.gz | bcftools +fill-tags -Ou -- -t MAF,F_MISSING | bcftools view -i "F_MISSING < 0.10 && MAF > 0.10" -Oz -o  outputs/102/snps-10-renamed.vcf.gz

bcftools +prune -n 1 -N rand --random-seed 123 -w 50000bp \
  outputs/102/snps-10-renamed.vcf.gz -Oz -o outputs/102/snps-pruned-10.vcf.gz
