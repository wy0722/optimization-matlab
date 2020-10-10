function ret1=cross(a,b)
a
b
len=length(a);
r=[randi(len),randi(len)];
if r(1)~=r(2)
   a0=a; 
   b0=b;
   s=min(r)
   e=max(r)
   for i=s:e
       a(i)=b0(i);
       b(i)=a0(i);
       x=find(a==a(i));
       y=find(b==b(i));
       i1=x(x~=i);
       i2=y(y~=i);
       if ~isempty(i1)%»Ùi1∑«ø’
           a(i1)=a0(i);
       end
       if ~isempty(i2)
           b(i2)=b0(i);
       end
   end
end
a
b