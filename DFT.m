#!/bin/octave

format short g

global x
global N

x = input('Type vals [x0, x1, x2,...]: ');
fs = input('fs: ');

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
    X = round(X);
    printf(" = %s\n", num2str(X));
endfunction

X = [];

for i = 0:N-1
    Xi = Xk(i);
    X = [X Xi];
    printf(">>>X_K(%d) = %s\n\n", i, num2str(Xi));
endfor

printf("\nampls:\n");

A = [];
Ai = [];

for i = 0:N-1
    t = abs(X(i + 1)) / (N / 2);
    A = [A t];
    Ai = [Ai, i * fs / N];
    printf("A(%d) = |%s| * 2 / N = %d\n", i * fs / N, num2str(X(i+1)), t);
endfor

printf("\nphases(deg):\n");

F = [];
Fi = [];

for i = 0:N-1
    t = arg(X(i + 1)) * 180 / pi;
    F = [F t];
    Fi = [Fi, i * fs / N];
    printf("F(%d) = arg(%s) * 180 / pi = %d\n", i * fs / N, num2str(X(i + 1)), t);
endfor

isplot = input('show amplitude spectre?[yN]', 's');
if isplot == 'y'
    plot(Ai, A, "*");
    grid on;
    input('press enter to continue','s');
end

isplot = input('show phase spectre?[yN]', 's');
if isplot == 'y'
    plot(Fi, F, "*");
    grid on;
    input('press enter to continue','s');
end

