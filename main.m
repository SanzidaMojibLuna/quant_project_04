%disp('Generating Eigenfaces')
%eigenface()
%disp('Reconstructing from Eigenfaces')
%reconstruct()
%disp('Classification and identification with KMeans')
%[class_01,class_02] = classify_identify(1,1);
%[m,n] = size(class_01);
%x = 1:m;
%y = class_01;
%plot(y,x,'*')
%xlim([0 3])
%ylim([0 140])
%disp(class_02');
dim_reduc = 'tSNE';
fprintf('Classification and identification with KNN and %s', dim_reduc)
[class_01,class_02] = classify_identify(2, dim_reduc);	