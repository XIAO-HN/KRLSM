clear
clc
load Input_data.mat
w=0.8;
v=0.7;
combine_miRNA_sim = Combine_sim( miRNA_sim02,miRNA_list02,miRNA_sim01,miRNA_list01,w );
combine_disease_sim = Combine_sim( disease_sim02,disease_list02,disease_sim01,disease_list01,v ); 

scores = KRLSM(combine_miRNA_sim,combine_disease_sim,md_adjmat02, 1);
[KRLSM_rank] =Rank_miRNAs( scores,md_adjmat02,miRNA_list02,disease_list02 );

Write_file( KRLSM_rank )
clear w v scores