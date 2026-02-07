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


### EXECUTION
### READS TRIMMED FASTQ FILES FOR ALIGNMENT
### OUTSAMSTRANDFIELD: LOOKS AT SPLICE JUNCTIONS AND CHECKS INTRONMOTIF
### OUTPUT: BAM FILE (ALIGMNENT SORTED BY GENOMIC POSITION)



STAR --genomeDir /lisc/data/scratch/course/2025w300106/gang/Shark_STAR \
 --runThreadN 16\
 --readFilesIn /lisc/data/scratch/course/2025w300106/gang/results/trimmomatic/SRR29__1P \
 /lisc/data/scratch/course/2025w300106/gang/results/trimmomatic/SRR29__2P \
 --outFileNamePrefix /lisc/data/scratch/course/2025w300106/gang/results/map/outShark \
 --outSAMstrandField intronMotif \
 --outSAMtype BAM SortedByCoordinate



