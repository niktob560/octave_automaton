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
    printf("\ny(%d) = ", n);
    for z = 0:(P + Q - 2)
        printf("h(%d) * x(%d - %d)", z, n, z);
        if (z < P + Q - 2)
            printf(" + ");
        end
    end
    printf("\ny(%d) = ", n);
    for z = 0:(P + Q - 2)
        printf("%d * %d", H(z), X(n - z));
        if (z < P + Q - 2)
            printf(" + ");
        end
        ret = ret + H(z) * X(n - z);
    end
    printf("\n");
end

t = -1;
i = 0;
Y = [];
for z = 1:P+Q-2
    t = y(z);
    Y = [Y, t];
    printf("\ty(%d) = %d\n", z, t);
    z++;
end

printf("y = [");
for z = 1:columns(Y)
    printf("%d", Y(z));
    if (z < columns(Y))
        printf(", ");
    end
end
printf("]\n");
