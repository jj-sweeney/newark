#!/bin/bash
#SBATCH --job-name=fst
#SBATCH --partition=bmh
#SBATCH --account=millermrgrp
#SBATCH --time=8:00:00
#SBATCH --mem=64G

module load vcftools

vcftools pruned-nwrk.vcf --weir-fst-pop poplists/ColdCreekReservoir.txt \
	--weir-fst-pop poplists/NF6.TXT
	--weir-fst-pop poplists/NN3_Mid.txt
	--weir-fst-pop poplists/NN3_North.txt
	--NN4.txt