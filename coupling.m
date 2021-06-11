%% 月球对地轨道与地球公转轨道耦合
for i = 1:T/s+1
    ii=rem(i*s/ss,Tm);
    X(i)=x(i)+xx(ii);
    Y(i)=y(i)+yy(ii);
end
