#!/bin/bash
#SBATCH --job-name=trim
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=50GB
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/gang/logs/trim.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/gang/logs/trim.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12416922@unet.univie.ac.at


### LOAD ENVIRONMENT
module load Trimmomatic
module list

## SET UP DIRECTORIES

wd="/lisc/data/scratch/course/2025w300106/gang"
outDir="$wd/results/trimmomatic"
mkdir -p $outDir

### RUN PAIRED END MODE USING 8 THREADS
### INPUT FASTAQ FILES SRR29120068_1.fastq,SRR29120068_2.fastq AND OUTPUT SRR29_..
### ADAPTER REMOVAL WITH ILLUMINACLIP
### SLIDINGWINDOW: CUTING ONCE WINDOW OF 4 BASES AVERAGE LOWER QUALITY THAN 20
### MINLEN: DROP READS BELOW LENGTH OF 75

trimmomatic PE -threads 8 -summary $outDir/SRR29_summary.txt $wd/SRR29120068_1.fastq $wd/SRR29120068_2.fastq -baseout $outDir/SRR29_ ILLUMINACLIP:/lisc/data/scratch/course/2025w300106/gang/results/fastqc/trim_adapters.fa:2:30:10 SLIDINGWINDOW:4:20 MINLEN:75


