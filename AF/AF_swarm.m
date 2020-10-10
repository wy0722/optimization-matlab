function [xnext,ynext]=AF_swarm(x,state,visual,step,delta,try_number,lb,ub)
xi=x(state,:);
d=AF_dist(xi,x);
yi=AF_food(xi);
index=find(d>0&d<visual);
nf=length(index);
if nf>0
   if nf==1
      xc=x(index,:);
   else
   xc=mean(x(index,:));
   end
   yc=AF_food(xc);
   if yc/nf>delta*yi
       xnext=xi+rand*step*(xc-xi)/norm(xc-xi);
       for i=1:length(xnext)
            if xnext(i)>ub
                xnext(i)=ub;
            elseif xnext(i)<lb
                xnext(i)=lb;
            end
       end
       ynext=AF_food(xnext);
   else
       [xnext,ynext]=AF_prey(xi,visual,step,try_number,lb,ub);
   end
else
       [xnext,ynext]=AF_prey(xi,visual,step,try_number,lb,ub);
end
   
