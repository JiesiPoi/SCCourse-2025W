#!/bin/bash
#SBATCH --job-name=STAR
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=120G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/gang/logs/STAR.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/gang/logs/STAR.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12416922@unet.univie.ac.at

###ENVIRONMENT 

module load STAR
module list

###EXECUTION

STAR --genomeDir /lisc/data/scratch/course/2025w300106/gang/Shark_STAR \
 --runThreadN 16\
 --readFilesIn /lisc/data/scratch/course/2025w300106/gang/SRR29120068_1.fastq \
 /lisc/data/scratch/course/2025w300106/gang/SRR29120068_2.fastq \
 --outFileNamePrefix /lisc/data/scratch/course/2025w300106/gang/results/map/outShark \
 --outSAMstrandField intronMotif \
 --outSAMtype BAM SortedByCoordinate


