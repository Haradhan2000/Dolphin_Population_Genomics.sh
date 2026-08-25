######################################################
1. Transferring files from server to PC
#######################################################
scp "haradhan@10.58.98.100:/home/haradhan/Historic_wgs_dolphin/03_trimmed/fastqc_report/multiqc_trimming.html" "D:\PhD Haradhan\Result_Image_Graphs_Map\NGS_Data_Dolphins\Output_Files\Historic_wgs_outputs\multiqc_trimming.html"
#scp #"haradhan@10.58.98.100: file path" "destination path" ( for file path do pwd)
#######################################################
2. Transferring files from server to NAS drive
#######################################################
# Map the NAS as Y:
net use Y: "\\10.58.98.14\datastorage\Haradhan\Modern_wgs_dolphins"
# Test-Path "Y:\" ( It will show True)
scp "haradhan@10.58.98.100:/home/haradhan/Modern_wgs_dolphin/01_raw_data/IRR_5_S179_L006_R1_001.fastq.gz" "haradhan@10.58.98.100:/home/haradhan/Modern_wgs_dolphin/01_raw_data/IRR_5_S179_L006_R2_001.fastq.gz" "Y:\"
########################################################
2. Delete the Map, to access it form Run prompt
##########################################################
net use Y: /delete
#########################################################
