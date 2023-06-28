// 1 - Resolvendo através da eliminação de Gauss Ingênua

clc();

// Define uma matriz aumentada
a = [0.004 15.73; 0.423 -24.72];
b = [15.77; -20.49];
mat = [a b];

disp("Matriz mat:");
disp(mat);

// Número de linha
numLinhas = size(mat, 1);
disp("Num linhas: " + string(numLinhas));



// i: quantidade de etapas de (1 até n-1)
for i = 1 : numLinhas - 1
    // j: linha alteradas na etapa k (de i+1 até n)
    for j = i + 1 : numLinhas
        // mult: multiplicador
        mult = mat(j, i) / mat(i, i);
        mat(j, :) = mat(j, :) - mult * mat(i, :);
        //j: elementos que serão alterados na linha j na etapa i (de i até n)
    end
end

// Resolver o sistema triangular superior
x = zeros(numLinhas, 1);
x(numLinhas) = mat(numLinhas, numLinhas + 1)/ mat(numLinhas, numLinhas);
for i = numLinhas - 1:-1 : 1
    x(i) = (mat(i, numLinhas + 1) - mat(i, i+1 : numLinhas) * x(i + 1 : numLinhas)) / mat(i, i);
end


disp("Solução: ");
disp(x);
