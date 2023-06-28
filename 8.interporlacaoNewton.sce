// ALGORTIMO: INTERPOLACAO DE NEWTON

// ENTRADA: Vetores coluna x e y dos pares de pontos da função a ser
//          interpolada e o ponto p onde a função interpoladora será
//          avaliada.


// Saida: Valor S da função avaliada no ponto p

clc

function [T] = Diferenca(vetX, vetY);
    tamX = length(vetX);
    
    // Vai variar na linha e fixar na coluna
    T(:, 1) = vetY;
    
    for (j = 2 :tamX)
        for (i = 1 : (tamX - j + 1))
            T(i, j) = (T(i + 1, j - 1) - T(i, j - 1)) / (vetX(i + j - 1) - vetX(i));
        end
    end
    
endfunction


function [S] = interpolacaoNewton(vetX, vetY, T, p);
    tamX = length(vetX);
    S = ones(3, 1);
    
    [T] = Diferenca(vetX, vetY);
    disp("Diferenca T = "); disp(T);
    
    for (i = 2 : tamX)
        M = 1;
        for (j = 1 : (i - 1))
                M = M * (p - vetX(j));
        end
        
        S = S + M * T(1, i);
    end
endfunction

// Entradas

vetX = [
    1;
    2;
    3;
];

vetY = [
    1.5708;
    1.5719;
    1.5739;
];

// Valor a ser interpolado
p = 2.5

[S] = interpolacaoNewton(vetX, vetY, T, p);
disp("S = "); disp(S);
