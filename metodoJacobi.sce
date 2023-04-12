/* O met. de Jacobi é um algoritmo numérico ITERATIVO usado para encontrar soluções para sistemas de equações lineares. Especificamente, o met. de Jacobi é usado para resolver sistemas de equações lineares diagonais dominantes, que são sistemas em que a magnitude do elemento diagonal de cada equação é maior do que a soma das magnitudes dos outros elementos da equação.

Ele funciona dividindo o sistema de equações em uma matriz diagonal e duas matrizes triangulares, uma matriz triangular superior e outra matriz triangular inferior. Em seguida, uma solução aproximada é inicializada, e a cada iteração, a solução é atualizada usando uma combinação dos valores anteriores e os valores da matriz de entrada. Essas iterações continuam até que a solução convirja para um valor satisfatório.

Embora o met. de Jacobi seja um algoritmo relativamente simples e fácil de implementar, ele pode ser lento para convergir para a solução correta e pode exigir um grande número de iterações para sistemas grandes e complexos. Por essa razão, outros métodos iterativos, como o met.de Gauss-Seidel e o met.odo SOR, são frequentemente preferidos em muitos casos.*/

clc

// Implementação do metod0 de Jacobi
// A é a matriz dos coeficientes do sistema de equações lineares
// b é o vetor das constantes do sistema de equações lineares
// x0 é o vetor inicial de estimativas de solução
// tol é a tolerância para convergência
// maxiter é o número máximo de iterações
function [x] = jac(A, b, x0, tol, maxIter);
    //inicialização    
    // Número de linhas
    n = size(A, 1);
    x = x0;
    
    // k = número de etapas
    // Implementação do métod0 de Jacobi
    for k = 1:max_iter
        for i = 1:size(A, 1)
            sum = 0;
            for j = 1:size(A, 2)
                if j ~= i
                    sum = sum + A(i, j) * x0(j);
                end
            end
            x(i) = (b(i) - sum)/A(i, i);
            
            printf("\n dada a interação %d temos o x(%d)=%g",k,i,x(i));
        end
        printf("\n");
        
        // Cálculo do erro relativo
        err = norm(x - x0) / norm(x);
        
        // Verificação da convergência
        disp(string(err) + " < " + string(tol));
        if err < tol
            disp("Convergência alcançada após " + string(k) + " iterações.")
            break;
        end
                
        x0 = x;
    end
endfunction

// Definição do sistema de equações lineares
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

// Aproximação inciial
x0 = [
     0; 
     0; 
     0
 ];
x
// Definição da tolerância e do número máximo de iterações
tol = 0.3;

// Número máximo de interações
max_iter = 90;

disp("Matriz aumentada: ");
disp([A, b]);

[x] = jac(A, b, x0, tol, max_iter);

// Exibição da solução
disp("Solução: ");
disp(x);
