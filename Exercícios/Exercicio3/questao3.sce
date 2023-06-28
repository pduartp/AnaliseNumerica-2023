// Nome: Patrick Duarte - 2023 (Ciência da computação)

// #### Questão: 3 ####

function [x] = iterativo(A, b, k)
    // Número de linhas
    n = size(A,1);
    
    // Identidade da matriz A
    I = eye(A);
    
    // Inicializando x
    x = zeros(n,1);
    
    // i percorre ao número de passos (k)
    for i=1:k
        x = ((I + A) * x) - b;
    end
endfunction


clc

A = [
    -1.1   0.1;
     0.3  -0.3
];

b = [ 
    1;
    0
];


disp("Matriz Ab = ");
disp([A, b]);

[x] = iterativo(A, b, 100)

disp("x = ")
disp(x)
