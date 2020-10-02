clear all;
close all;
clc;
addpath('../funcs')
Fe=10;
Te = 1/Fe;
t=-1:Te:4;

e1 = @(t) frr(t) - frr(t-2);
e2 = @(t) frr(t) - frr(t-1);
e3 = @(t) frr(t);

Be = {e1(t),e2(t),e3(t)};

Tf1 = [1, -2, 1]
Pf1 = primal_de(Tf1,Be);
TTf1 = dual_de(Pf1,Be)
plot(t,Pf1);


