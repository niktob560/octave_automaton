#!/bin/octave

format short g

global x
global N

x = input('Type vals [x0, x1, x2,...]: ');

N = columns(x);

function W = Wn(n)
    W = e^(-2 * pi * i / n);
endfunction

function X = Xm(m)
    global N
    global x
    X1 = 0;
    X2 = 0;
    Wn2m = Wn(N/2)^m;
    Wnm = Wn(N)^m;
    printf("X(%d) = ", m);
    for n = 0:(N/2)-1
        printf("%d * %s^%d", x(2 * n + 1), num2str(Wn2m), n);
        if (n < (N/2) - 1)
            printf(" + ");
        endif
    endfor
    printf(" + %s * (", num2str(Wnm));
    for n = 0:(N/2)-1
        printf("%d * %s^%d", x(2 * n + 2), num2str(Wn2m), n);
        if (n < (N/2) - 1)
            printf(" + ");
        endif
    endfor
    printf(") = ");
    for n = 0:(N/2)-1
        t = x(2 * n + 1) * Wn2m^n;
        X1 += t;
    endfor
    for n = 0:(N/2)-1
        t = x(2 * n + 2) * Wn2m^n;
        X2 += t;
    endfor
    printf("%s + %s * %s = ", num2str(X1), num2str(Wnm), num2str(X2));
    X2 *= Wnm;
    X = X1 + X2;
    if (X < 1e-15)
        X = 0;
    endif
    printf("%s\n", num2str(X));
endfunction

X = [];

for i = 0:N-1
    Xi = Xm(i);
    X = [X Xi];
    printf(">>>Xm(%d) = %s\n\n", i, num2str(Xi));
endfor


printf("\nampls:\n");

for i = 0:N-1
    printf("A(%d) = %d\n", i, (abs(X(i + 1))));
endfor

printf("\nphases(deg):\n");

for i = 0:N-1
    printf("F(%d) = %d\n", i, (arg(X(i + 1)) * 180 / pi));
endfor


