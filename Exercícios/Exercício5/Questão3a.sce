clc

// Definir os dados
data = [1999, 2000, 2001, 2002, 2002];
numeros = [4.300, 2.200, 36.500, 41.600, 42.700];

// Criar uma matriz com os valores x e y
x = data(3:5);   // Seleciona os valores correspondentes a 2001, 2002(1) e 2002(2)
y = numeros(3:5);

// Calcular as somas necessárias
n = length(x);
sum_x = sum(x);
sum_y = sum(y);
sum_xy = sum(x .* y);
sum_x2 = sum(x.^2);

// Calcular os coeficientes da reta de mínimos quadrados
a1 = (n * sum_xy - sum_x * sum_y) / (n * sum_x2 - sum_x^2);  // Coeficiente angular
a0 = (sum_y - a1 * sum_x) / n;  // Coeficiente linear

// Estimar o número de infectados em março de 2002
mes_marco_2002 = 2002;  // Mês de março de 2002
numero_infectados_marco_2002 = a0 + a1 * mes_marco_2002;  // Estima o número de infectados em março de 2002

disp("Estimativa de infectados em março de 2002:");
disp(numero_infectados_marco_2002);  // Exibe o resultado da estimativa

//Gráfico
// Cria um vetor com os valores x para plotagem da reta
x_plot = linspace(min(data), max(data), 100);

// Calcula os valores y correspondentes para plotagem da reta
y_plot = a0 + a1 * x_plot;

// Plota os dados originais como pontos
plot(data, numeros, 'g*');

// Plota a reta estimada
plot(x_plot, y_plot, 'r');

// Configurações do gráfico
title('Estimativa do Número de Infectados por Dengue');
xlabel('Ano');
ylabel('Número de Infectados');
legend('Dados Originais', 'Reta de Mínimos Quadrados', "in_lower_right");
