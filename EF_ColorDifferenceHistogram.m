function [ CDH ] = EF_ColorDifferenceHistogram( namafile, param_edge,...
    param_L, param_A, param_B )
%COLORDIFFERENCEHISTOGRAM Summary of this function goes here
%   Detailed explanation goes here

Lab = EF_LabConv(namafile);
EdgeBin = EF_EdgeDetectionLab(Lab, param_edge);
ColorBin = EF_ColorQuantization(Lab, param_L, param_A, param_B);
CDH = EF_ComputeCDH(Lab, ColorBin, EdgeBin, 1,...
      param_L* param_A* param_B,param_edge);
end

