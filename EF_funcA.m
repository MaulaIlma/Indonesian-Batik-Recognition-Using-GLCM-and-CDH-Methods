function [ result ] = EF_funcA( X, Y, Xn, Yn )
%FUNCA : Penjelasan singkat:
%   Fungsi untuk mendapatkan nilai a* dari dimensi L*a*b* 
%       (paper Liu, Yang, persamaan 2)
%   Penjelasan detail:
%       Transformasi hasil konversi pemetaan koordinat non-linear XYZ
%       untuk mendapatkan nilai a* di suatu titik citra
%   Masukan:
%   X: nilai X pada matriks XYZ hasil transformasi dari RGB
%   Y: nilai Y pada matriks XYZ hasil transformasi dari RGB
%   Xn: nilai konstan Xn = 0.950450 untuk iluminansi (titik putih rujukan) D65 
%   Yn: nilai konstan Yn = 1 untuk iluminansi (titik putih rujukan) D65
%   Luaran:
%   result: nilai a*
    
    %fungsi EF_funcAB_base(..) merupakan persamaan 2.3
    result = 500 * (EF_funcAB_base(X/Xn)-EF_funcAB_base(Y/Yn));
end

