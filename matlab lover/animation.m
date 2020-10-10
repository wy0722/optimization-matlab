% 螺旋线动画演示代码
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
xlabel('X 轴');
ylabel('Y 轴');
zlabel('Z 轴');
xlim([-1,1]);
ylim([-1,1]);
zlim([0,80]);
title('螺旋线动画演示');
gg = 1;
for k = 1:lenT
    x(k) = cos(t(k));
    y(k) = sin(t(k));
    z(k) = t(k)*2;
    plot3(x(1:k),y(1:k),z(1:k),'r.-');
    pause(0.05);
    % 保存为动画
%     F = getframe(gcf);
%     %转成gif图片,只能用256色
%     im = frame2im(F);
%     [I,map] = rgb2ind(im,256);
%     %写入 GIF格式文件
%     if gg == 1
%         imwrite(I,map,'lxx.gif','GIF', 'Loopcount',inf,'DelayTime',0.1);
%         gg = gg + 1;
%     else
%         imwrite(I,map,'lxx.gif','WriteMode','append','DelayTime',0.1);
%     end
end