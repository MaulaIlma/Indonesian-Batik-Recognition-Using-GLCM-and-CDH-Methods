function [ result ] = EF_funcB( X, Z, Xn, Zn )
%FUNCB Penjelasan singkat:
%   Fungsi untuk mendapatkan nilai b* dari dimensi L*a*b* 
%       (paper Liu, Yang, persamaan 3)
%   Penjelasan detail:
%       Transformasi hasil konversi pemetaan koordinat non-linear XYZ
%       untuk mendapatkan nilai b* di suatu titik citra
%   Masukan:
%   X: nilai X pada matriks XYZ hasil transformasi dari RGB
%   Z: nilai Z pada matriks XYZ hasil transformasi dari RGB
%   Xn: nilai konstan Xn untuk = 0.950450 iluminansi (titik putih rujukan) D65
%   Zn: nilai konstan Zn untuk = 1.088754 iluminansi (titik putih rujukan) D65
%   Luaran:
%   result: nilai b*
     result = 200 * (EF_funcAB_base(X/Xn)-EF_funcAB_base(Z/Zn));
end

