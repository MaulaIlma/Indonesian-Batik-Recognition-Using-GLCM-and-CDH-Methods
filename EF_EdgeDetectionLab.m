function [ EdgeBin ] = EF_EdgeDetectionLab( LABImage, interval_number )
%Membentuk 18 orientasi sudut hasil edge detection citra dimensi L*a*b yang
%memiliki pengaruh kuat dalam persepsi citra manusia.
%   Masukan: Citra dimensi warna L*a*b*
%   Luaran: 18 matriks orientasi sudut dengan ukuran lebar x tinggi citra
%   Penjelasan:
%   Deteksi tepi yang dilakukan berdasar pada perubahan kromatik dengan 
%   ruang warna seragam. Langkah: 

%   1. Pembentukan vektor gradien x dan y
    G = EF_GradientVector(LABImage);
    
%   2. Penentuan sudut hasil orientasi tepi
    height = size(LABImage,1);
    width = size(LABImage,2);
    
    EdgeMap = EF_FindEdgeMap(G,height,width);
%   3. Kuantisasi sudut menjadi 18 bin
    EdgeBin = EF_EdgeQuantization(EdgeMap,interval_number);

end
