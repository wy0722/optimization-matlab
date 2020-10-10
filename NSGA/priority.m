function [rank,ret1,ret2]=priority(chrom,obj)%ÐòÖµ¼ÆËã
m=size(chrom,1);
rank=zeros(1,m);  
ret1=[];
ret2=[];
t=0;
for k=1:m
  if isempty(chrom)
     break
  end
  for i=1:size(chrom,1)
    for j=1:size(chrom,1)
        if ((obj(i,1)>obj(j,1))&&(obj(i,2)>=obj(j,2)))||((obj(i,1)>=obj(j,1))&&(obj(i,2)>obj(j,2)))
            alpha=0;
            break
        else
            alpha=1;
        end
    end
    if alpha==1
       t=t+1;
       ret1(t,:)=chrom(i,:);
       rank(t)=k;
       ret2(t,:)=obj(i,:);
    end
  end
  chrom=chrom(~ismember(chrom,ret1,'rows'),:);
  obj=obj(~ismember(obj,ret2,'rows'),:);
end

        
            
% for i=m:-1:2
%     for j=i:-1:2
%         if ((obj(j,1)<obj(j-1,1))&&(obj(j,2)<=obj(j-1,2)))||((obj(j,1)<=obj(j-1,1))&&(obj(j,2)<obj(j-1,2)))
%             chrom([j-1,j],:)=chrom([j,j-1],:);
%             obj([j-1,j],:)=obj([j,j-1],:);
%         end
%     end
%         if ((obj(m-i+1,1)<obj(m-i+2,1))&&(obj(m-i+1,2)<=obj(m-i+2,2)))||((obj(m-i+1,1)<=obj(m-i+2,1))&&(obj(m-i+1,2)<obj(m-i+2,2)))
%             rank(m-i+2)=rank(m-i+1)+1;
%         else
%             rank(m-i+2)=rank(m-i+1);
%         end
% end

            
   
            


