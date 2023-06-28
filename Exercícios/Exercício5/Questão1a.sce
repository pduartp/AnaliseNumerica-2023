clc

/*
Esse código define uma função chamada interpolacaoLagrange que recebe 
os pontos x e y e o valor xx para interpolar. O algoritmo percorre cada
ponto de x e calcula o polinômio de Lagrange correspondente. Em 
seguida, multiplica o valor y do ponto pelo polinômio de Lagrange e 
soma ao valor interpolado. No final, o valor interpolado é exibido 
no console.
*/

function y_interp = interpolacaoLagrange(x, y, xx)
    n = length(x) - 1;  // Grau do polinômio interpolador
    y_interp = 0;  // Valor interpolado inicializado
    
    for i = 1:n+1
        L = 1;  // Inicializa o polinômio de Lagrange para o ponto i
        
        for j = 1:n+1
            if i ~= j
                L = L * (xx - x(j)) / (x(i) - x(j));  // Atualiza o polinômio de Lagrange
            end
        end
        
        y_interp = y_interp + y(i) * L;  // Atualiza o valor interpolado
    end
    
    disp("Valor interpolado: ", y_interp);
end

// Pontos de entrada
x = [
    0.81; 
    0.83; 
    0.86; 
    0.87
    ];
y = [
    16.94410; 
    17.56492; 
    18.50515; 
    18.82091
    ];
xx = 0.84;

// Chamada da função de interpolação de Lagrange
interpolacaoLagrange(x, y, xx);
