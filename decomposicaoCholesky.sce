/* A decomposição Cholesky é uma técnica numérica que permite decompor uma matriz simétrica e definida positiva em um produto de duas matrizes: uma matriz triangular inferior e sua transposta conjugada, também conhecida como matriz triangular superior. Essa decomposição é utilizada em várias aplicações, incluindo a resolução de sistemas lineares, a análise de regressão e a simulação de Monte Carlo.

A decomposição Cholesky é especialmente útil para resolver sistemas lineares, pois a matriz resultante da decomposição é mais fácil de resolver do que a matriz original. Além disso, a decomposição Cholesky é mais rápida e mais estável numericamente do que outras técnicas de decomposição, como a decomposição LU.

A decomposição Cholesky é denominada em homenagem ao matemático André-Louis Cholesky, que a desenvolveu em 1910 enquanto trabalhava em problemas de geodesia e cartografia().*/

clc

// funcao decomposicaoCholesky que recebe como entrada uma matriz OBRIGATORIAMENTE QUADRADA
function [L] = decomposicaoCholesky(A);
    [n, m] = size(A); 
    Atrans = A';
    
    disp("Matriz transposta =");
    disp(Atrans);
    
    symetric_mat = 1;
    // TODO: Uma matriz simétrica é uma matriz que é igual à sua transposta.
    for i = 1:m
        for j = 1:n
            if A(i,j) ~= Atrans(i,j) then
                symetric_mat = 0;
            end
        end
    end
    
    // Verificando se a matriz é definida positiva
    def_pos = 1;
    for i = 1:size(A, "r")
        if det(A(1:i, 1:i)) <= 0 then
            def_pos = 0;
            break;
        end
    end
    
    /*if def_pos then
        error("A matriz é definida positiva.")
    else
        error("A matriz não é definida positiva.")
    end*/ 
    
    // Verifica se a matriz é simétrica e definida positiva
    if (symetric_mat == 0) || (def_pos == 0) then
        error("A matriz não é definida positiva e não transpsota");
    end

    for j = 1:n
        for i = j:n
            if i == j
                // Cálculo dos elementos da diagonal principal de L
                L(i, j) = sqrt(A(i, i) - sum(L(i, 1:j-1).^2));
            else
                // Cálculo dos elementos fora da diagonal principal de L
                L(i, j) = (A(i, j) - sum(L(i, 1:j-1).*L(j, 1:j-1))) / L(j, j);
            end
        end
    end

// Retorna a matriz triangular inferior L, que é a decomposição Cholesky de A
endfunction

disp("## Entrada de uma matriz QUADRADA ##");
disp(A);

//Ex:
A = [
    4 12 -16; 
    12 37 -43; 
    -16 -43 98
    ];

b = [
    1,
    4,
    5
5];

// Met. já pronto: Retorna uma matriz triangular superior (pra cima) ???
l = chol(A);
[L] = decomposicaoCholesky(A);

disp("(chol) Matriz triangular superior: ");
disp(l);

disp("(decomposicaoCholesky) Matriz triangular infeiror: ");
disp(L);
