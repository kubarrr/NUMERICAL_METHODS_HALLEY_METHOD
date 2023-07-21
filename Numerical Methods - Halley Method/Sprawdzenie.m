function [out] = Sprawdzenie(A, x)

% Funkcja sprawdza poprawność algorytmu Hornera, który wylicza wartość
% wielomianu, jego pierszej i drugiej pochodnej
% zwraca out - błędy danych wyników (w porównaniu z funkcjami wbudowanymi, polyval, polyder)
% parametr A - (n+1)-elementowy wektor liczb (zespolonych) an, a(n-1), ..., a0
% gdzie ai=A(i+1)
% parametr x - argument funkcji, dla którego liczymy dane wartości

w=Horner(A, x);
w2=polyval(A, x);
pochodna=polyder(A);
p2=polyval(pochodna, x);
pochodna2=polyder(pochodna);
r2=polyval(pochodna2, x);

b1=abs(w2-w(1));
b2=abs(p2-w(2));
b3=abs(r2-w(3));
blad=[b1, b2 b3];
out=blad;

end