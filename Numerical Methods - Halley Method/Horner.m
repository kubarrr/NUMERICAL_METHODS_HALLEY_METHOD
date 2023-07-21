function [result] = Horner(A, x)

% W funkcji wykorzystałem algorytm Hornera podany na wykładzie, również w
% taki sam sposób oznaczałem zmienne.
% Funkcja Horner zwraca 3-elementowy wektor o wartościach (kolejno):
% -wartość wielomianu (w) w punkcie x
% -wartość pochodnej wielomianu (p) w punkcie x
% -wartość drugiej pochodnej wielomianu (2*r) w punkcie x
% parametr A - (n+1)-elementowy wektor liczb (zespolonych) a0, a1, ..., an,
% gdzie ai=A(i+1)
% parametr x - argument funkcji, dla którego liczymy dane wartości
% Gdy mamy mniej niż 2 parametry zwracamy NaN.


if nargin < 2
    result = NaN;
    return
end

%n=length(A); 
w=A(1);
%w=A(n);
p=w;
r=p;
n=length(A);

%szczególne przypadki gdy mamy wielomian stopnia 1 lub 2

if n==1
    result=[A(1), 0, 0];
    return
end

if n==2
    result=[A(1)*x+A(2), A(1), 0];
    return
end

for i=2:n-2
    w=A(i)+w.*x;
    p=w+p.*x;
    r=p+r.*x;
end
w=A(n-1)+w.*x;
p= w+ p .*x;  
w=A(n)+ w .* x;

%r=r.*x./x
%for i=n-1:-1:3
%    w = A(i) + w .* x;
%    p = w + p .* x;
%   r = p + r .* x;
%end

%w=A(2)+ w.*x;
%p= w+ p .*x;
%w=A(1)+ w .* x;

result=[w, p, 2.*r];
end