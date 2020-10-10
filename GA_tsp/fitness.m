function ret=fitness(chrom,d)
[a,b]=size(chrom);
for i=1:a
    len=0;
    for j=1:b-1
       len=d(chrom(i,j),chrom(i,j+1))+len;
    end
       len=len+d(chrom(i,end),chrom(i,1));
       ret(i,:)=1./len;
end

