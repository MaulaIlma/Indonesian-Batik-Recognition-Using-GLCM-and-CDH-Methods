load('ekstrasiFiturCDH2.mat');
%%
load('ekstrasiFiturGlcm2.mat');
concatGLCMCDH2=EkstrasiCDH2;
 %%
%  M1 = {'ekstrasiFiturCDH1.mat'};
%  M2 = {'ekstrasiFiturGlcm1.mat'};
%  A1 = {M1,M2};
% Cvert = cat(1,A1{:});

for i=1:size(concatGLCMCDH2,1)
    k=109;
    for j=1:size(featuresGLCM2(i,1).Contrast,2)
        concatGLCMCDH2(i,k)=featuresGLCM2(i,1).Contrast(1,j);
        k=k+1;
    end
    
    k=113;
    for j=1:size(featuresGLCM2(i,1).Contrast,2)
        concatGLCMCDH2(i,k)=featuresGLCM2(i,1).Correlation(1,j);
        k=k+1;
    end
    
    k=117;
    for j=1:size(featuresGLCM2(i,1).Contrast,2)
        concatGLCMCDH2(i,k)=featuresGLCM2(i,1).Energy(1,j);
        k=k+1;
    end
    
    k=121;
    for j=1:size(featuresGLCM2(i,1).Contrast,2)
        concatGLCMCDH2(i,k)=featuresGLCM2(i,1).Homogeneity(1,j);
        k=k+1;
    end
end
    
   
%end

% v = concatGLCMCDH2(:);

extracted_feature2 = [concatGLCMCDH2 label2];

save('extracted_feature2.mat','extracted_feature2');
