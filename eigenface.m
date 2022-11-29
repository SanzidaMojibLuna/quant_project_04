function eigenface()

data = load_database(1);
[Y,principle_basis, mean_features] = PCA(data,2000);

i = 1;
for k = [1,2,10,50,150,500,1000,2000]
    subplot(2,4,i), imshow(reshape(principle_basis(:,k),[112,92]),[])
    t = k+"th";
    title (t)
    i = i+1;
end
%figure
%plot(x_axis,y_axis);
set(gcf, 'PaperPosition', [0 0 5 5]); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [5 5]);
saveas(gcf, 'figures/faces.pdf')
end


