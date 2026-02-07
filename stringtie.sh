#!/bin/bash
#SBATCH --job-name=stringtie
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=6:00:00
#SBATCH --partition=basic
#SBATCH --output=/lisc/data/scratch/course/2025w300106/gang/logs/stringtie.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/gang/logs/stringtie.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12416922@unet.univie.ac.at

### LOAD ENVIRONMENT
module load stringtie
module list

### SET DIRECTORIES
wd="/lisc/data/scratch/course/2025w300106/gang"
bam="${wd}/results/map/filtered.bam"
out_gtf="${wd}/results/stringtie/string.gtf"

mkdir -p "${wd}/results/stringtie"

### EXECUTION
### ASSEMBLES TRANSCRIPTS


stringtie "$bam" \
  -l PreShark \
  -o "$out_gtf" \
  -p 4 \
  -j 5 \
  -g 200 \
  -m 2000


