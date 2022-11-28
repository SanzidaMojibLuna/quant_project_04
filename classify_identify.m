function [class_01,class_02] = classify_identify(type, dim_reduction)


    train_data = load_database(1);
    test_data = load_database(2);
    if dim_reduction == 'PCA'
        [Y,principle_basis, mean_features] = PCA(train_data,2000);
    
        [m_test,n_test] = size(test_data);
        test_data = double(test_data);
        
        sub_data = test_data - repmat(mean_features,1,n_test); 
        updated_test_data = principle_basis'*sub_data;
    else
        updated_test_data = tsne(double(test_data)')';
    end

    if type == 1 
        
        %KMeans classification

        class_01 = kmeans (updated_test_data', 2);
        
        %KMeans identification

        updated_test_data (:,121:m_test) = [];
        class_02 = kmeans (updated_test_data', 40);

    elseif type == 2 
        
        %KNN classification

        [idx, D] = knnsearch (Y', updated_test_data');
        mean_D = mean(D);
        for i = 1:n_test
            if D(i) < mean_D
                class_01(i) = 1;
            else
                class_01(i) = 2;
            end
        end
        ideal_class01(1:120) = 1;
        ideal_class01(121:n_test) = 2;
        sum = 0;
        for i = 1:n_test
            if ideal_class01(i) == class_01(i)
                sum = sum + 1;
            end
        end
        confidence = sum / n_test;
        disp(confidence);

        %KNN identification

        updated_test_data (:,121:n_test) = [];
        [idx, D] = knnsearch (Y', updated_test_data');
        disp(idx');
    end
                       
        
end



