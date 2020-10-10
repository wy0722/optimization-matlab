clc;
clear;
close all;
maxgen=200;
number=100;
len=20;
bound=[-5,5;-5,5];%两行两列矩阵
chrom=round(rand(number,len*2));
pc=0.7;
pm=0.05;
for i=1:maxgen
    [obj,~]=fitness(chrom,len,bound);
    [rank,chrom,obj]=priority(chrom,obj);
    d=distance(obj,rank);
    chrom1=selectournament(chrom,rank,d);
    chrom1=cross(chrom1,pc,len);
    chrom1=mut(chrom1,pm);  
    chrom2=[chrom;chrom1];
    [obj,~]=fitness(chrom2,len,bound);
    [rank,chrom2,obj]=priority(chrom2,obj);
    d=distance(obj,rank);
    chrom=chrom2(1:number,:);
end
[obj,x]=fitness(chrom,len,bound);
[rank,chrom,obj]=priority(chrom,obj);
d=distance(obj,rank);
final=find(rank==1);
scatter(obj(:,1)',obj(:,2)','b');
% axis([-40 0,-5 50]);
xlabel('objective1');
ylabel('objective2'); 
title('pareto front');



   
    
    
    
    