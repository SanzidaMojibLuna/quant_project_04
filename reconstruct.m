function [] = reconstruct()

    data = load_database(1);
    i = 1;
	figure
    for k = [1,10,50,100,200,500,1000,2000]
        [Y,principle_basis, mean_features] = PCA(data,k);
        [p,n] = size (Y);
        image = Y' * principle_basis';
        image = image + repmat(mean_features,1,n)';
        subplot(2,4,i), imshow(reshape(image(30,:),[112,92]),[])
        t = k + "th Eigen Vectors";
        title (t)
        i = i+1;
    end
set(gcf, 'PaperPosition', [0 0 5 5]); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [5 5]);
saveas(gcf, 'figures/reconstruct.pdf')
end

