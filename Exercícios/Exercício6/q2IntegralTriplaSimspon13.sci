/*

A regra 1/3 de Simpson é um método numérico utilizado para calcular aproximações de integrais definidas. 
É especialmente útil quando a função a ser integrada apresenta um comportamento relativamente suave.

A ideia básica por trás da regra 1/3 de Simpson é aproximar a integral definida de uma função por 
meio de uma soma ponderada de valores da função em pontos específicos. Esses pontos são determinados 
ao dividir o intervalo de integração em segmentos iguais e utilizar uma combinação linear de valores 
da função em pontos selecionados dentro de cada segmento.

A regra 1/3 de Simpson assume que a função a ser integrada pode ser aproximada por um polinômio 
de grau 2 em cada segmento. Assim, para cada segmento, a integral é aproximada pelo valor médio 
do polinômio.

No caso da integração tripla, como no exemplo fornecido, a regra 1/3 de Simpson é aplicada em 
três dimensões, dividindo cada dimensão em segmentos e calculando a contribuição de cada 
segmento para a integral tripla.

A fórmula da regra 1/3 de Simpson envolve uma combinação ponderada dos valores da função 
em pontos específicos dentro de cada segmento. Essa combinação pondera mais fortemente 
os valores nos extremos do segmento e menos os valores no ponto médio. A fórmula é 
derivada a partir de uma interpolação polinomial quadrática e leva em conta a estrutura 
par/impar dos segmentos.

No código apresentado anteriormente, a implementação do método da regra 1/3 de Simpson 
utiliza essa fórmula para calcular uma aproximação numérica da integral tripla da função 
fornecida nos limites especificados.
*/
function result = simpson_1_3_triple(a1, b1, a2, b2, a3, b3, f, n1, n2, n3)
    h1 = (b1 - a1) / n1;  // Passo em x
    h2 = (b2 - a2) / n2;  // Passo em y
    h3 = (b3 - a3) / n3;  // Passo em z

    result = 0;

    // Loop para percorrer os segmentos em x
    for i = 0:n1-1
        x0 = a1 + i * h1;
        x1 = x0 + h1;

        // Loop para percorrer os segmentos em y
        for j = 0:n2-1
            y0 = a2 + j * h2;
            y1 = y0 + h2;

            // Loop para percorrer os segmentos em z
            for k = 0:n3-1
                z0 = a3 + k * h3;
                z1 = z0 + h3;

                // Cálculo do volume do paralelepípedo
                volume = (x1 - x0) * (y1 - y0) * (z1 - z0);

                // Aplicação da regra 1/3 de Simpson para obter a contribuição deste segmento para o resultado final
                result = result + volume * (f(x0, y0, z0) + 4*f((x0 + x1)/2, y0, z0) + f(x1, y0, z0) + 4*f(x0, (y0 + y1)/2, z0) + f(x0, y1, z0) + 4*f((x0 + x1)/2, y1, z0) + f(x1, y1, z0) + 4*f(x0, y0, (z0 + z1)/2) + f(x0, y0, z1) + 4*f((x0 + x1)/2, y0, z1) + f(x1, y0, z1) + 4*f(x0, (y0 + y1)/2, z1) + f(x0, y1, z1) + 4*f((x0 + x1)/2, y1, z1) + f(x1, y1, z1)) / 48;
            end
        end
    end
endfunction

// Função a ser integrada: f(x, y, z) = x^3 - 3*y*z
function result = f(x, y, z)
    result = x^3 - 3*y*z;
endfunction

// Parâmetros da integral
a1 = -3;
b1 = 1;
a2 = 0;
b2 = 2;
a3 = -2;
b3 = 2;

n1 = 6;  // Número de segmentos em x
n2 = 6;  // Número de segmentos em y
n3 = 6;  // Número de segmentos em z

// Chamada da função para obter o resultado
integral_result = simpson_1_3_triple(a1, b1, a2, b2, a3, b3, f, n1, n2, n3);

disp("Resultado:");
disp(integral_result);

// Resultado
// -140.44444

