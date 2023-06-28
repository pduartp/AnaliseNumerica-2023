// Linearização

clc

// Dados iniciais

xi = [0 : 1 : 5]';


yi = [1.0 2.0 2.5 4.0 8.0 20.0]';

// Calcula o logaritmo de cada elemento de yi (linearização)
vetLnY = log(yi);

// Mínimos quadrdos
vet = [ones(xi) xi];

a = (vet' * vet) \ (vet' * vetLnY);

// Encontrando os coeficientes
A = exp(a(1));

// Gráfico dos pontos
plot(xi, yi, 'ro');

// Gráfico da função ajustada
xx = [0 : 0.1 : 5];

yy = A * exp(a(2) ** xx);

plot(xx, yy, 'b-')
