function [chrom,obj]=immigrant(chrom,obj)
mp=length(chrom);
for i=1:mp
   next=i+1;
   if next>mp
       next=1;
   end
   [~,index1]=max(obj{i,1});
   [~,index2]=min(obj{next,1});
   chrom{next,1}(index2,:)=chrom{i,1}(index1,:);
   obj{next,1}(index2,:)=obj{i,1}(index1,:);
end

   