// TABELA DAS DIFERENÇAS DIVIDIDAS

clc

// Entrada com vetores

vetX = [
    -1;
    0;
    2;
];

vetY = [
    4;
    1;
    -1;
];

// Lendo o tamanho do vetor
tamX = size(vetX, 1);

// Vai variar na linha e fixar na coluna
T(:, 1) = vetY;

for (j = 2 :tamX)
    for (i = 1 : (tamX - j + 1))
        T(i, j) = (T(i + 1, j - 1) - T(i, j - 1)) / (vetX(i + j - 1) - vetX(i));
    end
end

// Primeira linha são os resultados corretos
disp("T = ");
disp(T);
