function chrom=mut(chrom,pm)
[m,n]=size(chrom);
for i=1:m
    for j=1:n
        if pm>rand
           chrom(i,j)=1-chrom(i,j);
        end
    end
end

            
