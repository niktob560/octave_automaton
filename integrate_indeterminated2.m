#!/bin/octave
fprintf('Wait...');
pkg load symbolic;

syms x y;
f = input('Type integrative expr with x,y variables: ', 's');
xa = input('x,bottom ');
xb = input('x,top    ');
ya = input('y,bottom ');
yb = input('y,top    ');

i1 = int(f, y);
disp([i1]);
f1 = subs(i1, y, yb) - subs(i1, y, ya);
disp([f1]);
i2 = int(f1, x);
disp([i2]);
f2 = subs(i2, x, xb) - subs(i2, x, xa);
disp([f2]);

