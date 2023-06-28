// IMPLEMENTAÇÃO DO ALGORITMO DE POLIMÕNIO DE LAGRANGE

clc

// Dados de entrada: x, y e o xx = valor a ser interpolado

x = [-1 0 2 5 6 8 9]
y = [4 1 -1 -5 -6 -5.5 2]

xx = 1.0
[m, n] = size(x)
s = 0

produtorio = 0

for (i = 1 : n)
    produtorio = y(i)
    for (j = 1: n)
        if(i <> j) then
            produtorio = produtorio * (xx - x(j)) / (x(i) - x(j))
        end
    end
    
    s = s + produtorio 
end

disp("Imagem interpolada: ")
disp(s)
