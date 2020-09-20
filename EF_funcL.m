function [ result ] = EF_funcL( u )
%FUNCL Summary of this function goes here
%   Detailed explanation goes here
	dec = u.^(1/3);
    
    u_upper = ((dec*116)-16).*(u>0.008856);
    u_lower = u*903.3 .*(u<=0.008856);
%     if u > 0.008856
%         result = (116*dec)-16;
%     else
%         result = (903.3*u);
%     end
    result = u_upper + u_lower;
end

