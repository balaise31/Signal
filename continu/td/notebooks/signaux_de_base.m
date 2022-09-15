eps=1e-4;

global dt = 1e-2; %pas utilisé pour les calculs
Te = 10*dt; % période d'échantillonnage pour affichage
t = -2:Te:6;

% Fonction constante
c = @(t) t==t;

% définition de l'échelon u (continue au pas dt)
u = @(t) min(1,max(0,(t+dt)/(dt*2)));

% définition de la rampe r
r = @(t) (t>0).*t;

% définition de la rampe d'accélération a
a = @(t) (t>0).*t.^2/2;

% opérateur dérivé 
% OpD(function) -> fonction
function vals = derivee_vect(f,t)
    global dt
    vals = ((f(t+dt).-f(t-dt))./(2*dt));
end
OpD = @(f) (@(t)derivee_vect(f,t));

delta_0 = OpD(u);

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