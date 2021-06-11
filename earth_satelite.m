%% 假设
%月球与地球的距离相对于太阳可忽略不计，太阳对地球和月球的加速度几乎一样。因此假设月球与地球一同做相同的公转。
%选取地球的公转轨道为参考系，地球为该参考系原点，考虑月球对地的运动。
%假设t=0时刻，地月距离为384403e3m,此时月球的对地速度为平均公转速度 1023m/s
%t=0,xx=384403e3m,vxx=0,yy=0,vyy=1023m/s
%地球质量M=5.97237e24kg；月球质量m=7.342e22kg
%% 参数设置和初值设置
M=5.97237e24;
m=7.342e22;
ss=60;
TT=60*60*24*27*3;
tt=0:ss:TT;%共有TT/ss+1个
xx = tt;yy = tt;vxx = tt;vyy = tt;X = t;Y = t;%预分配内存以提升运算速率
xx(1) = 384403e3;
yy(1) = 0;
vxx(1) = 0;
vyy(1) = 1023;
%% 利用Euler法求解运动方程
%自变量为tt，因变量为xx,yy,vxx,vyy,fx,fy
%dxx/dt=vxx;dyy/dt=vyy;
%dvxx/dt=fx/m;dvyy/dt=fy/m;
for i = 2:TT/ss+1
    %% 预估
    [fx,fy,~] = F(-xx(i-1),-yy(i-1),0,m,M);
    x1 = xx(i-1)+ss*vxx(i-1);
    y1 = yy(i-1)+ss*vyy(i-1);
    vx1 = vxx(i-1)+ss*fx/m;
    vy1 = vyy(i-1)+ss*fy/m;
    %% 校正
    [fx1,fy1,~] = F(-x1,-y1,0,m,M);  
    xx(i) = xx(i-1)+ss/2.*(vxx(i-1)+vx1);
    yy(i) = yy(i-1)+ss/2.*(vyy(i-1)+vy1);
    vxx(i) = vxx(i-1)+ss/2*(fx+fx1)/m;
    vyy(i) = vyy(i-1)+ss/2*(fy+fy1)/m;
end
