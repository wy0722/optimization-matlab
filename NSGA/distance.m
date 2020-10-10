function  d=distance(obj,rank)
a=max(rank);
for i=1:a
   p=find(rank==i);
   q1=obj(p,1);
   q2=obj(p,2);
   if i>=2
      symbol=symbol+length(find(rank==i-1));
   else 
      symbol=0;
   end
   for j=1:length(p) 
       if length(p)==1
           d(symbol+j)=100000;
       elseif length(p)==2
           d(symbol+j)=100000;
           d(symbol+j)=100000;
       else 
           if j==1
              d(symbol+j)=100000;
           elseif j==length(p)
              d(symbol+j)=100000;
           else  
              d1(j)=(q1(j+1)-q1(j-1))/(max(q1)-min(q1));
              d2(j)=(q2(j+1)-q2(j-1))/(max(q2)-min(q2));
              d(symbol+j)=d1(j)+d2(j);
           end
       end
   end
end
         