### Before runing the PSMC we have to remove the Sex Chromosome ##
cut -f1 dolphin_chr.fa.fai
grep "NC_133428.1_RaGOO" dolphin_chr.fa.fai
tmux new -s psmc_grd ##
grep "^NC_" dolphin_chr.fa.fai | cut -f1 | grep -v "NC_047055.1_RaGOO" > autosomes.list
cat autosomes.list
samtools view \
-b \
DP_1.dedup.bam \
$(cat autosomes.list) \
-o DP_1.psmc.bam

### Indexing psms.bam ###
samtools index DP_1.psmc.bam

### Verification of Index ###
ls -lh DP_1.psmc.bam*

samtools depth -a DP_1.psmc.bam | \
awk '{sum+=$3; n++} END {print sum/n}'

### Variant Calling ###
bcftools mpileup \
-f dolphin_chr.fa \
DP_1.psmc.bam | \
bcftools call -c -Ov -o DP_1.raw.vcf

### Generate Consensus FASTQ ###
vcfutils.pl vcf2fq -d 10 -D 100 DP_1.raw.vcf > DP_1.consensus.fq

### Create PSMC Input ###
fq2psmcfa DP_1.consensus.fq > DP_1.psmcfa

#### Run PSMC ###
psmc \
-N25 \
-t15 \
-r5 \
-p "4+25*2+4+6" \
-o DP_1.psmc \
DP_1.psmcfa

### Bootstrap ###
splitfa DP_1.psmcfa > DP_1.split.psmcfa

### Plot###
psmc_plot.pl DP_1_plot DP_1.psmc
