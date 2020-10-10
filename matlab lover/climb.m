clc;
close all;
fun = @(x,y) 1./(x.^2 + y.^2+pi);% 定义目标函数
% 定义初始节点(x0,y0)
x0=2.3;
y0=-2.8;
% 定义近邻节点范围
dx=0.1;
dy=0.1;
% 定义近邻节点划分份数
nX=10;
nY=10;
% 定义计算精度
ep = 1e-4;
% 定义x,y区间
x=-4:0.2:4;
y=-4:0.2:4;
% 二维网格化区间
[xx,yy] = meshgrid(x,y);
zz = fun(xx,yy);
% 绘制目标函数三维图像
surf(xx,yy,zz);
gg = 1;
title(['爬山算法演示 ——','第',num2str(gg),'次搜素']);%good
xlabel('x轴');
ylabel('y轴');
zlabel('z轴');
hold on;
val1 = fun(x0,y0);%初始值
plot3(x0,y0,val1,'r.');
% 初始化搜索次数和函数差值
gg = 1;
dlt = 1;
while(dlt > ep)
    nx=linspace(x0-dx,x0+dx,nX*gg);%均分找临近解
    ny=linspace(y0-dy,y0+dy,nY*gg);
    [nxx,nyy] = meshgrid(nx,ny);
    valtmp = fun(nxx,nyy);
    % 求解近邻节点最大值及其位置
    [val2,loc] = max(valtmp(:));
    % 当前函数值与最大值作差
    dlt = abs(val1-val2);
    x0 = nxx(loc);
    y0 = nyy(loc);
    val1 = val2;
    plot3(x0,y0,val2,'r.');
    title(['爬山算法演示 ——','第',num2str(gg),'次搜素']);
    pause(0.1);       % 暂停0.1
    gg = gg + 1;
end
% 绘制最终极大值点
plot3(x0,y0,val2,'ro');
hold off