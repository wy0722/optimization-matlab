width=100;      
cell=5;           
state=zeros(width,width);       %��ʼ״̬���趼Ϊ����
now_state=zeros(width,width);
%��ʼ��ϸ��״̬��������40%��ϸ������
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
            %   �������ϸ�����м������ŵ��ھ�
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
    title('������Ϸ');
end