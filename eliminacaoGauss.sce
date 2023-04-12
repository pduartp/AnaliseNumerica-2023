// ALGORITMO: Eliminação de Gauss

// TODO: A eliminação de Gauss, ou método de escalonamento, é um algoritmo parase resolver sistemas de equações lineares. Este método consiste em aplicar sucessivas operações elementares num sistema linear, para o transformar num sistema de mais fácil resolução, que apresenta exatamente as mesmas soluções que o original.

clc;

// Resolve por Gauss Ingenua. 
// TODO: Retorna um vetor de solucoes. Recebe como parâmetro uma matriz A e seu vetorde termos independentes 
function [x] = gaussElimIngenua(A, b);
    // número de linha (e colunas) da matriz A
    n = size(A, 1);
    
    // Matriz aumentada
    Ab = [A, b];
        
    disp("Matriz aumentada: ")
    disp(Ab);
    
    // etapa = quantidade de etapas (de 1 até (:) n - 1)
    for etapa = 1 : (n - 1)
        // i = linhas alteradas na etapa k de (k + 1 até n)
        for i = (etapa + 1) : n
            // Para cada linha deve ser calculado o multiplicador
            multiplicador = A(i, etapa) / A(etapa, etapa);
            A(i, etapa) = 0            
            // j = elementos que serão alterados na linha i na etapa k de k até n
            for j = (etapa + 1) : n
                // Atualizar o coeficiente a[i, j]
                A(i, j) = A(i, j) - multiplicador * A(etapa, j);
            end            
            // Atualizar o coeficiente b[i];
            b(i) = b(i) - multiplicador * b(etapa);
        end        
        printf("\nEtapa: %d", etapa);     
        disp([A, b]);        
    end
    
    disp("Matriz triangular superior: ")
    disp([A, b]);
    
    // Substituição retroativa
    x = zeros(n, 1);
    
    x(n) = b(n)/ A(n, n);
    
    for i = (n - 1) : -1 : 1 
        soma = 0;        
        for j = (i + 1) : n
            soma = soma + A(i, j) * x(j);
        end
        x(i) = (b(i) - soma) / A(i, i); 
    end
    
    // Arrendonda pra baixo
    //x = round(x);
endfunction

// Resolve por pivotamento.
// TODO: Retorna um vetor de solucoes. Recebe como parâmetro uma matriz A e seu vetorde termos independentes 
function [x] = gaussPivotamentoParcial(A, b);
    n = length(b);
    // cria a matriz aumentada
    Ab = [A, b];
    
    disp("Matriz aumentada: ")
    disp(Ab); 

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
        
        printf("\nEtapa: %d", k);     
        disp(Ab);   
    end

    // resolve o sistema triangular superior
    x = zeros(n, 1);
    x(n) = Ab(n, n+1) / Ab(n, n);
    for i = n-1:-1:1
        x(i) = (Ab(i, n+1) - Ab(i, i+1:n) * x(i+1:n)) / Ab(i, i);
    end
endfunction

// Fórmula matricial: Ax = b

disp("## Entrada de uma matriz QUADRADA e vetor de termos indepdentes ##");

// Ajusta a precisão:
//  - 'v': exibição em linhas (separando as colunas por vírgulas);
//  - 'width' (8): Largura (quanitdade de casas);
//format('v', 20);

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

printf("\t________________________________________");
disp("1. Eliminação de gauss ingênua.");

// x = vetor de soluções
x = gaussElimIngenua(A, b);

disp("===> Solução. x = ");
disp(x);

x = 0;

printf("\t________________________________________");
disp("2. Eliminação com pivotamento parcial.");

x = gaussPivotamentoParcial(A, b);

disp("===> Solução. x = ");
disp(x);
