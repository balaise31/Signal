eps=1e-4;

global dt=1e-2;

u = @(t) min(1,max(0,(t+dt)/(dt*2)));
r = @(t) (t>0).*t;
a = @(t) (t>0).*t.^2/2;

OpD_Dt = @(f,dt) (@(t) ((f(t+eps).-f(t-eps))./(2*eps))) ;


function vals = derivee_vect(f,t)
    global dt
    vals = ((f(t+dt).-f(t-dt))./(2*dt));
end
OpD = @(f) (@(t)derivee_vect(f,t));


function vals = primitive_zero_vect(f,t)
    global dt
    vals = t;
    id=1;

    for tps=t
        tt =  0:dt:tps ;
        if length(tt)<1
            vals(id) = 0;
        else
            vals(id)=sum(f(tt))*dt;            
        end
        id = id +1;
    end
end
OpI = @(f) (@(t) primitive_zero_vect(f,t));

OpT = @(f,a) (@(t) (f(t-a)));