#!/bin/octave

format long e

A = input('Type table in format [[value,probability];[value,probability];...]: ');

global M_x = 0
for i = 1:rows(A)
    global M_x
    M_x = M_x + (A(i,1) * A(i,2));
endfor

disp(M_x)
