clc

// Dados de entrada
data = [1999, 2000, 2001, 2002, 2002];
numeros = [4.300, 2.200, 36.500, 41.600, 42.700];

// Função para calcular o polinômio interpolador de Lagrange
function p = lagrange_interpolation(x, data, numeros)
    n = length(data);
    p = 0;

    for i = 1:n
        L = 1;

        for j = 1:n
            if j != i
                L = L * (x - data(j)) / (data(i) - data(j));
            end
        end

        p = p + L * numeros(i);
    end
end

// Ajuste de polinômio de grau 2 usando o método dos mínimos quadrados
X = [ones(length(data), 1), data', data'.^2];
coeff = X \ numeros';

// Estimativa para fevereiro de 2001 usando o polinômio de Lagrange
mes_2001_2 = 2001; // Fevereiro
estimativa_fevereiro_2001_lagrange = lagrange_interpolation(mes_2001_2, data, numeros);

// Estimativa para fevereiro de 2001 usando o polinômio de regressão
estimativa_fevereiro_2001_regressao = coeff(1) + coeff(2) * mes_2001_2 + coeff(3) * mes_2001_2^2;

// Erro quadrático médio (RMSE) entre as estimativas
erro_estimativa = sqrt((estimativa_fevereiro_2001_lagrange - estimativa_fevereiro_2001_regressao)^2);

// Resultado
disp("Erro de aproximação estimado: " + string(erro_estimativa));


