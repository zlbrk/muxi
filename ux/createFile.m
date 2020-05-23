function createFile()

global ConStruct;
global Cathode;
global Mesh;

contZ = [ConStruct.Z];
contR = [ConStruct.R];
contFI = [ConStruct.Phi];
Voltage = max([ConStruct.Voltage]);

katodsR = [Cathode.R];
katodsZ = [Cathode.Z];

zonesZ = [Mesh.zonesZ];
stepsZ = [Mesh.stepsZ];
zonesR = [Mesh.zonesR];
stepsR = [Mesh.stepsR];

fprintf('Количество точек контура %d\n',numel(contZ));

fid = fopen('./TEST/IN/inr.tx', 'w');

% записываем координаты контура
%---------------------------------------
fprintf(fid, 'contZ\n');
for i=1:numel(contZ)
    str=sprintf('%G,\n', contZ(i));
    fprintf(fid, str);
end
fprintf(fid, '1.0E10\n\n');

fprintf(fid, 'contR\n');
for i=1:numel(contR)
    str=sprintf('%G,\n', contR(i));
    fprintf(fid, str);
end
fprintf(fid, '1.0E10\n\n');

%записываем значение потенциала в точках
%---------------------------------------
u = unique(contFI)
% L = length(find(contFI==u(1)))
% pause

fprintf(fid, 'contFI\n');
for i=1:numel(u);
    L = length(find(contFI==u(i)));
	fprintf(fid, '%G(%G),\n', L, u(i));
end
fprintf(fid, '1.0E10\n\n');

%записываем координаты катода
%------------------------------------------
fprintf(fid, 'katodsR\n');
for i=1:numel(katodsR)
    str=sprintf('%G,\n', katodsR(i));
    fprintf(fid, str);
end
fprintf(fid, '1.0E10\n\n');

fprintf(fid, 'katodsZ\n');
for i=1:numel(katodsZ)
    str=sprintf('%G,\n', katodsZ(i));
    fprintf(fid, str);
end
fprintf(fid, '1.0E10\n\n');

%записываем границы и шаг сетки
%----------------------------------------
fprintf(fid, 'zonesZ\n');
for i=1:(numel(zonesZ)-1)
    str=sprintf('%G,\n', zonesZ(i));
    fprintf(fid, str);
end
fprintf(fid, '%G\n\n', zonesZ(numel(zonesZ)));

fprintf(fid, 'stepsZ\n');
for i=1:(numel(stepsZ)-1)
    str=sprintf('%G,\n', stepsZ(i));
    fprintf(fid, str);
end
fprintf(fid, '%G\n\n', stepsZ(numel(stepsZ)));

fprintf(fid, 'zonesR\n');
for i=1:(numel(zonesR)-1)
    str=sprintf('%G,\n', zonesR(i));
    fprintf(fid, str);
end
fprintf(fid, '%G\n\n', zonesR(numel(zonesR)));

fprintf(fid, 'stepsR\n');
for i=1:(numel(stepsR)-1)
    str=sprintf('%G,\n', stepsR(i));
    fprintf(fid, str);
end
fprintf(fid, '%G\n\n', stepsR(numel(stepsR)));

%записываем значение UP/U
%----------------------------------------
fprintf(fid, 'UP/U\n%G\n', Voltage);

%Записываем настройки магнитного поля
%----------------------------------------
fidd = fopen('MagField.txt');

while ~feof(fidd)
      A = fgetl(fidd);
      str = sprintf('\n%s\n', A);
      fprintf(fid, str);
end

fclose(fidd);

%записываем настройки для решения
%----------------------------------------
fiddd = fopen('Settings.txt');

while ~feof(fiddd)
      A = fgetl(fiddd);
      str = sprintf('\n%s\n', A);
      fprintf(fid, str);
end

fclose(fiddd);

fclose(fid);
end