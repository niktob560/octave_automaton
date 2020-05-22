#!/bin/octave
pkg load symbolic

syms x;

ysym = input('print curve formula: ', 's');
a = input('print left x limit: ');
b = input('print right x limit: ');
df = diff(ysym, x);
disp('diff:');
disp(df);
global lenfun = int(sqrt(1 + (df)^2));
disp('len function: ');
disp(sym(lenfun));

len(x) = lenfun;

left = len(a);
right = len(b);
len = abs(right - left);
disp('len: ');
disp(len);
disp(double(len));

