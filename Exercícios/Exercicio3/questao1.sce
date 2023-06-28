// Nome: Patrick Duarte - 2023 (Ciência da computação)

// #### Questão: 1 ####

/* Aplique seu algoritmo do método de Gauss-Seidel ao problema proposto abaixo, utilize uma
tolerância de 10-5.Modifique seu algoritmo para que se faça as trocas de linhas necessárias para
que o método tenha convergência garantida. Compare seus resultados com aqueles obtidos por eliminação 
Gaussiana com pivotamento. */

clc;

// Todo: parâmetros de entrada: n, A, b, Toler, IterMax (ordem, matriz, vetor independente, tolerância e número maximo de iterações)

// Todo: Parâmetros de saída: x, Iter, Erro (vetor solução, número de iterações e condição de erro)
function [x, Iter, Erro] =  gauss_Seidel(n, A, b, Toler, IterMax)
    // Construção das matrizes para as iterações
    for i = 1 : n
        r = 1 / A(i, i)
        
        for j = 1 : n
            if i ~= j then
                A(i, j) = A(i, j) * r
            end
        end
        
        b(i) = b(i) * r
        x(i) = b(i)
    end
    
    // Interações de Gauss-Seidel
    for Iter = 1 : IterMax
        for i = 1 : n                    
            Soma = 0
            
            for j = 1 : n
                if i ~= j then
                    Soma = Soma + A(i, j) * x(j)
                end
            end
            
            v(i) = x(i)
            x(i) = b(i) - Soma
        end
        
        Norma1 = 0
        Norma2 = 0
        
        for i = 1 : n
            if abs(x(i) - v(i)) > Norma1 then
                Norma1 = abs(x(i) - v(i))
            end
            
            if abs(x(i)) > Norma2 then
                Norma2 = abs(x(i))
            end
        end
        
        DifMax = Norma1 / Norma2
           
        disp("Interação: " + string(Iter) + " - x: " + string(x) + " - DifMax = " + string(DifMax))          
        disp(string(DifMax) + " < " + string(Toler));
        
        if DifMax < Toler || Iter >= IterMax then
            disp("Convergência alcançada após " + string(Iter) + " iterações.")
            break
        end
    end
    
    Erro = DifMax >= Toler
    // Variável lógica: Se verdadeiro há erro e se falso não há erro
endfunction

////////////////////////////////////////////////////////////////////////////

function [x] = gaussPivotamentoParcial(A, b);
    n = length(b);
    // cria a matriz aumentada
    Ab = [A, b]; 
    
    // percorre as colunas da matriz aumentada
    for k = 1:n-1
        // encontra o pivô máximo
        [max_val, max_row] = max(abs(Ab(k:n, k)));
        max_row = max_row + k - 1;

        // realiza o pivotamento parcial, se necessário
        if max_row ~= k
            temp = Ab(k, :);
            Ab(k, :) = Ab(max_row, :);
            Ab(max_row, :) = temp;
        end

        // percorre as linhas abaixo do pivô
        for i = k+1:n
            m = Ab(i, k) / Ab(k, k);
            Ab(i, :) = Ab(i, :) - m * Ab(k, :);
        end
        
        //printf("\nEtapa: %d", k);     
        //disp(Ab);   
    end

    // resolve o sistema triangular superior
    x = zeros(n, 1);
    x(n) = Ab(n, n+1) / Ab(n, n);
    for i = n-1:-1:1
        x(i) = (Ab(i, n+1) - Ab(i, i+1:n) * x(i+1:n)) / Ab(i, i);
    end
endfunction

matHilbert = zeros(12, 12);
[linhas, colunas] = size(matHilbert);

////////////////////////////////////////////////////////////////////////////

//fórmula h(i, j) = 1 / (i + j - 1), i, j = 1, 2, 3, ..., 12.
// TODO: O primeiro índice de um vetor ou matriz é 1 e não 0
for i = 1 : linhas
    for j = 1 : colunas
        matHilbert(i, j) = 1 / (i + j - 1);
    end;
end;

b = [
    3.1048747;
    2.1815712;
    1.7528267;
    1.4860237;
    1.2984136;
    1.1571464;
    1.0459593;
    0.9556691;
    0.8806136;
    0.8170732;
    0.7624855;
    0.7150172;
]

Toler = 10e-5;
IterMax = 1000;

disp("MatrizHilbert: ");
disp(matHilbert);
disp("Vetor de termos independentes: ")
disp(b);

[x, Iter, Erro] =  gauss_Seidel(12, matHilbert, b, Toler, IterMax)

disp("====> gaussSeidel. x = ");
disp(x);

[x2] = gaussPivotamentoParcial(matHilbert, b);

disp("====> gaussPivotamentoParcial. x = ");
disp(x2);
