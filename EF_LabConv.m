function [Lab] = LabConv( citra_batik )
%LABCONV konversi citra RGB ke L*a*b*
%   Masukan: Citra batik dalam dimensi RGB
%   Luaran: Citra batik dalam dimensi warna L*a*b*
%   Proses: Konversi dengan perkalian matriks


I = im2double(citra_batik);

A = [0.412453 0.357580 0.180423;
    0.212671 0.715160 0.072169;
    0.019334 0.119193 0.950227];

[height, width, dim] = size(I);


XYZ=(A*(reshape(I,height*width,dim))')';
Lab = EF_LabMapping(XYZ);
Lab = reshape(Lab,height,width,dim);


end

