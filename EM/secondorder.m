clc
clear
mu1=5;
sigma1=2.2;
alpha1=0.22;
mu2=10;
sigma2=1.2;
alpha2=0.38;
mu3=15;
sigma3=3.8;
alpha3=0.4;
alpha=[alpha1,alpha2,alpha3];
mu=[mu1,mu2,mu3];
sigma=[sigma1,sigma2,sigma3];
mean1=mu1*alpha1+mu2*alpha2+mu3*alpha3;
A=[1,2*mean1,2*mean1;2*mean1,1,2*mean1;2*mean1,2*mean1,1];
b=[4*mean1+8*mean1^2;4*mean1+8*mean1^2;4*mean1+8*mean1^2];
c=3*mean1^2-9-6*mean1^2+(3+12*mean1)*mean1^2;
sum=0;
for i=1:3
    for j=1:3
        for k=1:3
            syms t;
            tao=[sigma(i),sigma(j),sigma(k)];
            mu_t=[mu(i),mu(j),mu(k)]';
            B=eye(3)-2*t*diag(tao)*A*diag(tao);
            d=diag(tao)*b+2*diag(tao)*A*mu_t;
            M=alpha(i)*alpha(j)*alpha(k)*det(B)^(-0.5)*exp(t*(mu_t'*A*mu_t+b'*mu_t+c)+0.5*t^2*d'*inv(B)*d);
            sum=sum+M;
        end
    end
end
sum=log(sum);
parameter=110000;
sum_new=diff(sum,1)-parameter;
t0=solve(sum_new,t);
z1=subs(sum,t,t0);
z=diff(sum,2);
z2=subs(z,t,t0);
w=sign(t0)*(2*(t0*parameter-z1))^0.5;
v=t0*(z2)^0.5;
w_new=double(w);
v_new=double(v);
p_y=normcdf(w_new)+normpdf(w_new)*(1/w_new-1/v_new)
             
            
        


