function [fx,fy,fz] = F(dx,dy,dz,m,M)
%F 用于求解天体1对天体2在x和y方向上的力，采用量纲为（m,s,N,kg）
%   dx dy dz表示天体2指向天体1的矢量
%   fx,fy,fz表示天体1在xyz方向受到的力大小和方向
%   F=GmM/(r^2)
G = 6.67e-11;
r=sqrt(dx^2+dy^2+dz^2);
F=G*m*M/(r^2);
fx = F*dx/r;
fy = F*dy/r;
fz = F*dz/r;
end

