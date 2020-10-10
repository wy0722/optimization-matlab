clc;
close all;
fun = @(x,y) 1./(x.^2 + y.^2+pi);% ����Ŀ�꺯��
% �����ʼ�ڵ�(x0,y0)
x0=2.3;
y0=-2.8;
% ������ڽڵ㷶Χ
dx=0.1;
dy=0.1;
% ������ڽڵ㻮�ַ���
nX=10;
nY=10;
% ������㾫��
ep = 1e-4;
% ����x,y����
x=-4:0.2:4;
y=-4:0.2:4;
% ��ά��������
[xx,yy] = meshgrid(x,y);
zz = fun(xx,yy);
% ����Ŀ�꺯����άͼ��
surf(xx,yy,zz);
gg = 1;
title(['��ɽ�㷨��ʾ ����','��',num2str(gg),'������']);%good
xlabel('x��');
ylabel('y��');
zlabel('z��');
hold on;
val1 = fun(x0,y0);%��ʼֵ
plot3(x0,y0,val1,'r.');
% ��ʼ�����������ͺ�����ֵ
gg = 1;
dlt = 1;
while(dlt > ep)
    nx=linspace(x0-dx,x0+dx,nX*gg);%�������ٽ���
    ny=linspace(y0-dy,y0+dy,nY*gg);
    [nxx,nyy] = meshgrid(nx,ny);
    valtmp = fun(nxx,nyy);
    % �����ڽڵ����ֵ����λ��
    [val2,loc] = max(valtmp(:));
    % ��ǰ����ֵ�����ֵ����
    dlt = abs(val1-val2);
    x0 = nxx(loc);
    y0 = nyy(loc);
    val1 = val2;
    plot3(x0,y0,val2,'r.');
    title(['��ɽ�㷨��ʾ ����','��',num2str(gg),'������']);
    pause(0.1);       % ��ͣ0.1
    gg = gg + 1;
end
% �������ռ���ֵ��
plot3(x0,y0,val2,'ro');
hold off