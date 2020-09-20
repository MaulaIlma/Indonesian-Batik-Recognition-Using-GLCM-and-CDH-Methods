function [ CDH] = EF_ComputeCDH( Lab, ColorBin, EdgeBin, D, Lab_param,...
    Edge_param)
%EF_ComputeCDH_Color Summary of this function goes here
%   Detailed explanation goes here
[height, width, dim] = size(Lab);

CDH_Color = zeros(1, Lab_param);
CDH_Edge = zeros(1, Edge_param);
for i=1:height
    for j=1:width
        CDH_Color(ColorBin(i,j))=CDH_Color(ColorBin(i,j))+ EF_CalculateCDHXY(i, j, EdgeBin, Lab, width, height, D );
        CDH_Edge(EdgeBin(i,j))=CDH_Edge(EdgeBin(i,j))+ EF_CalculateCDHXY(i, j, ColorBin, Lab, width, height, D );
    end
end
CDH = horzcat(CDH_Color,CDH_Edge);
end
