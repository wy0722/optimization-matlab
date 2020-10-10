function chrom1=selectournament(chrom,rank,d)
m=size(chrom,1);
for i=1:m
    a=[randi(m),randi(m)];
    if a(1)~=a(2)
       if rank(a(1))<rank(a(2))
           chrom1(i,:)=chrom(a(1),:);
       elseif rank(a(1))>rank(a(2))
           chrom1(i,:)=chrom(a(2),:);
       else 
           if   d(a(1))>=d(a(2))
                chrom1(i,:)=chrom(a(1),:);
           else 
                chrom1(i,:)=chrom(a(2),:);
           end
       end
    else
                chrom1(i,:)=chrom(a(1),:);
    end
end

