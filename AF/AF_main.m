clc;
clear;
close all;
n=100;
maxgen=100;
try_number=100;
visual=2.5;
delta=0.618;
step=0.3;
lb=-2;
ub=2;
x=AF_init(n,lb,ub);
besty=-1000;
for t=1:maxgen
    for i=1:n
        [xi2,yi2]=AF_follow(x,i,visual,step,delta,try_number,lb,ub);
        [xi1,yi1]=AF_swarm(x,i,visual,step,delta,try_number,lb,ub);
        if yi1>yi2
            x(i,:)=xi1;
            y(i)=yi1;
        else
            x(i,:)=xi2;
            y(i)=yi2;
        end
    end
    [ymax,index]=max(y);
    if ymax>besty
        besty=ymax;
        bestx=x(index,:);
        opty(t)=besty;
        optx(t,:)=bestx;
    else
        opty(t)=besty;
        optx(t,:)=optx(t-1,:);
    end
end
plot(1:maxgen,opty)
xlabel('迭代次数')
ylabel('优化值')
title('鱼群算法的迭代次数')

        
   
            

