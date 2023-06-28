clc

//Spline


vetX = [
    -1; 
    1; 
    2
];

vetY = [
    1; 
    3;
    0
];


spline = splin(vetX, vetY);

disp(spline);

xx = [-1: 0.1: 2];

z = interp(xx, vetX, vetY, spline);

disp(z);


// Azul: polimonio interpolar por spline
// Vermelho: " " por lienar

plot(xx, z, '-r*');
plot(vetX, vetY, "b*");

z = interp1(vetX, vetY, xx, "linear");

plot(xx, z);
plot(vetX, vetY, "r");


z2 = interp1(vetX, vetY, xx, "linear");

plot(xx, z2);
plot(xx, z2, "g");
