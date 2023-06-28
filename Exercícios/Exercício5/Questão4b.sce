clc

distancia = [0, 0.2, 0.3, 0.5, 0.8, 1.0];
velocidade = [80, 85, 88, 92, 85, 80];

// Calcular as médias das distâncias e velocidades
mean_dist = mean(distancia);
mean_vel = mean(velocidade);

// Calcular os valores para os mínimos quadrados
Sxx = sum((distancia - mean_dist).^2);
Sxy = sum((distancia - mean_dist) .* (velocidade - mean_vel));

// Calcular os coeficientes da reta
m = Sxy / Sxx;
b = mean_vel - m * mean_dist;

// Calcular a velocidade esperada em d = 1.1
d = 1.1;
vel_esperada = m * d + b;

disp("A equação da reta é: y = " + string(m) + "x + " + string(b));
disp("A velocidade esperada em d = 1.1 é aproximadamente " + string(vel_esperada) + " km/h.");

