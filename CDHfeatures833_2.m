
load (fullfile('Train2','Train2.mat'));
%%

for i = 1:size(imgResize,1)
    LABImage = EF_LabConv(imgResize{i});
    
    %% Quantitize Edge Detection
    interval_number = 18; %kuantisasi interval number menjadi 18 bin
    EdgeBin= EF_EdgeDetectionLab(LABImage, interval_number);

    %% Color Quantitation
    
    % parameter kuantisasi bin warna pada image L*a*b
    L_bin = 8;
    a_bin = 3;
    b_bin = 3;
    
    ColorBin = EF_ColorQuantization(LABImage, L_bin, a_bin, b_bin);
    
    %% Color Difference Histogram
    param_L = L_bin;
    param_A = a_bin;
    param_B = b_bin;
    
    param_edge = interval_number;
    
    CDH = EF_ComputeCDH(LABImage, ColorBin, EdgeBin, 1,...
        param_L* param_A* param_B,param_edge);
    EkstrasiCDH_S2(i,:)=CDH;
    
    disp(['CDH features from image - ', num2str(i) ,' successfully extracted']);
end
% featureCDH1 = cell2mat(EkstrasiCDH);
% % ekstrasifitur=[features label];
% % %%
save('ekstrasiFiturCDH833_2.mat','EkstrasiCDH_S2','label2');
