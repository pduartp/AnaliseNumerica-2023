// Nome: Patrick Duarte - 2023 (Ciência da computação)

// #### Questão: 2 ####

clc
/////////////////////////////////////////////////////////////////

// Algoritmo Jacobi
// Objetivo: Resolver o sistema Ax = b pelo métod0 iterativo de Jacobi

// Todo: Parâmetros de entrada: n, A, b, Toler, IterMax (ordem, matriz, vetor independente)

// Todo: parâmetros de saída: x, Iter, Erro (vetor solução, número de iterações e condição de erro)

function [x, Iter, Erro] = jacobi(n, A, b, Toler, IterMax)
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
    
    // Aproximação inicial
    x = [
    1.01;
    2.01;
    3.01;
    ]
    
    // Interações de Jacobi
    for Iter = 1 : IterMax
        for i = 1 : n                    
            Soma = 0
            
            for j = 1 : n
                if i ~= j then
                    Soma = Soma + A(i, j) * x(j)
                end
            end
            
            v(i) = b(i) - Soma
        end
        
        Norma1 = 0
        Norma2 = 0
        
        for i = 1 : n
            if abs(v(i) - x(i)) > Norma1 then
                Norma1 = abs(v(i) - x(i))
            end
            
            if abs(v(i)) > Norma2 then
                Norma2 = abs(v(i))
            end
            
            x(i) = v(i)
        end
        
        DifMax = Norma1 / Norma2
           
        //disp("Interação: " + string(Iter) + " - x: " + string(x) + " - DifMax = " + string(DifMax))          
        //disp(string(DifMax) + " < " + string(Toler));
        
        if DifMax < Toler || Iter >= IterMax then
            disp("Convergência alcançada após " + string(Iter) + " iterações.")
            break
        end
    end
    
    Erro = DifMax >= Toler
    // Variável lógica: Se verdadeiro há erro e se falso não há erro 

endfunction

/////////////////////////////////////////////////////////////////
// Algoritmo Gauss-Seidel
// Objetivo: Resolver sistema Ax = b pelo métod0 iterativo de Gauss-Seidel

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
    
    // Aproximação inicial
    x = [
    1.01;
    2.01;
    3.01;
    ]
    
    // Interações de Gauss-Seidel
    Iter = 1
    while (Iter < IterMax)
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
           
        //disp("Interação: " + string(Iter) + " - x: " + string(x) + " - DifMax = " + string(DifMax))          
        //disp(string(DifMax) + " < " + string(Toler));
        
        if DifMax < Toler || Iter >= IterMax then
            disp("Convergência alcançada após " + string(Iter) + " iterações.")
            break 
        end
        
        Iter = Iter + 1
    end
    
    Erro = DifMax >= Toler
    // Variável lógica: Se verdadeiro há erro e se falso não há erro
endfunction



/////////////////////////////////////////////////////////////////

// Matriz e termos independentes 1
M1 = [
    3 -3 7;
    1 6 -1;
    10 -2 7;
];

b1 = [
    18;
    10;
    27;
]

M2 = [
    1 2 5;
    1 3 1;
    4 1 2;
];

b2 = [
    20;
    10;
    12;
]

disp("Matriz 1 aumentada:");
disp([M1, b1]);

disp("Matriz 2 aumentada:");
disp([M2, b2]);

disp("///////////////////////////////////////////");

disp("jacobi M1 - x = ");
[x1m1, Iter1, Erro1] = jacobi(3, M1, b1, 10e-5, 10)
disp(x1m1);

disp("gaussSeidel M1 - x = ");
[x2m1, Iter11, Erro11] = gauss_Seidel(3, M1, b1, 10e-3, 10)
disp(x2m1);

disp("///////////////////////////////////////////");

disp("jacobi M2 - x = ");
[x1m2, Iter2, Erro2] = jacobi(3, M2, b2, 10e-5, 10)
disp(x1m2)

disp("gaussSeidel M2 - x = ");
[x2m2, Iter22, Erro22] = gauss_Seidel(3, M2, b2, 10e-2, 5)
disp(x2m2);

disp("///////////////////////////////////////////");
