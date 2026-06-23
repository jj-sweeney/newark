#!/bin/bash
#SBATCH --job-name=fst
#SBATCH --partition=bmh
#SBATCH --account=millermrgrp
#SBATCH --time=8:00:00
#SBATCH --mem=64G

module load vcftools

vcftools --vcf outputs/101.2/pruned-nwrk.vcf \
  --weir-fst-pop poplists/ColdCreekReservoir.txt \
	--weir-fst-pop poplists/NF6.txt \
	--weir-fst-pop poplists/NN3_Mid.txt \
	--weir-fst-pop poplists/NN3_North.txt \
	--weir-fst-pop poplists/NN4.txt \
	--weir-fst-pop poplists/NV1.txt \
	--weir-fst-pop poplists/NV2.txt \
	--weir-fst-pop poplists/NV5.txt \
	--weir-fst-pop poplists/NV6.txt \
	--weir-fst-pop poplists/NV7.txt \
	--weir-fst-pop poplists/NV9.txt \
	--weir-fst-pop poplists/NV12.txt \
	--weir-fst-pop poplists/NV16.txt \
	--weir-fst-pop poplists/NV17.txt \
	--weir-fst-pop poplists/NV18.txt \
	--weir-fst-pop poplists/NV19.txt \
	--out outputs/105/all_nwrk_pops 2> outputs/105/all_nwrk_pops.log
	
	