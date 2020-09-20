function [ res ] = EF_GradientVectorCalc( dLab1, dLab2 )
%GRADIENTVECTORCALC Perkalian titik dari vektor gradien
%   Masukan:    dLab1: Vektor gradien 1
%               dLab2: Vektor gradien 2
%   Luaran:     res: Hasil perkalian titik antarvektor gradien
res = dot(dLab1,dLab2);

end
