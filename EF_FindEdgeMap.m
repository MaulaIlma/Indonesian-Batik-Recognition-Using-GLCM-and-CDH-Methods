function [ EdgeMap ] = EF_FindEdgeMap( G, height, width )
%GRADIENTVECTOR  Pencarian nilai arah dari vektor gradien G(gxx,gyy,gxy)
%   Masukan: vektor gradien G(gxx,gyy,gxy)
%   Luaran: arah dari tiap-tiap koordinat (derajat)

%% Pengambilan nilai dimensi ukuran dari vektor gradien
% [height,width,dim] = size(G);
%% Kalkulasi nilai arah


% EdgeMap = zeros(height,width);
% for i=1:height
%     for j=1:width
%         EdgeMap(i,j)=(atan((2*G(i,j,3))/(G(i,j,1)-G(i,j,2))))/2;
%         if isnan(EdgeMap(i,j))
%             EdgeMap(i,j) = 0;
%         end
%     end
% end   
EdgeMap = (atan((2*G(:,3))./(G(:,1)-G(:,2))))/2;
EdgeMap(isnan(EdgeMap))=0;
theta1 = rad2deg(EdgeMap);
theta1(theta1<0)= theta1(theta1<0) + 180;
theta2 = theta1 + 90;

t1 = EF_FuncG(G(:,1),G(:,2),G(:,3),theta1);
t2 = EF_FuncG(G(:,1),G(:,2),G(:,3),theta2);

EdgeMap = (t1>t2).*theta1+(t1<=t2).*theta2;

EdgeMap = reshape(EdgeMap,height, width);


% for i=1:height
%     for j=1:width
%         theta1 = rad2deg(EdgeMap(i,j));
%         if theta1<0
%             theta1 = theta1 + 180;
%         end
% 
%         theta2 = theta1 + 90;
% 
%         if EF_FuncG(G(i,j,1),G(i,j,2),G(i,j,3),deg2rad(theta1))>EF_FuncG(G(i,j,1),G(i,j,2),G(i,j,3),deg2rad(theta2))
%             EdgeMap(i,j)=theta1;
%         else
%             EdgeMap(i,j)=theta2;
%         end
% 
%     end
% end

end