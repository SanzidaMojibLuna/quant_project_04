function [Y,principle_basis, mean_features] = PCA(data,no_of_vec) 
       
    data = double(data);
    [m,n] = size(data); 
    mean_features = mean(data,2); 
    sub_data = data - repmat(mean_features,1,n);  
    cov_data = sub_data./(n-1);        
    [principle_basis,S,V] = svd(cov_data);
    principle_basis = principle_basis(:,1:no_of_vec);
    Y = principle_basis'*sub_data;
    
end

