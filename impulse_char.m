#!/bin/octave

format long g

a = input('Type a in format [a0, a1, a2, ...]: ');
b = input('Type b in formbt [b0, b1, b2, ...]: ');
N = input('counts: ');

%% output
global y
y = [];

%% impulse input
function ret = x(n)
    if (n == 0)
        ret = 1;
    else
        ret = 0;
    end
end

function ret = Y(n)
    if (n < 0)
        ret = 0;
    else
        global y
        ret = y(n + 1);
    end
end

for z = 0:N
    global y
    y(z + 1) = 0;
    printf("y(%d) = 0", z);
    for j = 1:columns(a)
        y(z + 1) += a(j) * x(z - (j - 1));
        printf(" + %d * x(%d - %d)", a(j), z, j-1);
    end
    for j = 1:columns(b)
        y(z + 1) -= b(j) * Y(z - j);
        printf(" - %d * %d", b(j), Y(z - j));
    end
    printf(" = %d \n", y(z + 1));
end

printf("y = [");
for z = 1:columns(y)
    printf("%d", y(z));
    if (i < columns(y))
        printf(", ");
    end
end
printf("]\n");


isplot = input('show plot?[yN]', 's');
if isplot == 'y'
    plot([0:N], y);
    grid on;
    input('','s');
end
