function [xnext,ynext]=AF_prey(xi,visual,step,try_number,lb,ub)
[m,n]=size(xi);
xnext=[];
yi=AF_food(xi);%对食物浓度的理解
for i=1:try_number
    xj=xi+rand(m,n)*visual;
    yj=AF_food(xj);
    if yi<yj
        xnext=xi+rand*step*(xj-xi)/norm(xj-xi);
        for j=1:length(xnext)
            if xnext(j)>ub
                xnext(j)=ub;
            elseif xnext(j)<lb
                xnext(j)=lb;
            end
        end
        xi=xnext;
        break
    end
end
if isempty(xnext)
    xj=xi+rand(m,n)*visual;
    xnext=xj;
     for j=1:length(xnext)
            if xnext(j)>ub
                xnext(j)=ub;
            elseif xnext(j)<lb
                xnext(j)=lb;
            end
     end
end
ynext=AF_food(xnext);

    
                
    