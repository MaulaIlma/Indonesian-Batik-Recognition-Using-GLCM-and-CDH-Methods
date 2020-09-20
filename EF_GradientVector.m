function [ G ] = EF_GradientVector( LabImage )
%GRADIENTVECTOR  Pembentukan vektor gradien x dan y dari dimensi L*a*b*
%   Masukan: Citra dimensi L*a*b
%   Luaran: 1 array multidimensi: 3 vektor gradien dengan ukuran width
%   x height citra dimensi  L*a*b (hxwx3)
%   Langkah-langkah:
%%  Pembuatan matriks filter sobel x (Sx)
Sx = [-1 -2 -1; 0 0 0; 1 2 1];
%%  Pembuatan matriks filter sobel y (Sy)
Sy = [-1 0 1; -2 0 2; -1 0 1];


%%  Pembuatan matriks dLabx (hxwx3) dan dLaby (hxwx3) untuk menampung
%%  hasil filter sobel terhadap citra L*a*b*
%%      rincian: (:,:,1) untuk dimensi L* (dL*/dx) , (:,:,2) untuk 
%%      dimensi a* (da*/dx), (:,:,3) untuk dimensi b* (db*/dx)
[width, height, dim] = size(LabImage);

%   Pembuatan matriks kumpulan vektor gradian G (gxx, gyy, gxy)
%%  rincian: (:,:,1) untuk gxx, (:,:,2) untuk gyy ,(:,:,3) gxy
G = zeros(width* height, dim);

%%  Pengisian vektor derivatif terhadap x (dL*/dx, da*/dx, db*/dx)
%%%     filtering sobel x terhadap labImage
dLabx = imfilter(LabImage,Sx,0);
%%  Pengisian vektor derivatif terhadap y (dL*/dy, da*/dy, db*/dy)
%%%     filtering sobel y terhadap labImage
dLaby = imfilter(LabImage,Sy,0);
 

% fid = fopen('GradientVector.txt','wt');
% for i=1:height
%     for j=1:width
%     fprintf(fid,'%d %d %s %d %d %d %s %d %d %d\n',i,j,'dLabx',dLabx(i,j,1),dLabx(i,j,2),dLabx(i,j,3),'dLaby',dLaby(i,j,1),dLaby(i,j,2),dLaby(i,j,3)); 
% % %%  Pembangkitan vektor gxx (pers. 8)
% % %%      Menggunakan fungsi perkalian titik matriks dengan parameter tipe
% % %%      data vektor hxwx3 dan hxwx3 (dL*a*b*/dx,dL*a*b*/dx)
%     G(i,j,1) = EF_GradientVectorCalc(dLabx(i,j),dLabx(i,j));
% % %%  Pembangkitan vektor gyy (pers. 9)
% % %%      Menggunakan fungsi perkalian titik matriks dengan parameter tipe
% % %%      data vektor hxwx3 dan vektor hxwx3 (dL*a*b*/dy,dL*a*b*/dy)
%     G(i,j,2) = EF_GradientVectorCalc(dLaby(i,j),dLaby(i,j));
% % %%  Pembangkitan vektor gxx (pers. 10)
% % %%      Menggunakan fungsi perkalian titik matriks dengan parameter tipe
% % %%      data vektor hxwx3 dan vektor hxwx3 (dL*a*b*/dx,dL*a*b*/dy)
%     G(i,j,3) = EF_GradientVectorCalc(dLabx(i,j),dLaby(i,j));
%     end
% end
% fclose(fid);

dLabx = reshape(dLabx,height*width,3);
dLaby = reshape(dLaby,height*width,3);

G(:,1) = dot(dLabx(1:height*width,:)',dLabx(1:height*width,:)');
G(:,2) = dot(dLaby(1:height*width,:)',dLaby(1:height*width,:)');
G(:,3) = dot(dLabx(1:height*width,:)',dLaby(1:height*width,:)');

end
