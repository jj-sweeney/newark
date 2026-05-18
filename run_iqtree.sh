#!/bin/bash
#SBATCH --job-name=iqtree
#SBATCH --partition=bmh
#SBATCH --account=millermrgrp
#SBATCH --time=08:00:00
#SBATCH --mem=256G
#SBATCH --cpus-per-task=12

iqtree -s outputs/102.2/pruned-fil.min4.phy -B 1000