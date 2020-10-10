width=100;      
cell=5;           
state=zeros(width,width);       %初始状态假设都为死的
now_state=zeros(width,width);
%初始化细胞状态，假设由40%的细胞活着
for i=1:width
    for j=1:width
        if rand<0.4      
            state(i,j)=1;   
        end
    end
end
figure;
while true
    for i=1:width
        for j=1:width
            %   计算这个细胞还有几个活着的邻居
            s1=0;
            if i-1>0&&j-1>0
                s1=s1+state(i-1,j-1);
            end
            if i-1>0&&j+1<=width
                s1=s1+state(i-1,j+1);
            end
            if i+1<=width&&j+1<=width
                s1=s1+state(i+1,j+1);
            end
            if i+1<=width&&j-1>0
                s1=s1+state(i+1,j-1);
            end
            if j-1>0
                s1=s1+state(i,j-1);
            end
            if j+1<=width
                s1=s1+state(i,j+1);
            end
            if i-1>0
                s1=s1+state(i-1,j);
            end
            if i+1<=width
                s1=s1+state(i+1,j);
            end
            now_state(i,j)=state(i,j);
            if state(i,j)==0
                if s1==3
                    now_state(i,j)=1;
                end
            elseif state(i,j)==1
                if s1<2||s1>3
                    now_state(i,j)=0;
                end
            end
        end
    end
    state=now_state;
    imshow(state);
    title('生命游戏');
end