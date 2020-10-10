function d=AF_dist(xi,x)
m=size(x,1);
for i=1:m
    d(i)=norm(xi-x(i,:));
end