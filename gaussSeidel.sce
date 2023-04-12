/* O métod Gauss-Seidel é um métod iterativo utilizado para resolver sistemas de equações lineares. Ele é chamado assim em homenagem aos matemáticos Carl Friedrich Gauss e Philipp Ludwig von Seidel.

O métod funciona da seguinte maneira: dada uma matriz de coeficientes e um vetor de termos independentes de um sistema de equações lineares, o métod começa com uma estimativa inicial para as soluções. Em seguida, ele itera através das equações do sistema, atualizando as estimativas das soluções em cada passo, usando as estimativas mais recentes das outras variáveis.

O métod continua iterando até que a solução seja encontrada com a precisão desejada ou até que um número máximo de iterações seja atingido. O métod Gauss-Seidel é geralmente mais rápido que o métod de eliminação de Gauss para resolver sistemas de equações lineares, especialmente quando a matriz de coeficientes é esparsa.
*/

clc

// Função para o métod0 de Gauss-Seidel
function [x, iter] = gaussSeidel(A, b, tol, maxIter)
    // A é a matriz dos coeficientes do sistema de equações lineares
    // b é o vetor das constantes do sistema de equações lineares
    // x0 é o vetor inicial de estimativas de solução
    // tol é a tolerância para convergência
    // maxiter é o número máximo de iterações
    
    // tamanho do sistema
    n = length(b); 
    
    // inicializa as estimativas de solução
    x = x0
    
    // inicializa o número de iterações; 
    iter = 1; 
    
    // começa o loop do métod0 de Gauss-Seidel
    while iter < maxiter
        // armazena a estimativa anterior de solução
        x_old = x;
        
        // loop sobre as equações do sistema
        for i = 1:n                         
            // inicializa a variável de soma
            sum = 0;
            
            // loop sobre os coeficientes das equações
            for j = 1:n
                // ignora o coeficiente da diagonal 
                if i ~= j 
                    sum = sum + A(i,j) * x(j);
                end
            end                        
            // atualiza a estimativa de solução
            x(i) = (b(i) - sum) / A(i,i);
            
            printf("\n dada a interação %d temos o x(%d)=%g",iter,i,x(i));
        end
        
        printf("\n")
        
        // calcula a diferença entre a nova estimativa e a anterior
        diff = norm(x - x_old, "inf");
        
        disp(string(diff) + " < " + string(tol));
        // verifica se a solução convergiu
        if diff < tol
            disp("Convergência alcançada após " + string(iter) + " iterações.")
            break;
        end
        
        // incrementa o número de iterações
        iter = iter + 1;
    end
    
    /*
    // Obter as dimensões da matriz A
    n = size(A, 1);

    // Inicializar x
    x = zeros(n, 1);

    // Inicializar o contador de iterações
    iter = 1;

    // Realizar iterações até atingir a tolerância ou o número máximo de iterações
    while iter < maxIter
        // Realizar uma iteração
        for i = 1:n
            // Inicializar a soma
            soma = 0;

            // Somar os elementos da linha i, exceto o elemento diagonal
            for j = 1:n
                if j ~= i
                    soma = soma + A(i, j) * x(j);
                end
            end

            // Atualizar o valor da incógnita i
            x(i) = (b(i) - soma) / A(i, i);
            
            
        end
        
        err = norm(A * x - b);
       
        disp(string(err) + " < " + string(tol));
        
        // Verificar se a tolerância foi atingida
        if err < tol
            disp("Convergência alcançada após " + string(i) + " iterações.")
            break;
        end

        // Incrementar o contador de iterações
        iter = iter + 1;
    end*/
endfunction

// Definir a matriz A e o vetor b
A = [
    4 -2 1; 
    1 3 -1; 
    1 2 4
    ];
    
b = [
    3; 
    5; 
    6
    ];

// Definir a estimativa inicial e a tolerância
x0 = [
    0; 
    0; 
    0
    ];
    
tol = 0.3;

// Definir o número máximo de iterações
maxIter = 50;

disp("Matriz aumentada: ");
disp([A, b]);

// Resolver o sistema utilizando o métod0 de Gauss-Seidel
[x, iter] = gaussSeidel(A, b, tol, maxIter);

// Exibir a solução e o número de iterações realizadas
disp("Solução. x = ");
disp(x);
disp("Número de iterações: " + string(iter));
