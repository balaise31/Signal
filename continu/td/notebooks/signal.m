function s = signal(texte)
    if texte = "u"
        s.func = @(t) (t>0)
        s.nom = "u"
        
    end