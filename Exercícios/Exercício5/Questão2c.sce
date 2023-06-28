clc

// Função para ajuste da curva por mínimos quadrados
function [alpha, beta] = ajusteMinimosQuadrados(x, y)
    // Monta a matriz A
    A = [sin(x)', cos(x)'];

    // Calcula a pseudo-inversa de A
    A_pseudo_inv = pinv(A);

    // Calcula os parâmetros alpha e beta
    parametros = A_pseudo_inv * y';
    
    // Separa os valores dos parâmetros
    alpha = parametros(1);
    beta = parametros(2);
endfunction

// Ponto x
x = [79, 69, 82, 63, 73];

y = [183, 173, 188, 163, 178];

// Chama a função para ajustar a curva e obter os parâmetros alpha e beta
[alpha, beta] = ajusteMinimosQuadrados(x, y);

// Exibe os valores dos parâmetros
disp("Os parâmetros do ajuste são:");
disp("Alpha (α):");
disp(alpha);
disp("Beta (β):");
disp(beta);

// Calcula a altura aproximada de uma pessoa com peso de 70 kg
altura_aproximada = alpha*sin(70) + beta*cos(70);

// Exibe a altura aproximada
disp("A altura aproximada de uma pessoa com peso de 70 kg é:");
disp(altura_aproximada);
