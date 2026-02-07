#!/bin/bash
#SBATCH --job-name=featureCounts
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --time=6:00:00
#SBATCH --partition=basic
#SBATCH --output=/lisc/data/scratch/course/2025w300106/gang/logs/featureCounts.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/gang/logs/featureCounts.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12416922@unet.univie.ac.at

### LOAD ENVIRONMENT
module load subread
module list

### SET DIRECTORIES

wd="/lisc/data/scratch/course/2025w300106/gang"
bam="${wd}/filtered.bam"
gtf="${wd}/filtered_gene_models.gtf"
out="${wd}/counts.summary"

### EXECUTION
### OUTPUT: GENE X COUNT MATRIX

featureCounts \
  -p --countReadPairs -C \
  -T 4 \
  -s 2 \
  --primary \
  -a "$gtf" \
  -o "$out" \
  "$bam"

