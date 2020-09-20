
load('ekstrasiFiturCDH1.mat');
%%
load('ekstrasiFiturGlcm1.mat');

concatGLCMCDH1=EkstrasiCDH1;
 %%
%  M1 = {'ekstrasiFiturCDH1.mat'};
%  M2 = {'ekstrasiFiturGlcm1.mat'};
%  A1 = {M1,M2};
% Cvert = cat(1,A1{:});

for i=1:size(concatGLCMCDH1,1)
    k=109;
    for j=1:size(featuresGLCM1(i,1).Contrast,2)
        concatGLCMCDH1(i,k)=featuresGLCM1(i,1).Contrast(1,j);
        k=k+1;
    end
    
    k=113;
    for j=1:size(featuresGLCM1(i,1).Contrast,2)
        concatGLCMCDH1(i,k)=featuresGLCM1(i,1).Correlation(1,j);
        k=k+1;
    end
    
    k=117;
    for j=1:size(featuresGLCM1(i,1).Contrast,2)
        concatGLCMCDH1(i,k)=featuresGLCM1(i,1).Energy(1,j);
        k=k+1;
    end
    
    k=121;
    for j=1:size(featuresGLCM1(i,1).Contrast,2)
        concatGLCMCDH1(i,k)=featuresGLCM1(i,1).Homogeneity(1,j);
        k=k+1;
    end
end
    
   
%end

% v = concatGLCMCDH2(:);

extracted_feature1 = [concatGLCMCDH1 label];

save('extracted_feature1.mat','extracted_feature1');
