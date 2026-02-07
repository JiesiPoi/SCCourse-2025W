#!/bin/bash
#SBATCH --job-name=EGGNOG
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/gang/logs/CELL.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/gang/logs/CELL.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12416922@unet.univie.ac.at

### LOAD ENVIRONMENT

module load CellRanger
module list

### WORKING DIRECTORIES AND NAMES

wd="/lisc/data/scratch/course/2025w300106"
index="${wd}/common/NV2_fluo"
fastq_dir="${wd}/common/blastula.12h/run1,${wd}/common/blastula.12h/run2,${wd}/common/blastula.12h/run3"
sample="89085"
od="${wd}/gang/results/cellranger"
id="blastula.12h"

### CREATE OUTPUT FOLDER AND MOVE INTO THAT

mkdir -p ${od}
cd ${od}

### EXECUTION WITH 16 CPU THREADS
### READS FASTQ FILES WITH SAMPLE ID 89085
### KEEPS TOP 10000 CELLS AND SKIPPES CLUSTERING AND MORE 
### GENERATES GENES X CELL MATRIX (NO BAM FILE)

cellranger count --transcriptome $index --fastqs $fastq_dir --sample $sample --force-cells 10000 --nosecondary --localcores 16 --id $id --create-bam false
