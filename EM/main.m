clc;
clear;
c1=1.4;
c2=1.4;
cg=0.3;
cp=0.5;
cw=0.8;
pc=0.5;
pm=0.5;
w=1;
maxgen=10000;
number=50;
message=[2.330,1.5,1,7;1.450,1.5,2,8;0.541,1.5,3,8;8.050,1.5,4,6;1.950,1.5,2,9];
limit=[110,175,200];
major_max=10;
major_min=1;
vmajor_max=5;
vmajor_min=-5;
r_max=1;
r_min=0;
xmajor=round(major_min+(major_max-major_min)*rand(number,5));
xr=r_min+(r_max-r_min)*rand(number,5);
x=[xmajor,xr];
for k=1:number
    fitness(k,1)=fun(x(k,:),message,limit);
end
pbestfitness=fitness;
pbest=x;
[gbestfitness,index]=max(fitness);
gbest=x(index,:);
for t=1:maxgen
    for i=1:number
        principle=rand(1,5);
        for q=1:5
            if principle(q)<=cg
                x(i,q)=gbest(q);
            elseif principle(q)>=cp&&principle(q)<=cw
                 if pm<rand
                   x(i,q)=pbest(i,q); 
                 else
                   a=[randi(number),randi(number)];
                   if a(1)~=a(2)
                     [~,index]=max([fitness(a(1)),fitness(a(2))]);
                     x(i,q)=pbest(a(index),q);
                   else
                     x(i,q)=pbest(a(1),q); 
                   end
                 end
            else principle(q)>=cw;
                x(i,q)=round(major_min+(major_max-major_min)*rand);
            end
        end
        for s=6:10
           if pc<rand
             x(i,s)=x(i,s)*w+c1*rand*(pbest(i,s)-x(i,s))+c2*rand*(gbest(s)-x(i,s));%c1*rand*(pbest(i,s)-x(i,s))+
           else
              b=[randi(number),randi(number)];
              if b(1)~=b(2)
                [~,index]=max([fitness(b(1)),fitness(b(2))]);
                x(i,s)=x(i,s)*w+c1*rand*(pbest(b(index),s)-x(i,s))+c2*rand*(gbest(s)-x(i,s));%c1*rand*(pbest(b(index),s)-x(i,s))+
              else
                x(i,s)=x(i,s)*w+c1*rand*(pbest(b(1),s)-x(i,s))+c2*rand*(gbest(s)-x(i,s));%c1*rand*(pbest(b(1),s)-x(i,s))+
              end
           end
        end
       if rand<1/(1+exp(-t*1/maxgen))-0.5
               x(i,6:10)=r_min+(r_max-r_min)*rand(1,5);
       end
        x1=x(i,6:10);
        x1((x1>r_max))=r_min+(r_max-r_min)*rand;
        x1((x1<r_min))=r_min+(r_max-r_min)*rand;
        x(i,6:10)=x1;
        fitness(i)=fun(x(i,:),message,limit);
    end
    for j=1:number
        if fitness(j)>pbestfitness(j)
           pbestfitness(j)=fitness(j);
           pbest(j,:)=x(j,:);
        end
        if max(fitness)>gbestfitness
            [gbestfitness,index]=max(fitness);
            gbest=x(index,:);
        end
    end
    trace(t)=gbestfitness;
end
plot(1:maxgen,trace)
xlabel('进化代数')
ylabel('适应度')
title('进化过程')
gbest
gbestfitness(end)