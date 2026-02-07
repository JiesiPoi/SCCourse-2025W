#!/bin/bash
#SBATCH --job-name=EGGNOG
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=20G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/gang/logs/EGG.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/gang/logs/EGG.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12416922@unet.univie.ac.at


### LOAD ENVIRONMENT
module load eggnogmapper
module list

### WORKING DIRECTORY

od="/lisc/data/scratch/course/2025w300106/gang/egg"
mkdir -p "$od"
cd "$od" || exit 1

### INPUT: PROTEINS.CLEAN.FAA
### SEARCHES FOR ORTHOLOG PROTEINS USING DIAMOND ALGORITHM AGAINST EGGNOG DATABASE
### FILTERS FOR SIGNIFICANT AND GO WITH EPERIMENTAL EVIDENCE
### OUTPUT: ANNOTAION FILE

emapper.py \
  -i /lisc/data/scratch/course/2025w300106/gang/proteins.clean.faa \
  --output annotation \
  --output_dir "$od" \
  --cpu 16 \
  --itype proteins \
  -m diamond \
  --evalue 1e-5 \
  --go_evidence experimental

