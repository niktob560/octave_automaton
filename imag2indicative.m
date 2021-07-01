#!/bin/octave

pkg load symbolic

im = input('Imaginary value (for ex 2+6*i):');

r = abs(im);
F = arg(im);
in = r * e^(i*F);

printf('Indicative form:\n');
printf('z = r * e^(i*F) = |%s| * e^(i * arg(%s))\n', num2str(im), num2str(im));
printf('z = %s * e^(%s)\n', num2str(r), num2str(i*F));
printf('z = %s\n', num2str(r * e^(i*F)));

