function chrom=cross(chrom,pc,len)
m=size(chrom,1);
chrom1=chrom(:,[1:len]);
chrom2=chrom(:,[len+1:end]);
for i=1:2:m-1
    if pc>rand
        lin1=[randi(len),randi(len)];
        lin2=[randi(len),randi(len)];
        chrom1([i,i+1],min(lin1):max(lin1))=chrom1([i+1,i],min(lin1):max(lin1));
        chrom2([i,i+1],min(lin2):max(lin2))=chrom2([i+1,i],min(lin2):max(lin2));
    end
end
chrom=[chrom1,chrom2];

        
        
        
    