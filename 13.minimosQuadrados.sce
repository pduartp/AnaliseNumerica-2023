clc

// Vetor T
vetX = [    
    -50;
    -20;
     10;
     70;
    100;
    120
];

// Vetor C
vetY = [
    0.125;
    0.128;
    0.134;
    0.144;
    0.150;
    0.155
]

vet = [ones(vetX) vetX  vetX^2];
vet2 = [ones(vetX) vetX];

a = (vet' * vet) \ (vet' * vetY);
a1 = vet2' * vet2 \ vet2 ' * vetY;

disp(a);
disp(a1);

plot(vetX, vetY, '*r');

xx = [-50:0.1:120];

M = a(1) + a(2) * xx + a(3) * xx.^2;
M1 = a1(1) + a1(2) * xx;

plot(xx, M);
plot(xx, M1, 'g');

Sr = sum((vetY - vet2 * a1)^2);
St = sum((vetY - mean(vetY))^2);
