function [ Combine_sim_mat ] = Combine_sim( sim_mat_01, name_list_01, sim_mat_02, name_list_02,w ) 

    Combine_sim_mat=sim_mat_01;
    [~,common_idx1]=intersect( name_list_01, name_list_02);
    common_sim_a=sim_mat_01(common_idx1,common_idx1);
    [~,common_idx2]=intersect( name_list_02, name_list_01);
    common_sim_b=sim_mat_02(common_idx2,common_idx2);
    common_mat=w*common_sim_a+(1-w)*common_sim_b;

    Combine_sim_mat(common_idx1,common_idx1)=common_mat;   
    
end

