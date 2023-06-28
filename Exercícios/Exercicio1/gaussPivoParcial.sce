// 2 - Resolvendo através da eliminação de Gauss com pivotamento parcial

clc();

// Definindo a matriz dos coeficientes e o vetor das constantes
a = [0.004, 15.73; 0.423, -24.72];
b = [15.77; -20.49];

// Obtendo as dimensões da matriz a
[m, n] = size(a);

// Eliminação de Gauss com pivotamento parcial
for k = 1:(n-1)
    
    // Procura o pivô da k-ésima coluna
    [pivot_val, pivot_row] = max(abs(a(k:m, k)));
    pivot_row = pivot_row + k - 1;
    
    // Troca as linhas k e pivot_row
    a([k, pivot_row], :) = a([pivot_row, k], :);
    b([k, pivot_row]) = b([pivot_row, k]);
    
    // Realiza a eliminação gaussiana
    for i = (k+1):m
        mult = a(i, k) / a(k, k);
        a(i, k:n) = a(i, k:n) - mult * a(k, k:n);
        b(i) = b(i) - mult * b(k);
    end
end

// Retrosubstituição para obter a solução
x = zeros(n, 1);
x(n) = b(n) / a(n, n);
for i = (n-1):-1:1
    x(i) = (b(i) - a(i, (i+1):n) * x((i+1):n)) / a(i, i);
end

// Imprimindo a solução
disp("Solução:");
disp(x);

/* A solução obtida é a mesma do algoritmo com pivotamento parcial, porém o método ingênuo não garante a estabilidade numérica em todos os casos, podendo levar a erros maiores em algumas situações. Por isso, é recomendável utilizar o método com pivotamento parcial quando possível*/
