#!/bin/octave

format long e

A = input('Type table in format [[value,probability];[value,probability];...]: ');

global M_x = 0
for z = 1:rows(A)
    global M_x
    M_x = M_x + (A(z,1) * A(z,2));
endfor

disp(M_x)
