function [out] = Wizualizacja(A, a, b, c, d, n, m)
% Funkcja wizualizacja zwraca out - obrazowo przedstawioną macierz, który
% przedstawia liczbę wykonanych iteracji w metodzie Halleya dla przybliżeń
% początkowych będących punktami siatki [a, b] x [c, d]
% parametry a, b, c, d, n, m: [a, b] x [c, d] wymiar obszaru prostokąta, na
% którym tworzymy siatkę punktów (xi, yj), gdzie xk należy do [a, b] i 
% yj należy do [c, d],  xk=a+kh1, k=0,...,n, yj=c+jh2, j=0,...,m,
% h1=(b−a)/n, h2= (d−c)/m
% Gdy mamy mniej niż 7 parametrów zwracamy NaN.

if nargin<7
    out= NaN;
    return
end

h1=(b-a)/n;
h2=(d-c)/m;
S=cell(m+1, n+1);
for i=1:(m+1)
    for j=1:(n+1)
        S{i, j}=[a+h1*(j-1), d-(i-1)*h2];
    end
end
M=zeros(m+1, n+1);
for k=1:(m+1)
    for j=1:(n+1)
        x0=S{k, j}(1)+1i*S{k, j}(2);
        hal=Halley_method(A, x0);
        M(k,j)=hal(2);
    end
end
M
out=imagesc([a, b], [c, d], M)
%out=imagesc(M);
colorbar;
end