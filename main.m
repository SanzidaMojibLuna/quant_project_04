disp('Generating Eigenfaces')
eigenface()
disp('Reconstructing from Eigenfaces')
reconstruct()
dim_reduc = 'PCA';
fprintf('Classification and identification with KNN and %s\n', dim_reduc)
classify_identify(2, dim_reduc)
dim_reduc = 'tSNE';
fprintf('Classification and identification with KNN and %s\n', dim_reduc)
classify_identify(2, dim_reduc);	

