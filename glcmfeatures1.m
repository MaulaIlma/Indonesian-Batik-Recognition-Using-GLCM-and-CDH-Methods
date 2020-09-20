load (fullfile('Train','Train.mat'));
%%
offsets=[0 1; -1 1;-1 0;-1 -1];
for i = 1:size(imgResize,1)
    grayImage = rgb2gray(imgResize{i});
%     glcm =graycomatrix(grayImage,'Offset',[0 pixel_dist; -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);
%     [glcmfeature,GlcmImage] = graycoprops(glcm,{'All'});
%     [ G0, G45, G90, G135 ] =glcm2(grayImage,'Offset', G0, G45, G90, G135 );
    [glcms,SI] = graycomatrix(grayImage,'Offset',offsets);
    stats=graycoprops(glcms,{'All'});
    glcmfeatureeks1{i,:}=stats;
    %imshow(rescale(SI))
    listGLCM{i,:}=SI;
    disp(['GLCM features from image - ', num2str(i) ,' successfully extracted']);
end
featuresGLCM1 = cell2mat(glcmfeatureeks1);
% ekstrasifitur=[features label];
% %%
 save('ekstrasiFiturGlcm1.mat','featuresGLCM1','label');


