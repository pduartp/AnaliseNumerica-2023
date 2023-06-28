clc

/*
Este código irá calcular os coeficientes do polinômio interpolador de 
Lagrange usando o métod0 de diferenças divididas de Newton e, em 
seguida, avaliar o polinômio interpolador no ponto dado xx. Os 
resultados serão exibidos no console.
*/

// Função para calcular o coeficiente do polinômio interpolador de Lagrange
function coeficientes = coeficientesNewton(x, y)
    n = length(x) - 1;  // Grau do polinômio interpolador
    
    // Inicialização da tabela de diferenças divididas
    tabelaDD = zeros(n+1, n+1);
    tabelaDD(:,1) = y';
    
    // Cálculo das diferenças divididas
    for j = 2:n+1
        for i = j:n+1
            tabelaDD(i,j) = (tabelaDD(i,j-1) - tabelaDD(i-1,j-1)) / (x(i) - x(i-j+1));
        end
    end
    
    // Coeficientes do polinômio interpolador
    coeficientes = tabelaDD(n+1, 2:n+1);
    
    // Retornar os coeficientes calculados
    coeficientesNewton = coeficientes;
endfunction

// Função para avaliar o polinômio interpolador de Lagrange no ponto xx
function valorInterpolado = interpolaNewton(x, coeficientes, xx)
    n = length(coeficientes);  // Grau do polinômio interpolador
    
    // Inicialização do valor interpolado
    valorInterpolado = coeficientes(n);
    
    // Cálculo do valor interpolado usando a forma de Newton
    for i = n-1:-1:1
        valorInterpolado = coeficientes(i) + (xx - x(i)) * valorInterpolado;
    end
endfunction

// Pontos x e y
// Pontos de entrada
x = [
    0.81; 
    0.83; 
    0.86; 
    0.87
    ];
y = [
    16.94410; 
    17.56492; 
    18.50515; 
    18.82091
    ];
xx = 0.84;

// Valor para interpolar
xx = 0.84;

// Calcular coeficientes do polinômio interpolador de Lagrange
coeficientes = coeficientesNewton(x, y);

// Interpolar o valor xx usando os coeficientes calculados
valorInterpolado = interpolaNewton(x, coeficientes, xx);

// Exibir resultado
disp("Coeficientes do polinômio interpolador:");
disp(coeficientes);
disp("Valor interpolado:");
disp(valorInterpolado);

