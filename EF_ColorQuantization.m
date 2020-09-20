function [ ColorBin ] = EF_ColorQuantization( Lab, L_bin, a_bin, b_bin )
%EF_COLORQUANTIZATION Summary of this function goes here
%   Rentang nilai L*a*b* hasil konversi dari RGB -> XYZ:
%   L*: [0,100] divided into 10 bins
%   a*: [-86.185, 98.254] divided into 3 bins
%   b*: [-107.863, 94.482] divided into 3 bins
L_Val_Max = 100;
L_Val_Min = 0;
a_Val_Max = 98.254;
a_Val_Min = -86.185;
b_Val_Max = 94.482;
b_Val_Min = -107.863;

L_interval = (L_Val_Max - L_Val_Min)/L_bin;
a_interval = (a_Val_Max - a_Val_Min)/a_bin;
b_interval = (b_Val_Max - b_Val_Min)/b_bin;

% %% Binning
% [height, width, dim] = size(Lab);
% ColorBin = zeros(height,width);
% fid = fopen('ColorQMap.txt','wt');
% for i=1:height
%     for j=1:width
%         L_res = floor((Lab(i,j,1)-L_Val_Min)/L_interval);
%         if L_res == L_bin 
%             L_res = L_bin-1;
%         end
%         a_res = floor((Lab(i,j,2)-a_Val_Min)/a_interval);
%         if a_res == a_bin 
%             a_res = a_bin-1;
%         end
%         b_res = floor((Lab(i,j,3)-b_Val_Min)/b_interval);
%         if b_res == b_bin 
%             b_res = b_bin-1;
%         end
%         ColorBin(i,j) = (L_res * a_bin * b_bin)+ (a_res*b_bin)+b_res;
%         if ColorBin(i,j)>90
%             fprintf(fid,'%d %d %d %d %d %d\n',ColorBin(i,j),i,j,L_res,a_res,b_res );
%         end
%     end
% end
% 
% fclose(fid);
L_res = floor((Lab(:,:,1)-L_Val_Min)/L_interval);
L_res(L_res == L_bin)=L_bin-1;
a_res = floor((Lab(:,:,2)-a_Val_Min)/a_interval);
a_res(a_res == a_bin)=a_bin-1;
b_res = floor((Lab(:,:,3)-b_Val_Min)/b_interval);
b_res(b_res == b_bin)=b_bin-1;

ColorBin = 1 + (L_res .* a_bin .* b_bin)+ (a_res .* b_bin)+b_res;
end
