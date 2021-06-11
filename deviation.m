%% 比较模拟与实际观测的值的一些差异

%% 地球公转轨道比较
%模拟计算
xmax=max(x);xmin=min(x);
ymax=max(y);ymin=min(y);
%实际
xmaxo=147098074e3;xmino=-147098074e3;
ymaxo=152097701e3;ymino=-152097701e3;
%% 月球绕地球轨道比较
%模拟计算
xxmax=max(xx);xxmin=min(xx);
yymax=max(yy);yymin=min(yy);
%实际
xxmaxo=384403e3;xxmino=-384403e3;
yymaxo=384403e3;yymino=-384403e3;
%% 显示
con=fopen('deviation.txt','w');
conclusion1='\n模拟计算结果:\n 日地系：x方向范围:(%d,%d) y方向范围:(%d,%d)\n 地月系：x方向范围:(%d,%d) y方向范围:(%d,%d)\n';
conclusion2='\n实际观测结果:\n 日地系：x方向范围:(%d,%d) y方向范围:(%d,%d)\n 地月系：x方向范围:(%d,%d) y方向范围:(%d,%d)\n';
fprintf(con,conclusion1,xmin,xmax,ymin,ymax,xxmin,xxmax,yymin,yymax);
fprintf(con,conclusion2,xmino,xmaxo,ymino,ymaxo,xxmino,xxmaxo,yymino,yymaxo);
fclose(con);