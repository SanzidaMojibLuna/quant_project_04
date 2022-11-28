function [] = classify_identify(type)

    train_data = load_database(1);
    test_data = load_database(2);
    
    [Y,principle_basis, mean_features] = PCA(train_data,2000);

    [m_test,n_test] = size(test_data);
    test_data = double(test_data);
    
    sub_data = test_data - repmat(mean_features,1,n_test); 
    updated_test_data = principle_basis'*sub_data;

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
        disp('classification accuracy in KNN');
        disp(confidence);

        %KNN identification

        updated_test_data (:,121:n_test) = [];
 
        for i = 1:35
            for k = 1:2
                ideal_test_class((i-1)*2+k,1) = i; 
            end
        end
        for i = 1:50
            ideal_test_class(70+i,1) = 36;
        end
        for i = 1:35
            for k = 1:8
                ideal_train_class((i-1)*8+k,1) = i; 
            end
        end

        %disp(size(ideal_class02));
        [idx, D] = knnsearch (Y', updated_test_data');
        %disp(idx);
        class_02 = ideal_train_class(idx);
        for i = 1:120
            if D(i) > mean_D
                class_02(i) = 36;
            end
        end
        %disp(class_02);
        sum = 0;
        for i = 1:120
            if ideal_test_class(i) == class_02(i)
                sum = sum + 1;
            end
        end
        confidence = sum / 120;
        disp('identification accuracy in KNN');
        disp(confidence);
        
    end
                       
        
end



