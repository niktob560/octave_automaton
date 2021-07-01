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

for i = 0:N
    global y
    y(i + 1) = 0;
    printf("y(%d) = 0", i);
    for j = 1:columns(a)
        y(i + 1) += a(j) * x(i - (j - 1));
        printf(" + %d * x(%d - %d)", a(j), i, j-1);
    end
    for j = 1:columns(b)
        y(i + 1) -= b(j) * Y(i - j);
        printf(" - %d * %d", b(j), Y(i-j));
    end
    printf(" = %d \n", y(i + 1));
end

disp(y);


isplot = input('show plot?[yN]', 's');
if isplot == 'y'
    plot([0:N], y);
    grid on;
    input('','s');
end
