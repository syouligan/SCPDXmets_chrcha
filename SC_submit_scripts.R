#!/bin/bash

# Load R 3.6.0
module load briglo/R/3.6.0

# Set paths
projectID='SCmets_chrcha'
subprojectID='SCPDXmets_chrcha'
resultsPath='/share/ScratchGeneral/scoyou/sarah_projects/'
scriptsPath='/home/scoyou/sarah_projects/'

# Make log path
logDir=$scriptsPath$projectID'/'$subprojectID'_scripts/logs'
mkdir -p $logDir

qsub -P OsteoporosisandTranslationalResearch -N 'Determine_thresholds_'$subprojectID -b y -wd $logDir -j y -R y -l mem_requested=8G -pe smp 32 -V -m bea -M s.youlten@garvan.org.au R CMD BATCH $scriptsPath$projectID'/'$subprojectID'_scripts/Determine_prefiltering_thresholds.R'
#qsub -P OsteoporosisandTranslationalResearch -N 'Prefiltering_'$subprojectID -b y -wd $logDir -j y -R y -l mem_requested=8G -pe smp 32 -V -m bea -M s.youlten@garvan.org.au R CMD BATCH $scriptsPath$projectID'/'$subprojectID'_scripts/Prefiltering_whole_experiment.R'
#qsub -P OsteoporosisandTranslationalResearch -N 'NormyCluster_'$subprojectID -b y -hold_jid 'Prefiltering_'$subprojectID -wd $logDir -j y -R y -l mem_requested=16G -pe smp 32 -V -m bea -M s.youlten@garvan.org.au R CMD BATCH $scriptsPath$projectID'/'$subprojectID'_scripts/Whole_experiment_batch_correction_and_clustering.R'
#qsub -P OsteoporosisandTranslationalResearch -N 'Cell_Cycle_'$subprojectID -b y -hold_jid 'NormyCluster_'$subprojectID -wd $logDir -j y -R y -l mem_requested=16G -pe smp 32 -V -m bea -M s.youlten@garvan.org.au R CMD BATCH $scriptsPath$projectID'/'$subprojectID'_scripts/Whole_experiment_cell_cycle_annotation.R'
#qsub -P OsteoporosisandTranslationalResearch -N 'WithinTissue_'$subprojectID -b y -hold_jid 'Cell_Cycle_'$subprojectID -wd $logDir -j y -R y -l mem_requested=16G -pe smp 32 -V -m bea -M s.youlten@garvan.org.au R CMD BATCH $scriptsPath$projectID'/'$subprojectID'_scripts/Within_tissue_batch_correction_and_clustering.R'
