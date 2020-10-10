clc
clear
mu1=5;
sigma1=2.2;
n1=22;
mu2=10;
sigma2=1.2;
n2=38;
mu3=15;
sigma3=3.8;
n3=40;
r1=normrnd(mu1,sigma1,1,n1);
r2=normrnd(mu2,sigma2,1,n2);
r3=normrnd(mu3,sigma3,1,n3);
R=[r1,r2,r3];
a_test=[0.3,0.3,0.4];
mu_test=[2,6,8];
sigma_test=[1,2,4];
maxgen=100;
for iter=1:maxgen
    for i=1:100
        for lk=1:3
            p(i,lk)=normpdf(R(i),mu_test(lk),sigma_test(lk))*a_test(lk);
            if(lk==3)
                p_condition(i,lk-2)=p(i,lk-2)/sum(p(i,:));
                p_condition(i,lk-1)=p(i,lk-1)/sum(p(i,:));
                p_condition(i,lk)=p(i,lk)/sum(p(i,:));
            end
        end
    end
    a_test(1)=sum(p_condition(:,1))/100;
    a_test(2)=sum(p_condition(:,2))/100;
    a_test(3)=sum(p_condition(:,3))/100;
    mu_test(1)=(R*p_condition(:,1))/sum(p_condition(:,1));
    mu_test(2)=(R*p_condition(:,2))/sum(p_condition(:,2));
    mu_test(3)=(R*p_condition(:,3))/sum(p_condition(:,3));
    sigma_test(1)=sqrt(((R-mu_test(1)).^2*p_condition(:,1))/sum(p_condition(:,1)));
    sigma_test(2)=sqrt(((R-mu_test(2)).^2*p_condition(:,2))/sum(p_condition(:,2)));
    sigma_test(3)=sqrt(((R-mu_test(3)).^2*p_condition(:,3))/sum(p_condition(:,3)));
    L=1;
    for i=1:100
       L=L*(normpdf(R(i), mu_test(1),sigma_test(1))*a_test(1)+normpdf(R(i), mu_test(2),sigma_test(2))*a_test(2)+normpdf(R(i), mu_test(3),sigma_test(3))*a_test(3));
    end
    s(iter)=log(L);
end
a_test
[0.22,0.38,0.40]
mu_test
[mu1,mu2,mu3]
sigma_test
[2.2,1.2,3.8]
plot(1:maxgen,s)
xlabel('iteration')
ylabel('likelyhood')



    