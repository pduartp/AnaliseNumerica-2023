clc

// Dados de entrada
data = [1999, 2000, 2001, 2002, 2002];
numeros = [4.300, 2.200, 36.500, 41.600, 42.700];

// Tamanho dos dados
n = length(data);

// Cálculo das somas
sum_x = sum(data);
sum_y = sum(numeros);
sum_x2 = sum(data.^2);
sum_x3 = sum(data.^3);
sum_x4 = sum(data.^4);
sum_xy = sum(data .* numeros);
sum_x2y = sum(data.^2 .* numeros);

// Montagem do sistema de equações
A = [n, sum_x, sum_x2; sum_x, sum_x2, sum_x3; sum_x2, sum_x3, sum_x4];
B = [sum_y; sum_xy; sum_x2y];

// Resolução do sistema de equações
coeff = A \ B;

// Estimativa para fevereiro de 2001
mes_2001_2 = 2001; // Fevereiro
estimativa_fevereiro_2001 = coeff(1) + coeff(2) * mes_2001_2 + coeff(3) * mes_2001_2^2;

// Resultado
disp("Estimativa para o número de infectados em fevereiro de 2001: " + string(estimativa_fevereiro_2001));


