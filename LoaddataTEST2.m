clear;
clc;
close all;

listSubFolder = dir('Test2\**\*.jpg');
imageData =cell(456,4);
imgResize=cell(456,4);
label2 = zeros(size(listSubFolder,1),1);


for i = 1:size(listSubFolder,1)
    imageData{i} = imread(fullfile(listSubFolder(i).folder, listSubFolder(i). name));
    imgResize{i} = imresize(imageData{i}, [128,128]);
    name = strsplit(listSubFolder(i). name, '-');
    if (isequal(name{2}, 'Anyaman_Bambu'))
        % assign label 1 fof Anyaman_Bambu
        label2(i,:) = 1;
    elseif (isequal(name{2}, 'Ayam_Alas'))
        % assign label 2 for Ayam_Alas
        label2(i,:) = 2;
    elseif (isequal(name{2}, 'Balimbing_Seling_Ombak_Banyu'))
        % assign label 3 for Balimbing_Seling_Ombak_Banyu
        label2(i,:) = 3;
    elseif (isequal(name{2}, 'Bango_Rawa'))
        % assign label 4 for Bango Rawa
        label2(i,:) = 4;
    elseif (isequal(name{2}, 'Banji_Tepak'))
        % assign label 5 for Banji_Tepak
        label2(i,:) = 5;
    elseif (isequal(name{2}, 'Banyak_Ngantrang'))
        % assign label 6 for Banyak_Ngantrang
        label2(i,:) = 6;
    elseif (isequal(name{2}, 'Binari_Kawung'))
        % assign label 7 for Binari_Kawung
        label2(i,:) = 7;
    elseif (isequal(name{2}, 'Bouroq'))
        % assign label 8 for Bouroq
        label2(i,:) = 8;
    elseif (isequal(name{2}, 'Buah_Maja'))
        % assign label 9 for Buah_Maja
        label2(i,:) = 9;
    elseif (isequal(name{2}, 'Buket_Teratai'))
        % assign label 10 for Buket_Teratai
        label2(i,:) = 10;
    elseif (isequal(name{2}, 'Buku_Tiwu'))
        % assign label 11 for Buku_Tiwu
        label2(i,:) = 11;
    elseif (isequal(name{2}, 'Ciawi_Tali'))
        % assign label 12 for Ciawi_Tali
        label2(i,:) = 12;
    elseif (isequal(name{2}, 'Ciung_Wanara'))
        % assign label 13 for Ciung Wanara
        label2(i,:) = 13;
    elseif (isequal(name{2}, 'Cupat_Manggu'))
        % assign label 14 for Cupat_Manggu
        label2(i,:) = 14;
    elseif (isequal(name{2}, 'Cupat_Manggu_Kuning'))
        % assign label 15 for Cupat_Manggu_Kuning
        label2(i,:) = 15;
    elseif (isequal(name{2}, 'Cupat_Manggu_Putih'))
        % assign label 16 for Cupat_Manggu_Putih
        label2(i,:) = 16;
    elseif (isequal(name{2}, 'Curug_Kerikil'))
        % assign label 17 for Curug_Kerikil
        label2(i,:) = 17;
    elseif (isequal(name{2}, 'Curug_Penganten'))
        % assign label 18 for Curug_Penganten
        label2(i,:) = 18;
    elseif (isequal(name{2}, 'Daun_Sampeu_Pinuh'))
        % assign label 19 for Daun_Sampeu_Pinuh
        label2(i,:) = 19;
    elseif (isequal(name{2}, 'Daun_Taleus'))
        % assign label 20 for Daun_Taleus
        label2(i,:) = 20;
    elseif (isequal(name{2}, 'Daun_Taleus_Hitam'))
        % assign label 21 for Daun_Taleus_Hitam
        label2(i,:) = 21;
    elseif (isequal(name{2}, 'Doblang'))
        % assign label 22 for Doblang
        label2(i,:) = 22;
    elseif (isequal(name{2}, 'Drintin'))
        % assign label 23 for Drintin
        label2(i,:) = 23;
    elseif (isequal(name{2}, 'Gaganjar'))
        % assign label 24 for Gaganjar
        label2(i,:) = 24;
    elseif (isequal(name{2}, 'Gaganjar_Merah'))
        % assign label 25 for Gaganjar_Merah
        label2(i,:) = 25;
    elseif (isequal(name{2}, 'Gajah_Payung'))
        % assign label 26 for Gajah_Payung
        label2(i,:) = 26;
    elseif (isequal(name{2}, 'Gambir_Saketi'))
        % assign label 27 for Gambir_Saketi
        label2(i,:) = 27;
    elseif (isequal(name{2}, 'Gambir_Saketi_Daun'))
        % assign label 28 for Gambir_Saketi_Daun
        label2(i,:) = 28;
    elseif (isequal(name{2}, 'Ganggengan'))
        % assign label 29 for Ganggengan
        label2(i,:) = 29;
    elseif (isequal(name{2}, 'Gentongan'))
        % assign label 30 for Gentongan
        label2(i,:) = 30;
    elseif (isequal(name{2}, 'Hihinggulan_Rama'))
        % assign label 31 for Hihinggulan_Rama
        label2(i,:) = 31;
    elseif (isequal(name{2}, 'Hihinggulan_Ratu_Binokasih'))
        % assign label 32 for Hihinggulan_Ratu_Binokasih
        label2(i,:) = 32;
    elseif (isequal(name{2}, 'Isuk_Sore_Papangkah_Bulu_Hayam'))
        % assign label 33 for Isuk_Sore_Papangkah_Bulu_Hayam
        label2(i,:) = 33;
    elseif (isequal(name{2}, 'Isuk_Sore_Rereng'))
        % assign label 34 for Isuk_Sore_Rereng
        label2(i,:) = 34;
    elseif (isequal(name{2}, 'Iwak_Etong'))
        % assign label 35 for Iwak_Etong
        label2(i,:) = 35;
    elseif (isequal(name{2}, 'Jalak_Harupat'))
        % assign label 36 for Jalak_Harupat
        label2(i,:) = 36;
    elseif (isequal(name{2}, 'Kawung_Kembang_Tahu'))
        % assign label 37 for Kawung_Kembang_Tahu
        label2(i,:) = 37;
    elseif (isequal(name{2}, 'Kembang_Boled'))
        % assign label 38 for Kembang_Boled
        label2(i,:) = 38;
    elseif (isequal(name{2}, 'Kembang_Ki_Merak'))
        % assign label 39 for Kembang_Ki_Merak
        label2(i,:) = 39;
    elseif (isequal(name{2}, 'Kembang_Kucubung'))
        % assign label 40 for Kembang_Kucubung
        label2(i,:) = 40;
    elseif (isequal(name{2}, 'Kembang_Pete'))
        % assign label 41 for Kembang_Pete
        label2(i,:) = 41;
    elseif (isequal(name{2}, 'Kembang_Seruni'))
        % assign label 42 for Kembang_Seruni
        label2(i,:) = 42;
    elseif (isequal(name{2}, 'Kembang_Wijayakusumah'))
        % assign label 43 for Kembang_Wijayakusumah
        label2(i,:) = 43;
    elseif (isequal(name{2}, 'Kembang_Wijayakusumah_Biru'))
        % assign label 44 for Kembang_Wijayakusumah_Biru
        label2(i,:) = 44;
    elseif (isequal(name{2}, 'Kembang_Wijayakusumah_Kuning'))
        % assign label 45 for Kembang_Wijayakusumah_Kuning
        label2(i,:) = 45;
    elseif (isequal(name{2}, 'Keris_Apel'))
        % assign label 46 for Keris_Apel
        label2(i,:) = 46;
    elseif (isequal(name{2}, 'Keris_Kembang'))
        % assign label 47 for Keris_Kembang
        label2(i,:) = 47;
    elseif (isequal(name{2}, 'Kipas'))
        % assign label 48 for Kipas
        label2(i,:) = 48;
    elseif (isequal(name{2}, 'Kristal_Air_dan_Megamendung'))
        % assign label 49 for Kristal_Air_dan_Megamendung
        label2(i,:) = 49;
    elseif (isequal(name{2}, 'Kujang_Cakra'))
        % assign label 50 for Kujang_Cakra
        label2(i,:) = 50;
    elseif (isequal(name{2}, 'Kujang_Kijang'))
        % assign label 51 for Kujang_Kijang
        label2(i,:) = 51;
    elseif (isequal(name{2}, 'Kujang_Kijang_Merah_Biru'))
        % assign label 52 for Kujang_Kijang_Merah_Biru
        label2(i,:) = 52;
    elseif (isequal(name{2}, 'Kujang_Kijang_Seling_Rereng'))
        % assign label 53 for Kujang_Kijang_Seling_Rereng
        label2(i,:) = 53;
    elseif (isequal(name{2}, 'Kukupu_Latar_Lereng_Serutu'))
        % assign label 54 for Kukupu_Latar_Lereng_Serutu
        label2(i,:) = 54;
    elseif (isequal(name{2}, 'Lancah'))
        % assign label 55 for Lancah
        label2(i,:) = 55;
    elseif (isequal(name{2}, 'Lancurvaganza'))
        % assign label 56 for Lancurvaganza
        label2(i,:) = 56;
    elseif (isequal(name{2}, 'Lengko_Lengko'))
        % assign label 57 for Lengko_Lengko
        label2(i,:) = 57;
    elseif (isequal(name{2}, 'Lereng_Batu_Hiu'))
        % assign label 58 for Lereng_Batu_Hiu
        label2(i,:) = 58;
    elseif (isequal(name{2}, 'Lereng_Galuh_Pakuan'))
        % assign label 59 for Lereng_Galuh_Pakuan
        label2(i,:) = 59;
    elseif (isequal(name{2}, 'Lereng_Kujang'))
        % assign label 60 for Lereng_Kujang
        label2(i,:) = 60;
    elseif (isequal(name{2}, 'Lereng_Pakis(1)'))
        % assign label 61 for Lereng_Pakis(1)
        label2(i,:) = 61;
    elseif (isequal(name{2}, 'Lereng_Pakis(2)'))
        % assign label 62 for Lereng_Pakis(2)
        label2(i,:) = 62;
    elseif (isequal(name{2}, 'Lingga'))
        % assign label 63 for Lingga
        label2(i,:) = 63;
    elseif (isequal(name{2}, 'Lingga_Latar_Kembang_Boled'))
        % assign label 64 for Lingga_Latar_Kembang_Boled
        label2(i,:) = 64;
    elseif (isequal(name{2}, 'Lingga_Nyanding_Kembang_Kingkit'))
        % assign label 65 for Lingga_Nyanding_Kembang_Kingkit
        label2(i,:) = 65;
    elseif (isequal(name{2}, 'Lung_Krokotan'))
        % assign label 66 for Lung_Krokotan
        label2(i,:) = 66;
    elseif (isequal(name{2}, 'Manuk_Bengkuk'))
        % assign label 67 for Manuk_Bengkuk
        label2(i,:) = 67;
    elseif (isequal(name{2}, 'Manuk_Latar_Sisik'))
        % assign label 68 for Manuk_Latar_Sisik
        label2(i,:) = 68;
    elseif (isequal(name{2}, 'Obar_Abir'))
        % assign label 69 for Obar_Abir
        label2(i,:) = 69;
    elseif (isequal(name{2}, 'Oyod_Mingmang'))
        % assign label 70 for Oyod_Mingmang
        label2(i,:) = 70;
    elseif (isequal(name{2}, 'Paksinagaliman'))
        % assign label 71 for Paksinagaliman
        label2(i,:) = 71;
    elseif (isequal(name{2}, 'Pangkah_Latar_Kembang_Cabe'))
        % assign label 72 for Pangkah_Latar_Kembang_Cabe
        label2(i,:) = 72;
    elseif (isequal(name{2}, 'Parang_Sontak'))
        % assign label 73 for Parang_Sontak
        label2(i,:) = 73;
    elseif (isequal(name{2}, 'Patran_Kangkung'))
        % assign label 74 for Patran_Kangkung
        label2(i,:) = 74;
    elseif (isequal(name{2}, 'Patran_Keris'))
        % assign label 75 for Patran_Keris
        label2(i,:) = 75;
    elseif (isequal(name{2}, 'Peluru'))
        % assign label 76 for Peluru
        label2(i,:) = 76;
    elseif (isequal(name{2}, 'Phoenix'))
        % assign label 77 for Phoenix
        label2(i,:) = 77;
    elseif (isequal(name{2}, 'Piring_Lampad'))
        % assign label 78 for Piring_Lampad
        label2(i,:) = 78;
    elseif (isequal(name{2}, 'Pricipe'))
        % assign label 79 for Pricipe
        label2(i,:) = 79;
    elseif (isequal(name{2}, 'Pusdik'))
        % assign label 80 for Pusdik
        label2(i,:) = 80;
    elseif (isequal(name{2}, 'Pusdik_Kombinasi'))
        % assign label 81 for Pusdik_Kombinasi
        label2(i,:) = 81;
    elseif (isequal(name{2}, 'Pwah_Aci'))
        % assign label 82 for Pwah_Aci
        label2(i,:) = 82;
    elseif (isequal(name{2}, 'Ragen_Penganten'))
        % assign label 83 for Ragen_Penganten
        label2(i,:) = 83;
    elseif (isequal(name{2}, 'Ragen_Penganten_Coklat'))
        % assign label 84 for Ragen_Penganten_Coklat
        label2(i,:) = 84;
    elseif (isequal(name{2}, 'Ragen_Penganten_Kuning'))
        % assign label 85 for Ragen_Penganten_Kuning
        label2(i,:) = 85;
    elseif (isequal(name{2}, 'Rereng_Dokter'))
        % assign label 86 for Rereng_Dokter
        label2(i,:) = 86;
    elseif (isequal(name{2}, 'Rereng_Kujang'))
        % assign label 87 for Rereng_Kujang
        label2(i,:) = 87;
    elseif (isequal(name{2}, 'Rereng_Manis'))
        % assign label 88 for Rereng_Manis
        label2(i,:) = 88;
    elseif (isequal(name{2}, 'Rereng_Panah'))
        % assign label 89 for Rereng_Panah
        label2(i,:) = 89;
    elseif (isequal(name{2}, 'Rereng_Simeut'))
        % assign label 90 for Rereng_Simeut
        label2(i,:) = 90;
    elseif (isequal(name{2}, 'Rereng_Useup_Seling_Sisik'))
        % assign label 91 for Rereng_Useup_Seling_Sisik
        label2(i,:) = 91;
    elseif (isequal(name{2}, 'Sawat_Riwe'))
        % assign label 92 for Sawat_Riwe
        label2(i,:) = 92;
    elseif (isequal(name{2}, 'Sawat_Riwog'))
        % assign label 93 for Sawat_Riwog
        label2(i,:) = 93;
    elseif (isequal(name{2}, 'Sekar_Galuh'))
        % assign label 94 for Sekar_Galuh
        label2(i,:) = 94;
    elseif (isequal(name{2}, 'Sekar_Galuh_Merah'))
        % assign label 95 for Sekar_Galuh_Merah
        label2(i,:) = 95;
    elseif (isequal(name{2}, 'Sekar_Niyem'))
        % assign label 96 for Sekar_Niyem
        label2(i,:) = 96;
    elseif (isequal(name{2}, 'Sekar_Pisang'))
        % assign label 97 for Sekar_Pisang
        label2(i,:) = 97;
    elseif (isequal(name{2}, 'Sente'))
        % assign label 98 for Sente
        label2(i,:) = 98;
    elseif (isequal(name{2}, 'Sidomukti'))
        % assign label 99 for Sidomukti
        label2(i,:) = 99;
    elseif (isequal(name{2}, 'Sidomukti_Kembang'))
        % assign label 100 for Sidomukti_Kembang
        label2(i,:) = 100;
    elseif (isequal(name{2}, 'Simbar_Kencana'))
        % assign label 101 for Simbar_Kencana
        label2(i,:) = 101;
    elseif (isequal(name{2}, 'Taman_Arum_Sunyaragi'))
        % assign label 102 for Taman_Arum_Sunyaragi
        label2(i,:) = 102;
    elseif (isequal(name{2}, 'Taman_Kijang'))
        % assign label 103 for Taman_Kijang
        label2(i,:) = 103;
    elseif (isequal(name{2}, 'Tambal_Altitudo'))
        % assign label 104 for Tambal_Altitudo
        label2(i,:) = 104;
    elseif (isequal(name{2}, 'Tari_Raksasa_Danawa'))
        % assign label 105 for Tari_Raksasa_Danawa
        label2(i,:) = 105;
    elseif (isequal(name{2}, 'Tari_Samba'))
        % assign label 106 for Tari_Samba
        label2(i,:) = 106;
    elseif (isequal(name{2}, 'Tari_Tumenggungan'))
        % assign label 107 for Tari_Tumenggungan
        label2(i,:) = 107;
    elseif (isequal(name{2}, 'The_Depth_Flower'))
        % assign label 108 for The_Depth_Flower
        label2(i,:) = 108;
    elseif (isequal(name{2}, 'The_Slice'))
        % assign label 109 for The_Slice
        label2(i,:) = 109;
    elseif (isequal(name{2}, 'Turih_Oncom'))
        % assign label 110 for Turih_Oncom
        label2(i,:) = 110;
    elseif (isequal(name{2}, 'Udan_Liris'))
        % assign label 111 for Udan_Liris
        label2(i,:) = 111;
    elseif (isequal(name{2}, 'Wadasan_Mantingan'))
        % assign label 112 for Wadasan_Mantingan
        label2(i,:) = 112;
    elseif (isequal(name{2}, 'Waterfall'))
        % assign label 113 for Waterfall
        label2(i,:) = 113;
    elseif (isequal(name{2}, 'Wayang'))
        % assign label 114 for Wayang
        label2(i,:) = 114;
    end
    disp([listSubFolder(i).name, ' loaded']);
end
save(fullfile('DataTest2.mat'), 'imgResize', 'label2');