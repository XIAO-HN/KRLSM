function [ rank_result ] = Rank_miRNAs( result,md_adjmat,miRNAs,diseases )

    [rows,cols]=size(md_adjmat);
    num_ones=zeros(cols,1);
    for i=1:cols
       num_ones(i,1)=nnz(md_adjmat(:,i)); 
    end
    num=rows-min(num_ones);
    rank_result=cell(num+1,cols);  
    for i=1:cols
       idx=find(md_adjmat(:,i));  
       [~,idx_sort]=sort(result(:,i),'descend');            
       for j=1:length(idx)  
          del_idx= (idx(j,1)==idx_sort);
          idx_sort(del_idx,:)=[];
       end
       rank_result(1,i)=diseases(i,1);  
       for k=1:length(idx_sort)
          rank_result(k+1,i)=miRNAs(idx_sort(k,1)); 
       end
        
    end

end

