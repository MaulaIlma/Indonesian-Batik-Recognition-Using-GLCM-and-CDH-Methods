function [Lab] = EF_LabConv2( citra)
%LABCONV konversi citra RGB ke L*a*b*
%   Masukan: Citra batik dalam dimensi RGB
%   Luaran: Citra batik dalam dimensi warna L*a*b*
%   Proses: Konversi dengan perkalian matriks

I= im2double(citra);

A = [0.412453 0.357580 0.180423;
    0.212671 0.715160 0.072169;
    0.019334 0.119193 0.950227];

[height, width, dim] = size(I);

XYZ=zeros(height,width,3);
buffer = zeros(3,1);
for i=1:height
     for j=1:width
         buffer(1) = I(i,j,1);
         buffer(2) = I(i,j,2);
         buffer(3) = I(i,j,3);
         XYZ(i,j,:) = EF_cross_3x3_3x1(A,buffer);
     end
end

Lab = EF_LabMapping(XYZ);

end

