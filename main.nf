#!/usr/bin/env nextflow
/*
                              (╯°□°)╯︵ ┻━┻

========================================================================================
                            Shotgun Quantification workflow
========================================================================================
                  https://github.com/alemenze/Illumina-ShotgunQuant
*/

nextflow.enable.dsl = 2

def helpMessage(){
    log.info"""

    Usage:
        
        nextflow run alemenze/Illumina-ShotgunQuant \
        --samplesheet samplesheet.csv \
        -profile singulariy
    
    Require Arguments:
        --samplesheet           Path to sample sheet
        -profile                Currently available for docker (local execution), singularity (HPC local execution), and slurm (HPC multi node execution)
    
    Optional:
        --kraken_db             Path to the kraken database. Default: "s3://genome-idx/kraken/k2_standard_20201202.tar.gz"
        --kraken_tax_level      Selects the taxonomic rank for which Kraken is calling reads to. Options include each taxonomic rank as a single letter (ie "S" for species). Default: "S"
        --outdir                Sets output directory. Default: ./results
        --node_partition        For HPC multi node execution, sets which partition to use. Default: "main"

    
    """

}

// Show help message
if (params.help) {
    helpMessage()
    exit 0
}

////////////////////////////////////////////////////
/* --              Parameter setup             -- */
////////////////////////////////////////////////////

////////////////////////////////////////////////////
/* --              IMPORT MODULES              -- */
////////////////////////////////////////////////////
include { Processing } from './modules/main_workflows/processing'
////////////////////////////////////////////////////
/* --           RUN MAIN WORKFLOW              -- */
////////////////////////////////////////////////////

// Full
workflow {
    
    Processing()
}
