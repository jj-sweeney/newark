#!/bin/bash
#SBATCH --job-name=fst
#SBATCH --partition=bmh
#SBATCH --account=millermrgrp
#SBATCH --time=8:00:00
#SBATCH --mem=64G
#SBATCH --output=fst_%j.out
#SBATCH --error=fst_%j.err

module load vcftools

vcftools --vcf pruned-nwrk.vcf --weir-fst-pop poplists/ColdCreekReservoir.txt \
	--weir-fst-pop poplists/NF6.txt \
	--weir-fst-pop poplists/NN3_Mid.txt \
	--weir-fst-pop poplists/NN3_North.txt \
	----weir-fst-pop poplists/NN4.txt \
	--out outputs/105
	