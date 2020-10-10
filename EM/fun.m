function rsum=fun(x,message,limit)
o1=sum(x(1:5)'.^2.*message(:,3));
o2=10^-5*sum(message(:,1).*(-1000./log(x(6:10)')).^1.5.*(x(1:5)'+exp(x(1:5)'*0.25)));
o3=sum(x(1:5)'.*exp(0.25*x(1:5)').*message(:,4));
if o1<=limit(1)&&o2<=limit(2)&&o3<=limit(3)
   rsum=1;
   for i=1:5
      rs(i)=1-(1-x(5+i))^x(i);
      rsum=rsum*rs(i);
   end
else
   rsum=1;
   for i=1:5
      rs(i)=1-(1-x(5+i))^x(i);
      rsum=rsum*rs(i);
   end
   a=limit(1)/sum(x(1:5)'.^2.*message(:,3));
   b=limit(3)/sum(x(1:5)'.*message(:,4).*exp(0.25*x(1:5)'));
   c=limit(2)/o2;
   rho=min([a,b,c]);
   rsum=rsum*rho^3;
end