// ### DECOMPOSIÇÃO LU
// TODO: Em álgebra linear, a decomposição LU é uma forma de fatoração de uma matriz não singular como o produto de uma matriz triangular inferior e uma matriz triangular superior. Às vezes se deve pré-multiplicar a matriz a ser decomposta por uma matriz de permutação.

// Fórmula = A = L * U

// Métodos prontos
// [L,U]= lu(A)
// [L,U,E]= lu(A)

clc

function [L, U] = decomposicaoLU(A);
// A função recebe uma matriz quadrada A como entrada e retorna as matrizes L, U
// onde A = L*U
// L é a matriz triangular inferior com diagonal de 1
// U é a matriz triangular superior
// P (não tem) é a matriz de permutação
    
    // Número de linhas e colunas
    [n, m] = size(A);
    
    // matriz de identidade  do tamanho de A
    L = eye(A);
    
    for j = 1 : (n - 1);
        pivo = A(j, j);
        for i = (j + 1) : m;
            fator = A(i, j) / pivo;
            L(i, j) = fator;
            A(i, :) = A(i, :) - fator * A(j, :);
        end; 
    end
    
    U = A;
endfunction

function x = solve_LU(A, b)
// A função recebe a matriz A e o vetor b, e retorna o vetor solução x do sistema de equações lineares

    [L, U] = decomposicaoLU(A); // Realiza a decomposição LU
    n = size(A, 1);
    
    // Resolve Ly = b para y usando substituição progressiva
    y = zeros(n, 1);
    for i = 1:n
        y(i) = b(i);
        for j = 1:i-1
            y(i) = y(i) - L(i,j) * y(j);
        end
    end
    
    // Resolve Ux = y para x usando substituição regressiva
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = y(i);
        for j = i+1:n
            x(i) = x(i) - U(i,j) * x(j);
        end
        x(i) = x(i) / U(i,i);
    end

endfunction

disp("## Entrada de uma matriz QUADRADA ##");

//Ex:
A = [
    3, 2, 4;
    1, 1, 2;
    4, 3, -2
];

b = [
    1,
    2,
    3
];

disp("Matriz A = ");
disp(A);

[L, U] = decomposicaoLU(A);

/*[l, u, p] = lu(A);

disp("l = ");
disp(l);

disp("u = ");
disp(u);


disp("p = ");
disp(´p);*/

disp('Matriz L:');
disp(L);

disp('Matriz U:');
disp(U);

disp('Matriz P:');
disp(P);

disp("Conferindo o algooritmo:");
disp("L * U = A");
disp(L * U);

disp("Encontrando a solução: ");
disp(solve_LU(A, b));
