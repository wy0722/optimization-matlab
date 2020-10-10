function [xnext,ynext]=AF_follow(x,state,visual,step,delta,try_number,lb,ub)
xi=x(state,:);
d=AF_dist(xi,x);
index=find(d>0&d<visual);
nf=length(index);
if nf>0
    xx=x(index,:);
    for k=1:nf
        yy(k)=AF_food(xx(k,:));
    end
    [ymax,optindex]=max(yy);
    xmax=xx(optindex,:);
    yi=AF_food(xi);
    if ymax/nf>delta*yi
        xnext=xi+rand*step*(xmax-xi)/norm(xmax-xi);
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