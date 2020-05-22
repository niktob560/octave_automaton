#!/bin/octave

global D = 0.2;
global R = D / 2;
global L = 0.2;
global N = 100;
global m0 = 4 * pi * 10^-7;
global I = 5;

function B = getInd(coord)
    global D;
    global R;
    global L;
    global N;
    global m0;
    global I;

    alpha = pi - atan(R / ((L/2) + coord));
    beta = pi - atan(R / (coord - (L/2)));
    B = (m0 / 2) * ((N * I) / (L/2)) * (cos(beta) - cos(alpha));
endfunction

coords = [-1:0.01:1];
inds = arrayfun(@getInd, coords);
plot(coords, inds);
