N=10;
x=-5+10*rand(1,N);
y=-5+10*rand(1,N);
z=1/(2*pi)*rand(1,N);
area=find(x.^2+y+3<=0&z<=1/(2*pi)*exp((-x.^2-y.^2)/2));
len=length(area);
s=50/pi*(len/N);


