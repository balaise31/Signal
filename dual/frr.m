function [y]=frr(t)
    y=t;
    y(t<0)=0;
    y(t>1)=2-t(t>1) ;
    y(t>2)=0;
end 