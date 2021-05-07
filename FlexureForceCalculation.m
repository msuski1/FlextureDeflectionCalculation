close all;
clear all;
% This program calculates the force needed to activate the flexture for the
% known parameters of the part

h = 0.001;
b = 0.000:0.00025:0.005;
l = 0.020:0.0005:0.030;
d = 0.003;
E = 2*10^9;
Sy = 30*10^6;


for i = 1:21
    for j = 1:21
        I = h*b(i)^3/12;
        f(j,i) = d*3*E*I/l(j)^3;
        Stress(j,i) = f(j,i)*l(j)*h/2/I;
    end
end

surf(b,l,f);
xlabel('b (mm)');
ylabel('l (mm)');
zlabel('force (N)');
title('Deflection Force of Flexture');
set(gcf,'color','w');

figure;
surf(b,l,Stress);
xlabel('b (mm)');
ylabel('l (mm)');
zlabel('Stress (MPa)');
title('Stress of Flexture');
set(gcf,'color','w');
