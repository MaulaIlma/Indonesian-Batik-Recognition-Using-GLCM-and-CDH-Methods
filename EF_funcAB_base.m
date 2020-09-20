function [ result ] = EF_funcAB_base( u )
%funcAB_base Penjelasan singkat:
%   Fungsi untuk mendapatkan hasil fungsi f dalam proses konversi ke L*a*b*
%       (paper Liu, Yang, persamaan 4)
%   Masukan:
%       nilai pembagian yang diperlukan (nilai faktual/nilai konstan)
%     dec = u.^(1/3);
%     if u > 0.008856
%         result = dec;
%     else
%         result = (7.787*u)+(0.13793103);
%     end
    dec = u.^(1/3);
    u_upper = dec.*(u>0.008856);
    u_lower = (u*7.787+0.13793103) .*(u<=0.008856);
%     if u > 0.008856
%         result = (116*dec)-16;
%     else
%         result = (903.3*u);
%     end
    result = u_upper + u_lower;
    
    end

