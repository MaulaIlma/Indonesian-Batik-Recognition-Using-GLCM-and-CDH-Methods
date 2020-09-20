function [ Lab ] = EF_LabMapping( XYZ )
%Konversi ke dimensi warna L*a*b 
%menggunakan persamaan 2.2, 2.3, 2.4 dan 2.5

%parameter persamaan
Xn = 0.950450;
Yn = 1;
Zn = 1.088754;

Lab = zeros(size(XYZ));

Lab(:,1) = EF_funcL(XYZ(:,2)/Yn); %persamaan 2.2
Lab(:,2) = EF_funcA(XYZ(:,1),XYZ(:,2),Xn,Yn); %persamaan 2.4
Lab(:,3) = EF_funcB(XYZ(:,1),XYZ(:,3),Xn,Zn); %persamaan 2.5

end

