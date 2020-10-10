clc;
clear all;
close all;
x=[16.47,96.10;16.47,94.44;20.09,92.54;22.39,93.37;25.23,97.24;22.00,96.05;20.47,97.02;17.20,96.29;16.30,97.38;14.05,98.12;16.53,97.38;21.52,95.59;19.41,97.13;20.09,92.55];
pm=0.7;
pc=0.05;
m=14;
ggap=0.9;
gen=100;
n=50;
d=zeros(m,m);
trace=zeros(gen,m+1);
for i=1:m
    for j=1:m
        if i~=j
            d(i,j)=((x(j,1)-x(i,1)).^2+(x(j,2)-x(i,2)).^2).^0.5;
        else
            d(i,j)=0.0001;
        end
    end
end
for i=1:n
    chrom(i,:)=randperm(m);
end
for t=1:gen
    obj=fitness(chrom,d);
    chromstay=rank(obj,chrom,ggap);
    chromleft=select(obj,chrom,ggap);
    for i=1:2:n
        if rand<pm
            [chromleft(i,:),chromleft(i+1,:)]=cross(chromleft(i,:),chromleft(i+1,:));
        end
    end
    for j=1:n
        if rand<pc
            a=[randi(m),randi(m)];
            if a(1)~=a(2)
                chromleft(j,[min(a),max(a)])=chromleft(j,[max(a),min(a)]);
            end
        end
    end        
    chrom=[chromleft;chromstay];
    obj=fitness(chrom,d);
    [opt,index]=min(obj);
    trace(t,[1:m])=chrom(index,:);
    trace(t,end)=opt;
end
    
    
            
