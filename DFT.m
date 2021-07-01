#!/bin/octave

format short g

global x
global N

x = input('Type vals [x0, x1, x2,...]: ');

N = columns(x);

function X = Xk(k)
    global N
    global x
    X = 0;
    printf("X(%d) = ", k);
    for n = 0:N-1
        t = x(n + 1) * e^(-2 * pi * i * k * n / N);
        printf("(%d*e^(-2*pi*i*%d*%d/%d) =", x(n+1), k, n, N);
        printf(" %s) ", num2str(t));
        if (n < N-1)
            printf("+ ");
        endif
        X += t;
    endfor
    if (X < 1e-15)
        X = 0;
    endif
    printf(" = %s\n", num2str(X));
endfunction

X = []

for i = 0:N-1
    Xi = Xk(i);
    X = [X Xi];
    printf(">>>X_K(%d) = %s\n\n", i, num2str(Xi));
endfor


printf("\nampls:\n");

for i = 0:N-1
    printf("A(%d) = %d\n", i, (abs(X(i + 1))));
endfor

printf("\nphases(deg):\n");

for i = 0:N-1
    printf("F(%d) = %d\n", i, (arg(X(i + 1)) * 180 / pi));
endfor

