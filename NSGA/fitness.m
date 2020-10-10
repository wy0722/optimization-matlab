function [obj,x]=fitness(chrom,len,bound)%得到的返回值用中括号
m=size(chrom,1);
chrom1=chrom(:,[1:len]);
chrom2=chrom(:,[len+1:end]);
bound1=bound(1,:);
bound2=bound(2,:);
for i=1:m
    for j=1:len
        chrom1(i,j)=chrom1(i,j)*power(2,j-1);
        chrom2(i,j)=chrom2(i,j)*power(2,j-1);
    end
    x1(i,:)=sum(chrom1(i,:));
    x2(i,:)=sum(chrom2(i,:));
end
ret1=x1./(power(2,len)-1).*(bound1(2)-bound1(1))+bound1(1);
ret2=x2./(power(2,len)-1).*(bound2(2)-bound2(1))+bound2(1);
x=[ret1,ret2];
for k=1:m
    obj1(k,:)=ret1(k,:).^4-10*(ret1(k,:)).^2+ret1(k,:).*ret2(k,:)+ret2(k,:).^4-ret1(k,:).^2.*ret2(k,:).^2;
    obj2(k,:)=ret2(k,:).^4-ret1(k,:).^2*ret2(k,:).^2+ret1(k,:).^4+ret1(k,:).*ret2(k,:);
end
obj=[obj1,obj2];
