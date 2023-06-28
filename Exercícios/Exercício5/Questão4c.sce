clc

// Dados de distância e velocidade
distancia = [0, 0.2, 0.3, 0.5, 0.8, 1.0];
velocidade = [80, 85, 88, 92, 85, 80];

// Número de pontos de dados
n = length(distancia);

// Matriz de Vandermonde
X = [ones(n, 1), distancia', distancia'.^2];

// Vetor de velocidades
y = velocidade';

// Cálculo dos coeficientes
coefs = (X'*X) \ (X'*y);

// Cálculo da velocidade esperada em d = 1.1
d = 1.1;
velocidade_esperada = coefs(1) + coefs(2)*d + coefs(3)*d^2;

// Exibição dos resultados
disp("Coeficientes do polinômio de segundo grau:");
disp(coefs);
disp("Velocidade esperada em d = 1.1:");
disp(velocidade_esperada);


