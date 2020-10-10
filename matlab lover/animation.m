% �����߶�����ʾ����
close all;
clc;
clear;
t=0:0.05:10*pi;
lenT=length(t);
x=zeros(1,lenT);
y=zeros(1,lenT);
z=zeros(1,lenT);
plot3(x(1),y(1),z(1),'ro');
hold on;
xlabel('X ��');
ylabel('Y ��');
zlabel('Z ��');
xlim([-1,1]);
ylim([-1,1]);
zlim([0,80]);
title('�����߶�����ʾ');
gg = 1;
for k = 1:lenT
    x(k) = cos(t(k));
    y(k) = sin(t(k));
    z(k) = t(k)*2;
    plot3(x(1:k),y(1:k),z(1:k),'r.-');
    pause(0.05);
    % ����Ϊ����
%     F = getframe(gcf);
%     %ת��gifͼƬ,ֻ����256ɫ
%     im = frame2im(F);
%     [I,map] = rgb2ind(im,256);
%     %д�� GIF��ʽ�ļ�
%     if gg == 1
%         imwrite(I,map,'lxx.gif','GIF', 'Loopcount',inf,'DelayTime',0.1);
%         gg = gg + 1;
%     else
%         imwrite(I,map,'lxx.gif','WriteMode','append','DelayTime',0.1);
%     end
end