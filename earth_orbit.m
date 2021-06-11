clear;clc;
%以太阳为原点，地球在X0Y平面内运动
%取时间间隔s=1天
%初始时刻t=0s在近日点x=147098074e3m,y=0m,vx=0,vy=30287m/s
%太阳质量M=2e30kg,地球质量m=5.97237e24kg
%% 参数和初值设置
T=365*24*60*60*3;%3年
s=24*60*60;%一天
t = 0:s:T;   %t取值范围为0到3年，间隔为s,共取了365*24*60*3+1个点
x=t;y=t;vx=t;vy=t;%预分配内存以提升运算速度
M=2e30;
m=5.97237e24;
x(1) = 147098074e3;
y(1) = 0;
vx(1) = 0;
vy(1) = 30287;
%% 利用Euler法求解运动方程
%自变量为t，因变量为x,y,vx,vy,fx,fy
%dx/dt=vx;dy/dt=vy;
%dvx/dt=fx/m;dvy/dt=fy/m;
for i = 2:T/s+1
    %% 预估
    [fx,fy,~] = F(-x(i-1),-y(i-1),0,m,M);
    x1 = x(i-1)+s*vx(i-1);
    y1 = y(i-1)+s*vy(i-1);
    vx1 = vx(i-1)+s*fx/m;
    vy1 = vy(i-1)+s*fy/m;
    %% 校正
    [fx1,fy1,~] = F(-x1,-y1,0,m,M);  
    x(i) = x(i-1)+s/2.*(vx(i-1)+vx1);
    y(i) = y(i-1)+s/2.*(vy(i-1)+vy1);
    vx(i) = vx(i-1)+s/2*(fx+fx1)/m;
    vy(i) = vy(i-1)+s/2*(fy+fy1)/m;
end


