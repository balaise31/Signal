function [y] =filt_iir_I(xk,b,a)
    global mem_x ;
    global mem_y ;

    ma =0;
    
    for k = length(b):-1:2
        ma = ma + b(k)*mem_x(k-1);
        mem_x(k) = mem_x(k-1);
    end
    ma = ma + b(1)*xk;
    mem_x(1)  =xk;
    
    ar = ma;
    for k = length(a):-1:2
        ar = ar - a(k)*mem_y(k-1);
        mem_y(k) = mem_y(k-1);
    end
    mem_y(1) = ar;
    y = ar;

end