#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

////////////////////////////////////////////////////
/* --              Parameter setup             -- */
////////////////////////////////////////////////////

if (params.samplesheet) {file(params.samplesheet, checkIfExists: true)} else { exit 1, 'Samplesheet file not specified!'}

Channel
    .fromPath(params.samplesheet)
    .splitCsv(header:true)
    .map{ row -> tuple(row.sample_id, file(row.read1), file(row.read2))}
    .set { sample_reads }

////////////////////////////////////////////////////
/* --              IMPORT MODULES              -- */
////////////////////////////////////////////////////

include { fastqc } from '../tools/fastqc/fastqc'
include { trimgalore } from '../tools/trimgalore/trimgalore'
include { multiqc } from '../tools/multiqc/multiqc'
include { Kraken } from '../subworkflows/kraken'

////////////////////////////////////////////////////
/* --           RUN MAIN WORKFLOW              -- */
////////////////////////////////////////////////////

workflow Processing {
    
    fastqc(
        sample_reads
    )

    trimgalore(
        sample_reads
    )

    Kraken(
        trimgalore.out.reads,
        'Kraken'
    )

    multiqc(
        fastqc.out.zip.collect{ it[1] },
        trimgalore.out.zip.collect{ it[1] },
        trimgalore.out.log.collect{ it[1] },
        Kraken.out.krakenreport.collect{ it[1] }
    )

} 
