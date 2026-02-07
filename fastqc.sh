#!/bin/bash
#SBATCH --job-name=fastqc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=2G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/gang/logs/fastqc.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/gang/logs/fastqc.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12416922@unet.univie.ac.at

### LOAD FASTQC

module load FastQC

### SET DIRECTORIES

outDir="/lisc/data/scratch/course/2025w300106/gang/results/fastqc"
readsDir="/lisc/data/scratch/course/2025w300106/gang"


### EXECUTION OF FASTQC AND GIVE REPORT AS HTML FILE

echo "Started job at $(date)"
mkdir $outDir
fastqc -t 2 -o $outDir $readsDir/SRR29120068_1.fastq $readsDir/SRR29120068_2.fastq 
echo "Job finished at $(date)"

