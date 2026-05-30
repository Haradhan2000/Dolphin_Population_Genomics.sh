### Before runing the PSMC we have to remove the Sex Chromosome ##
cut -f1 dolphin_chr.fa.fai
grep "NC_133428.1_RaGOO" dolphin_chr.fa.fai
