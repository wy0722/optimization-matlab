function x=AF_init(n,lb,ub)
%n:鱼群大小
%lb_ub:鱼的活动范围
%x:产生的初始人工鱼群
for i=1:n
    x(i,:)=lb+(ub-lb)*rand(1,2);
end
