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
    
    --samplesheet           Path to sample sheet
    
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

////////////////////////////////////////////////////
/* --           RUN MAIN WORKFLOW              -- */
////////////////////////////////////////////////////

// Full
workflow {
    include { Processing } from './modules/main_workflows/processing'
    Processing()
}