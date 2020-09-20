function [ result ] = EF_cross_3x3_3x1( mat_3x3, mat_3x1 )
%CROSS_3X3_3X1 : Perkalian silang matriks 3x3 dan 3x1
%   Masukan: 
%       matriks 3x3 (mat_3x3)
%       matriks 3x1 (mat_3x1)
%   Luaran:
%       matriks 3x1 (result)
result = zeros(3,1);
for i=1:3
    for j=1:3
        result(i) = result(i) + (mat_3x3(i,j)*mat_3x1(j));
    end
end

end

