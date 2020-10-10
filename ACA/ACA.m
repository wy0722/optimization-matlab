 clc;
clear;
tic;%��ʱ����
% x=xlsread('data(2).xlsx');
x=[16.47,96.10;16.47,94.44;20.09,92.54;22.39,93.37;25.23,97.24;22.00,96.05;20.47,97.02;17.20,96.29;16.30,97.38;14.05,98.12;16.53,97.38;21.52,95.59;19.41,97.13;20.09,92.55];
n=size(x,1);%������Ŀ
for i=1:n
    for j=1:n
        if i~=j
            d(i,j)=sqrt((x(i,1)-x(j,1)).^2+(x(i,2)-x(j,2)).^2);
        else
            d(i,j)=1e-4;%����ǳ�С����
        end
    end
end
m=35;%��������
alpha=5;
beta=5;
rho=0.1;
Q=1;
eta=1./d;
maxgen=1000;
bestdistance=10000000000;
tau=ones(n,n);%���������֮�����Ϣ�غ���
city_index=1:n;
for t=1:maxgen
    road=zeros(m,n);%·����
    for i=1:m
        tabu=randi(n);%·��������
        for j=1:n-1%��¼��������Ԫ��
            allow=city_index(~ismember(city_index,tabu));
            p=tau(tabu(end),allow).^alpha.*tau(tabu(end),allow).^beta;
            p=p./sum(p);
            pc=cumsum(p);
            target=allow(rand<=pc);
            tabu=[tabu,target(1)];
        end
        road(i,:)=tabu;
    end
    distance=zeros(1,m);
    for i=1:m
        for j=1:n-1
            distance(i)=distance(i)+d(road(i,j),road(i,j+1));
        end
        distance(i)=distance(i)+d(road(i,end),road(i,1));
    end
    [min_distance,index]=min(distance);
    if min_distance<bestdistance
       bestdistance=min_distance;
       bestroad=road(index,:);
    end
    optdistance(t)=bestdistance;
    delta_tau=zeros(n,n);
    for i=1:m
        for j=1:n-1
            delta_tau(road(i,j),road(i,j+1))=Q./distance(i);
        end
            delta_tau(road(i,end),road(i,1))=Q./distance(i);
    end
    tau=(1-rho)*tau+delta_tau;%ֱ�ӶԾ�����в���
end
t=toc
figure(1)
plot(1:maxgen,optdistance)
solve=optdistance(end)
xlabel('��������')
ylabel('���Ž�')
title('���Ž�')
for i=1:length(bestroad)
    x1(i)=x(bestroad(i),1);
    y1(i)=x(bestroad(i),2);
end
x1=[x1,x1(1)];
y1=[y1,y1(1)];
figure(2)
plot(x1,y1,'r','markersize',10)
xlabel('���еĺ�����')
ylabel('���е�������')
title('·��ͼ')
            
            
            



