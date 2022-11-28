function output_value = load_database(train_or_test)
    path = 'att_faces/';
    cd(path);
  
    if(train_or_test == 1)
        all_Images = zeros(10304,35);
        for i=1:35
            cd(strcat('s',num2str(i)));
            for j=1:8
                image_Container = imread(strcat(num2str(j),'.pgm'));
                all_Images(:,(i-1)*8+j)=reshape(image_Container,size(image_Container,1)*size(image_Container,2),1);
            end
            %disp('loading train data');
            cd ..
        end
 
    else
        all_Images = zeros(10304,40);
        for i=1:35
            cd(strcat('s',num2str(i)));
            for j=9:10
                image_Container = imread(strcat(num2str(j),'.pgm'));
                all_Images(:,(i-1)*2+j)=reshape(image_Container,size(image_Container,1)*size(image_Container,2),1);
            end
            %disp('loading test data from 1 to 35');
            cd ..
        end
        for i=36:40
            cd(strcat('s',num2str(i)));
            for j=1:10
                image_Container = imread(strcat(num2str(j),'.pgm'));
                all_Images(:,(i-1)*5+j)=reshape(image_Container,size(image_Container,1)*size(image_Container,2),1);
            end
            %disp('loading test data from 36 to 40');
            cd ..
        end
        
    end
    numeric_Image = uint8(all_Images);
    output_value = numeric_Image;
    cd ..
    
    %face_recongnition(numeric_Image)
    %disp (numeric_Image);
end

