#!/bin/octave
fprintf('Wait...');
pkg load symbolic;

syms x;
f = input('Type integrative expr with X variable: ', 's');
integrated = int(f,x);

disp([integrated]);

isplot = input('draw plot?[yn] ', 's');
if isplot == 'y'
    a = input('Type left border: ');
    b = input('Type right border: ');
    fplot(f, [a; b]);
    input('','s');
end
