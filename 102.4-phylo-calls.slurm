#!/bin/bash
#SBATCH --job-name=angsd-phylo
#SBATCH --partition=bmh
#SBATCH --account=millermrgrp
#SBATCH --time=15:00:00
#SBATCH --mem=256G
#SBATCH --cpus-per-task=12
#SBATCH --output=logs/%x_%j.out
#SBATCH --error=logs/%x_%j.err


module load bcftools

angsd -nthreads 12 \
-minInd 163 -bam bamlists/181.bamlist -out outputs/102/snps-01 \
-ref /home/jsweeney/genomes/genome.fasta \
-minMaf 0.01 -minMapQ 20 -minQ 20 -GL 1 -doMajorMinor 1 -doMaf 1 -SNP_pval 1e-6 \
-doGeno 2 -doPost 1 -postCutoff 0.95 -doPlink 2 \
> outputs/102/snps-01.out 2> outputs/102/snps-01.err 

plink --tfile outputs/102/snps-01 --recode vcf bgz --out outputs/102/snps-01-recode --keep-allele-order --allow-extra-chr

bcftools reheader --samples bamlists/181.names outputs/102/snps-01-recode.vcf.gz | bcftools +fill-tags -Ou -- -t MAF,F_MISSING | bcftools view -i "F_MISSING < 0.10 && MAF > 0.01" -Oz -o  outputs/102/snps-01-renamed.vcf.gz

bcftools +prune -n 1 -N rand --random-seed 123 -w 50000bp \
  outputs/102/snps-01-renamed.vcf.gz -Oz -o outputs/102/snps-pruned-01.vcf.gz
