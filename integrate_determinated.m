#!/bin/octave
pkg load symbolic

ysym = input('print integral: ', 's');
acc = input('print accuracy(1e-7 for example): ');
a = input('print left limit: ');
b = input('print right limit: ');


[result, cycles] = quad(ysym, a, b, acc);
disp(['result: ', num2str(result), '; cycles: ', num2str(cycles)])


isplot = input('show plot?[yn]', 's');
if isplot == 'y'
    fplot(ysym, [a; b]);
    input('','s');
end
