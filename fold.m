#!/bin/octave

format long e

global h
global x
h = input('Type h(n) in format [h0,h1,h2...]: ');
x = input('Type x(n) in format [x0,x1,x2...]: ');

global P
global Q
P = columns(h);
Q = columns(x);

function ret = H(k)
    global h
    global P
    if (k >= 0 && k < P)
        ret = h(k+1);
    else
        ret = 0;
    endif
endfunction

function ret = X(k)
    global x
    global Q
    if (k >= 0 && k < Q)
        ret = x(k+1);
    else
        ret = 0;
    endif
endfunction


function ret = y(n)
    ret = 0;
    global P
    global Q
    printf("\n\t>>>n=%d<<<\n", n);
    for i = 0:(P + Q - 2)
        ret = ret + H(i) * X(n - i);
        printf("H(%d) = %d;\tX(%d) = %d\n", i, H(i), n - i, X(n-i));
    endfor
endfunction

t = -1;
i = 0;
Y = [];
while (t != 0)
    t = y(i);
    Y = [Y; t];
    printf("\ty(%d) = %d\n", i, t);
%    disp([i, t]);
    i++;
endwhile

