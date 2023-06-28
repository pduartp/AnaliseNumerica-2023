clc

// Dados de entrada
distancia = [0, 0.2, 0.3, 0.5, 0.8, 1.0];
velocidade = [80, 85, 88, 92, 85, 80];

// Ponto onde queremos interpolar
ponto_interpolacao = 0.4;

// Cálculo do Polinômio Interpolador
n = 2; // Grau do polinômio interpolador
x = distancia(1:n+1);
y = velocidade(1:n+1);

A = zeros(n+1, n+1);
B = zeros(n+1, 1);

for i = 1:n+1
    for j = 1:n+1
        A(i, j) = x(i)^(j-1);
    end
    B(i) = y(i);
end

coeficientes = A\B; // Resolvendo o sistema linear

// Avaliação do polinômio interpolador no ponto de interpolação
velocidade_aproximada = 0;
for i = 1:n+1
    velocidade_aproximada = velocidade_aproximada + coeficientes(i)*ponto_interpolacao^(i-1);
end

// Cálculo do Erro de Interpolação
x_interp = 0.4;
velocidade_real = coeficientes(1);

for i = 2:n+1
    velocidade_real = velocidade_real + coeficientes(i)*x_interp^(i-1);
end

erro_interp = abs(velocidade_real - velocidade_aproximada);

// Saída dos resultados

// i)
disp("Velocidade aproximada no ponto de interpolação: " + string(velocidade_aproximada));

// ii)
disp("Erro de interpolação no ponto de interpolação: " + string(erro_interp));

// iii) Verificação de multa
velocidade_maxima = 90;

if velocidade_aproximada <= velocidade_maxima then
    disp("O carro não será multado.")
else
    disp("O carro será multado.")
end
