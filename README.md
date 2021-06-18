# Illumina-ShotgunQuant
![GitHub last commit](https://img.shields.io/github/last-commit/alemenze/Illumina-ShotgunQuant)
[![Nextflow](https://img.shields.io/badge/nextflow%20DSL2-%E2%89%A520.11.0--edge-23aa62.svg?labelColor=000000)](https://www.nextflow.io/)
[![run with docker](https://img.shields.io/badge/run%20with-docker-0db7ed?labelColor=000000&logo=docker)](https://www.docker.com/)
[![run with singularity](https://img.shields.io/badge/run%20with-singularity-1d355c.svg?labelColor=000000)](https://sylabs.io/docs/)
[![run with slurm](https://img.shields.io/badge/run%20with-slurm-ff4d4d.svg?labelColor=000000)](https://slurm.schedmd.com/)

## Description:
This workflow is designed to provide quality checks, trimming, and Kraken/bracken quantification of shotgun metagenomics reads. 

## Summary Features:
- [FASTQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) quality control
- Read trimming for low quality or primer contaminant regions with [trimgalore](https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/)
- Read quantification to associated database using [Kraken2](https://ccb.jhu.edu/software/kraken2/)

## Example Commands:
### Slurm HPC execution in background
```
nohup ./nextflow -bg run alemenze/Illumina-ShotgunQuant --samplesheet sample_metadata.csv -profile slurm > stdout.txt
```
### Local execution with database and taxonomic rank change
```
./nextflow run alemenze/Illumina-ShotgunQuant --samplesheet sample_metadata.csv -profile docker --kraken_db ./db_dir/minikraken2_v2_8GB_201904.tgz --kraken_tax_level='F'
```