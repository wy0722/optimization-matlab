x=0:0.01:2;
y1=sin(x);
y2=cos(x);
plot(x,y1,'r',x,y2,'b')
xlabel('xÖá');
ylabel('yÖá');
title('ÕıÓàÏÒº¯ÊıÍ¼')
legend('sin(x)','cos(x)');
text(0,0,'good')
annotation('arrow',[0.2,0.2],[0.8,0.8])%»­¼ıÍ·
grid on
axis on
