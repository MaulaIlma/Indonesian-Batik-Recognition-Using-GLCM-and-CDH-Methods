%% D=1 L =8 A=3 B=3
load('ekstrasiFiturCDH833.mat');
%%
load('ekstrasiFiturGlcm1.mat');
concatGLCMCDH_S1=EkstrasiCDH_S1;
 %%
%  M1 = {'ekstrasiFiturCDH1.mat'};
%  M2 = {'ekstrasiFiturGlcm1.mat'};
%  A1 = {M1,M2};
% Cvert = cat(1,A1{:});

for i=1:size(concatGLCMCDH_S1,1)
    k=91;
    for j=1:size(featuresGLCM1(i,1).Contrast,2)
        concatGLCMCDH_S1(i,k)=featuresGLCM1(i,1).Contrast(1,j);
        k=k+1;
    end
    
    k=95;
    for j=1:size(featuresGLCM1(i,1).Contrast,2)
        concatGLCMCDH_S1(i,k)=featuresGLCM1(i,1).Correlation(1,j);
        k=k+1;
    end
    
    k=99;
    for j=1:size(featuresGLCM1(i,1).Contrast,2)
        concatGLCMCDH_S1(i,k)=featuresGLCM1(i,1).Energy(1,j);
        k=k+1;
    end
    
    k=103;
    for j=1:size(featuresGLCM1(i,1).Contrast,2)
        concatGLCMCDH_S1(i,k)=featuresGLCM1(i,1).Homogeneity(1,j);
        k=k+1;
    end
end
    
   
%end

% v = concatGLCMCDH2(:);

extracted_feature_S1 = [concatGLCMCDH_S1 label];

save('extracted_feature_S1.mat','extracted_feature_S1');
