%% 寻找月球绕地球一周的坐标（xx，yy）索引
aa=xx;aa(1:end)=xx(1);
bb=yy;bb(1:end)=yy(1);
XY=[xx-aa;yy-bb];%与t=0时刻的位置偏离
dd=XY.^2;
rr=sqrt(dd(1,:)+dd(2,:));%月球坐标与t=0时刻的距离序列
i=2;
while rr(i)>rr(i-1)
    i=i+1;
end
Tm=2*(i-1);%Tmw为月球绕地球旋转一圈的时间