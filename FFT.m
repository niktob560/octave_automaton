#!/bin/octave

format short g

global x
global N

x = input('Type vals [x0, x1, x2,...]: ');
fs = input('fs: ');

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
    X = round(X1 + X2);
    if (X == -0)
        X = 0;
    end
    printf("%s\n", num2str(X));
end

X = [];

for z = 0:N-1
    Xi = Xm(z);
    X = [X Xi];
    printf(">>>Xm(%d) = %s\n\n", z, num2str(Xi));
endfor


printf("\nampls:\n");

A = [];
Ai = [];

for z = 0:N-1
    t = abs(X(z + 1)) / (N / 2);
    A = [A t];
    Ai = [Ai, z * fs / N];
    printf("A(%d) = |%s| * 2 / N = %d\n", z * fs / N, num2str(X(z + 1)), t);
endfor

printf("\nphases(deg):\n");

F = [];
Fi = [];

for z = 0:N-1
    t = arg(X(z + 1)) * 180 / pi;
    F = [F t];
    Fi = [Fi, z * fs / N];
    printf("F(%d) = arg(%s) * 180 / pi = %d\n", z * fs / N, num2str(X(z + 1)), t);
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
