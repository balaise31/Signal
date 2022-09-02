function self = base(primal, dual, type="Fourier")
    self.p.v = transpose(vec2arg(primal));
    self.p.d = self.p.v(2)-self.p.v(1);
    self.d.v = vec2arg(dual);
    self.d.d = self.d.v(2)-self.d.v(1);
    self.type = type;
    
    if strfind(self.type,"Fourier")
        self.M = exp(i*2*pi*self.p.v*self.d.v);
        self.p.label=('Temps t [s]');
        self.d.label=('Frequence f [Hz]');       

    elseif strfind(self.type,"Temporelle")
        self.M = eye(min(length(self.p.v),length(self.d.v)));
        self.p.label=('Temps t [s]');
        self.d.label=('Temps tau [s]');
    
    elseif strfind(self.type,"sinc")
        self.M = sinc((self.p.v-self.d.v)/self.d.d)*self.d.d;
        #self.M = self.M-mean(self.M);
        #self.M = self.M/sqrt(mean(sum(abs(self.M).^2)));
        #self.M = self.M-mean(self.M);
        
        self.p.label=('Temps t [s]');
        self.d.label=('Temps tau [s]');
    end
    
    self.voir = @() voir(self);
    self.voir3d = @() voir3d(self);
    self.echantillonne = @echantillonne;
    self.decompose = @(vp) decompose(self,vp);
    self.recompose = @(vd) recompose(self,vd);
    
end

function voir(self)
    imagesc(self.p.v,self.d.v,real(self.M')); 
    xlabel('temps t');
    ylabel('frequences [Hz]');
    title(['Base ',self.type])
end

function voir3d(self)
    unsp = (self.p.v==self.p.v);
    unsd = (self.d.v==self.d.v);
   
    plot3(self.p.v*unsd,unsp*self.d.v,self.M);
    xlabel(self.p.label);
    ylabel(self.d.label);
    zlabel('amplitude [V]');
    view([-45,-90,45])
    title(['Base ',self.type])
end

function v = echantillonne(self, f)
    v = feval(f,self.p.v);
    return
end

function vd = decompose(self, vp)
    vd = self.M' * vp;
    return
end

function vp = recompose(self, vd)
    vp = self.M * vd;
    return
end

function vec = vec2arg(arg)
    if length(arg)==1
        vec = (0:(arg-1))-(arg-1)/2;
    elseif length(arg)==2
        vec = ((0:(arg(1)-1))-(arg(1)-1)/2)*arg(2);
    end
    
    return 
    
end

