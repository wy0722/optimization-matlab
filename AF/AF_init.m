function x=AF_init(n,lb,ub)
%n:��Ⱥ��С
%lb_ub:��Ļ��Χ
%x:�����ĳ�ʼ�˹���Ⱥ
for i=1:n
    x(i,:)=lb+(ub-lb)*rand(1,2);
end
