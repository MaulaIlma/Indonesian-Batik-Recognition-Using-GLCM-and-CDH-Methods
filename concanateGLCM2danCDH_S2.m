%% D=1 L =8 A=3 B=3
load('ekstrasiFiturCDH833_2.mat');
%%
load('ekstrasiFiturGlcm2.mat');
concatGLCMCDH_S2=EkstrasiCDH_S2;
 %%
%  M1 = {'ekstrasiFiturCDH1.mat'};
%  M2 = {'ekstrasiFiturGlcm1.mat'};
%  A1 = {M1,M2};
% Cvert = cat(1,A1{:});

for i=1:size(concatGLCMCDH_S2,1)
    k=91;
    for j=1:size(featuresGLCM2(i,1).Contrast,2)
        concatGLCMCDH_S2(i,k)=featuresGLCM2(i,1).Contrast(1,j);
        k=k+1;
    end
    
    k=95;
    for j=1:size(featuresGLCM2(i,1).Contrast,2)
        concatGLCMCDH_S2(i,k)=featuresGLCM2(i,1).Correlation(1,j);
        k=k+1;
    end
    
    k=99;
    for j=1:size(featuresGLCM2(i,1).Contrast,2)
        concatGLCMCDH_S2(i,k)=featuresGLCM2(i,1).Energy(1,j);
        k=k+1;
    end
    
    k=103;
    for j=1:size(featuresGLCM2(i,1).Contrast,2)
        concatGLCMCDH_S2(i,k)=featuresGLCM2(i,1).Homogeneity(1,j);
        k=k+1;
    end
end
    
   
%end

% v = concatGLCMCDH2(:);

extracted_feature_S2 = [concatGLCMCDH_S2 label2];

save('extracted_feature_S2.mat','extracted_feature_S2');
