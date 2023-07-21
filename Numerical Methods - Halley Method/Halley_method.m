function [out] = Halley_method(A, x0, tol, N)
% Funkcja Halley_method szuka miejsca zerowego wielomianu za pomocą metody
% Halleya i zwraca out - liczba wykonanych iteracji do znalezienia szukanego miejsca
% zerowego, (jeśli go nie znajdzie w ciągu N iteracji to zwraca N+1)
% parametr A - parametr A - (n+1)-elementowy wektor liczb (zespolonych) 
% an, a(n-1), ..., a0 (współczynniki wielomianu)
% gdzie ai=A(i+1)
% parametr x0 - przybliżenie początkowe
% W przypadku błędu (niepoprawnych danych) lub nieznalezienia miejsca zerowego zwracany jest NaN
% tol-dokładność potrzebna do warunku stopu
% N-maksymalna ilość Iteracji
% Gdy mamy mniej niż 2 parametry zwracamy NaN.

% UWAGA możemy sprawdzić czy dobrze wyznaczyliśmy miejsce zerowe porównując
% działanie metody z wynikiem funkcji roots

if nargin<2
    out= NaN;
    return
end

if nargin == 2
    tol = 10^(-2);
    %maksymalana ilość iteracji
    N=30;
end



i=1;

while i<=N
    hResult=Horner(A, x0);
    w=hResult(1);
    p=hResult(2);
    r=hResult(3);
    x=x0-(w./(p-((r.*w)./(2.*p))));
    % Warunek stopu 
    if abs(x-x0)<tol
         break;     
    end
    x0=x;
    i=i+1;
end

% wyznaczone miejsce zerowe
%display(x)
% wyznaczone pierwiastki wielomianu za pomocą funkcji roots (porównanie czy
% dobrze znaleźliśmy pierwiastek)
pierwiastki=roots(A)

% zwracamy liczę wykonanych iteracji potrzebną do utworzenia macierzy
% wykorzystywanej do wizualizacji
out=[x, i];
end