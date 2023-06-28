clc;


/*
O algoritmo recebe três argumentos de entrada: a matriz A, o número máximo de iterações max_iter e a tolerância tol. A função retorna o valor próprio máximo lambda, o vetor próprio correspondente x, e o número de iterConv interações antigidas após a convergência (iterConv ).*/
function [lambda, x, iterConv ] = metodo_das_potencias(A, max_iter, tol)
    n = size(A, 1);                         // Obtém o tamanho da matriz A
    x = [1; 1; 1];                          // Vetor inicial não nulo
    x = x / norm(x);                        // Normaliza o vetor para ter norma igual a 1
    
    for i = 1:max_iter                      // Loop para executar o método das potências
        y = A * x;                          // Multiplica a matriz A pelo vetor x para obter um novo vetor y
        lambda = x' * y;                    // Calcula o produto interno entre x e y para obter o valor próprio
        x = y / norm(y);                    // Normaliza o vetor y para ter norma igual a 1 e atribui ao vetor x

        if norm(A * x - lambda * x) < tol   // Verifica se a condição de parada foi atingida
            break;
        end
    end
    
    // Armazena i
    iterConv = i
    
    // Retorna o valor próprio máximo e o vetor próprio correspondente
    lambda = x' * (A * x);
    x = x / norm(x);
end


A = [
    2  3  1;
    0  3 -1;
    0  0  1
];

// Letra c:

/* A matriz triangular superior inversa é calculada utilizando a função inv(triu(A)). Além disso, a multiplicação da matriz A pelo vetor x é substituída pela multiplicação da matriz triangular superior inversa L pelo vetor x. O restante do algoritmo é semelhante ao métod0 das potências.*/
function [lambda, x, iterConv] = metodo_iteracao_inversa(A, max_iter, tol)
    n = size(A, 1);                 // Obtém o tamanho da matriz A
    x = [1; 1; 1];                  // Vetor inicial não nulo
    x = x / norm(x);                // Normaliza o vetor para ter norma igual a 1
    L = inv(triu(A));               // Obtém a matriz triangular superior inversa

    for i = 1:max_iter              // Loop para executar o método da iteração inversa
        y = L * x;                  // Multiplica a matriz triangular superior inversa pelo vetor x
        lambda = x' * y;            // Calcula o produto interno entre x e y para obter o valor próprio
        x = y / norm(y);            // Normaliza o vetor y para ter norma igual a 1 e atribui ao vetor x

        if norm(A * x - lambda * x) < tol   // Verifica se a condição de parada foi atingida
            break;
        end
    end
    
    // Armazena i
    iterConv = i

    // Retorna o valor próprio máximo e o vetor próprio correspondente
    lambda = x' * (A * x);
    x = x / norm(x);
end


// Letra a:
[lambda, x, iterConv] = metodo_das_potencias(A, 100, 10e-3)

disp("### Letra A ###");

disp("Auto valor lambda = ");
disp(lambda);

disp("x = ");
disp(x);

// Letra b:

disp("### Letra B ###");
disp("O método convergiu após " + string(iterConv) + " interações.");

// Letra c:
[lambda, x] = metodo_iteracao_inversa(A, 100, 10e-3);

disp("### Letra C ###");

disp("Auto valor lambda = ");
disp(lambda);

disp("x = ");
disp(x);

disp("O método convergiu após " + string(iterConv) + " interações.");
