clc

// Função para calcular o Polinômio Interpolador de Grau Dois e a estimativa de erro
function [y_interp, erro] = polinomioInterpoladorGrauDois(x, y, xx)
    // Verifica se os vetores x e y têm o mesmo tamanho
    if length(x) ~= length(y) then
        error("Os vetores x e y devem ter o mesmo tamanho!");
    end

    // Número de pontos de interpolação
    n = length(x);

    // Calcula as diferenças divididas
    for i = 1:n-1
        h(i) = x(i+1) - x(i);
        delta(i) = (y(i+1) - y(i))/h(i);
    end

    // Calcula as diferenças divididas de segunda ordem
    for i = 1:n-2
        delta2(i) = (delta(i+1) - delta(i))/(x(i+2) - x(i));
    end

    // Calcula o valor interpolado
    y_interp = y(1) + delta(1)*(xx - x(1)) + delta2(1)*(xx - x(1))*(xx - x(2));

    // Calcula a estimativa de erro
    M = max(abs(delta2));
    erro = M*abs(xx - x(1))*abs(xx - x(2));
end

// Ponto x
x = [
    79; 
    69; 
    82; 
    63; 
    73
];

// Ponto y
y = [
    183; 
    173; 
    188; 
    163; 
    178
];

// Valor a ser interpolado
xx = 70;

// Chama a função para calcular o valor interpolado e a estimativa de erro
[y_interp, erro] = polinomioInterpoladorGrauDois(x, y, xx);

// Exibe o resultado
disp("O valor interpolado é:");
disp(y_interp);
disp("A estimativa de erro é:");
disp(erro);
