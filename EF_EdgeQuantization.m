function [ EdgeBin ] = EF_EdgeQuantization( EdgeMap, numBin )
%EF_EDGEBINNING Summary of this function goes here
%   Detailed explanation goes here

% [height, width] = size(EdgeMap);
% 
% EdgeBin = zeros(height, width);
% 
% for i=1:height
%     for j=1:height
%         interval = 360/numBin;
%         if EdgeMap(i,j) == 0
%             EdgeBin(i,j)=1;
%         else
%             EdgeBin(i,j) = ceil(EdgeMap(i,j)/interval);
%         end
%     end
% end

EdgeBin = ceil(EdgeMap(:,:)./(360/numBin));
EdgeBin(EdgeMap==0)=1;


end
