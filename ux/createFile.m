function createFile()

global POINTS;
global CATS;
global BC;
global ZONES;
global CFIPTS;
global vCFIPTS;

%Координаты контура
%----------------------------------------
contZ = [POINTS.Z];
contR = [POINTS.R];

contFI = [CFIPTS.FI];
Voltage = max([vCFIPTS.Voltage]);

%Координаты и характеристики катода
%---------------------------------------
katodsZ = [POINTS(1).Z POINTS(2).Z];
katodsR = [POINTS(1).R POINTS(2).R];
arcsZ = CATS.Zs;
arcsR = 0;
arcsRA = CATS.Rs;
numbTR = CATS.nTR;
D = CATS.SD;


%Координаты и шаг сетки
%---------------------------------------
zonesZ = [ZONES.Z];
stepsZ = [ZONES.ZN];
zonesR = [ZONES.R];
stepsR = [ZONES.RN];

fprintf('Количество точек контура %d\n',numel(contZ));

fidInr = fopen('drivers/inr/inr.tx', 'w');

% Записываем координаты контура
%---------------------------------------

% Точки по оси Z
fprintf(fidInr, 'contZ\n');
for i=1:numel(contZ)
    str=sprintf('%G,\n', contZ(i));
    fprintf(fidInr, str);
end
fprintf(fidInr, '1.0E10\n\n');

% Точки по оси R
fprintf(fidInr, 'contR\n');
fprintf(fidInr, '-1.E-18,\n');
fprintf(fidInr, '-%G,\n', contR(2));
for i=3:numel(contR)
    str=sprintf('%G,\n', contR(i));
    fprintf(fidInr, str);
end
fprintf(fidInr, '1.0E10\n\n');

%Записываем значение потенциала в точках
%---------------------------------------

fprintf(fidInr, 'contFI\n');
for i=1:numel(contFI)
	fprintf(fidInr, '%G(%G),\n', CFIPTS(i).numPTS, CFIPTS(i).FI);
end
fprintf(fidInr, '1.0E10\n\n');

%Записываем координаты и характеристики катода
%------------------------------------------

fprintf(fidInr, 'katodsR\n%G,\n%G\n\n', katodsR(1), katodsR(2));

fprintf(fidInr, 'katodsZ\n%G,\n%G\n\n', katodsZ(1), katodsZ(2));

fprintf(fidInr, 'arcsZ\n%G\n\n', arcsZ);

fprintf(fidInr, 'arcsR\n%G\n\n', arcsR);

fprintf(fidInr, 'arcsRA\n%G\n\n', arcsRA);

fprintf(fidInr, 'numbTR\n%G\n\n', numbTR);

fprintf(fidInr, 'D\n%G\n\n', D);

%Записываем границы и шаг сетки
%----------------------------------------
fprintf(fidInr, 'zonesZ\n');
for i=1:(numel(zonesZ)-1)
    str=sprintf('%G,\n', zonesZ(i));
    fprintf(fidInr, str);
end
fprintf(fidInr, '%G\n\n', zonesZ(numel(zonesZ)));

fprintf(fidInr, 'stepsZ\n');
for i=1:(numel(stepsZ)-1)
    str=sprintf('%G,\n', stepsZ(i));
    fprintf(fidInr, str);
end
fprintf(fidInr, '%G\n\n', stepsZ(numel(stepsZ)));

fprintf(fidInr, 'zonesR\n');
for i=1:(numel(zonesR)-1)
    str=sprintf('%G,\n', zonesR(i));
    fprintf(fidInr, str);
end
fprintf(fidInr, '%G\n\n', zonesR(numel(zonesR)));

fprintf(fidInr, 'stepsR\n');
for i=1:(numel(stepsR)-1)
    str=sprintf('%G,\n', stepsR(i));
    fprintf(fidInr, str);
end
fprintf(fidInr, '%G\n\n', stepsR(numel(stepsR)));

%Записываем значение UP/U
%----------------------------------------
fprintf(fidInr, 'UP/U\n%G\n', Voltage);

%Записываем настройки магнитного поля
%----------------------------------------
fidMagnet = fopen('MagField.txt');

while ~feof(fidMagnet)
      A = fgetl(fidMagnet);
      str = sprintf('\n%s\n', A);
      fprintf(fidInr, str);
end

fclose(fidMagnet);

%Записываем настройки для решения
%----------------------------------------

fprintf(fidInr, 'SP/S\n0.001\n\n');
fprintf(fidInr, 'normZ\n1.62,\n5.27\n\n');
fprintf(fidInr, 'normR\n7,\n7\n\n');
fprintf(fidInr, 'numbITER\n30\n\n');
fprintf(fidInr, 'crossZ\n10\n\n');
fprintf(fidInr, 'accLS\n-6.0\n\n');
fprintf(fidInr, 'accTR\n0.002236\n\n');
fprintf(fidInr, 'factor\n0.5\n\n');
fprintf(fidInr, 'limitJ\n1000\n\n');
fprintf(fidInr, 'minusJ\n1\n\n');
fprintf(fidInr, 'traceequ\n1\n\n');
fprintf(fidInr, 'FINISH');

fclose('all');
end