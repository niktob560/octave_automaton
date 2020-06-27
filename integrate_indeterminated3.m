#!/bin/octave
fprintf('Wait...');
pkg load symbolic;

syms x y z;
f = input('Type integrative expr with x,y,z variables: ', 's');
xa = input('x,bottom ');
xb = input('x,top    ');
ya = input('y,bottom ');
yb = input('y,top    ');
za = input('z,bottom ');
zb = input('z,top    ');

i1 = int(f, z);
disp([i1]);
f1 = subs(i1, z, zb) - subs(i1, z, za);
disp([f1]);
i2 = int(f1, y);
disp([i2]);
f2 = subs(i2, y, yb) - subs(i2, y, ya);
disp([f2]);
i3 = int(f2, x);
f3 = subs(i3, x, xb) - subs(i3, x, xa);
disp([f3]);

