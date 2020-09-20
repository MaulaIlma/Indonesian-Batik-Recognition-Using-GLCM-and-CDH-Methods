function [ dir ] = EF_FuncG( gxx, gyy, gxy, angle )
%EF_FUNCG Summary of this function goes here
%   Detailed explanation goes here
dir =  sqrt(((gxx+gyy)+((gxx-gyy).*cosd(2*angle))+(2*gxy.*sind(2*angle)))/2);

end
