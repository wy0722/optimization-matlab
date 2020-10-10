function [maxobj,maxchrom]=elindividual(chrom,obj,maxobj,maxchrom)
mp=length(chrom);
for i=1:mp
   [maxo,maxin]=max(obj{i,1});
   if maxo>maxobj(i,:)
       maxobj(i,:)=maxo;
       maxchrom(i,:)=chrom{i,1}(maxin,:);
   end
end