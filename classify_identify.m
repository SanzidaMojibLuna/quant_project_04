function [class_01,class_02] = classify_identify(type)


    train_data = load_database(1);
    test_data = load_database(2);
    [Y,principle_basis, mean_features] = PCA(train_data,2000);

    [m_test,n_test] = size(test_data);
    test_data = double(test_data);
    
    sub_data = test_data - repmat(mean_features,1,n_test); 
    updated_test_data = principle_basis'*sub_data;

    if type ==1 %KMeans

        class_01 = kmeans (updated_test_data', 2);

        updated_test_data (:,121:130) = [];
        class_02 = kmeans (updated_test_data', 40);
        
                       
    end
        
end



