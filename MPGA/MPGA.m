clear;
clc;
close all;
number=40;
maxgen=500;
len=20;
ggap=0.9;
dimen=2;
mp=10;%种群数目
trace=zeros(1,maxgen);
field=[-3,12.1;4.1,5.8];
for i=1:mp
    chrom{i,1}=crtbp(number,len*dimen);
end
pc=0.7+(0.9-0.7)*rand(mp,1);
pm=0.001+(0.05-0.001)*rand(mp,1);
maxy=0;
gen0=0;
maxobj=zeros(mp,1);
yy=0;
while gen0<=maxgen
    for i=1:mp
        obj{i,1}=fitness(bs2rv(chrom{i,1},field));
        chromstay{i,1}=rank(obj{i,1},chrom{i,1},ggap);
        chromleft{i,1}=select(obj{i,1},chrom{i,1},ggap);
        chromleft{i,1}=cross(chromleft{i,1},pc(i));
        chromleft{i,1}=mut(chromleft{i,1},pm(i));
        chrom{i,1}=[chromleft{i,1};chromstay{i,1}];
        obj{i,1}=fitness(bs2rv(chrom{i,1},field));
    end
    [chrom,obj]=immigrant(chrom,obj);
    [maxobj,maxchrom]=elindividual(chrom,obj,maxobj,maxchrom);
    a=max(maxobj);
    if a>yy
       yy=a;
       gen0=0;
    else
        gen0=gen0+1;
    end
end
plot(1:maxgen,yy)
xlabel('进化次数')
ylabel('最优解变化')
title('进化过程')

    
    
