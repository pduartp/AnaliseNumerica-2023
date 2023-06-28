clc

// Função para calcular o Polinômio Interpolador de Grau Dois
function y_interp = polinomioInterpoladorGrauDois(x, y, xx)
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
end

// Chama a função para calcular o valor interpolado
y_interp = polinomioInterpoladorGrauDois(x, y, xx);

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

// Exibe o resultado
disp("O valor interpolado é:");
disp(y_interp);
