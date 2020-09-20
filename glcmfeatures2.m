load (fullfile('Train2','Train2.mat'));
%%
offsets=[0 1; -1 1;-1 0;-1 -1];
for i = 1:size(imgResize,1)
    grayImage = rgb2gray(imgResize{i});
    %     glcmfeature2{i,:} = glcm2(grayImage);
    [glcms,SI] = graycomatrix(grayImage,'Offset',offsets);
    stats=graycoprops(glcms,{'All'});
    glcmfeatureeks2{i,:}=stats;
    %imshow(rescale(SI))
    listGLCM{i,:}=SI;
    disp(['GLCM features from image - ', num2str(i) ,' successfully extracted']);
end
featuresGLCM2 = cell2mat(glcmfeatureeks2);
%%
 save('ekstrasiFiturGlcm2.mat','featuresGLCM2','label2');