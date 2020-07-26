%% Инициализация
clear;
close all;
clc;

%Определение псевдонимов API
aliases;

% Инициализация файловой системы проекта
opath = path; % old path
workdir = pwd;
muxiFS = sprintf('%s; ux; render; bin; saves', workdir);
muxiFS = sprintf('%s; debug; drivers/comi; temp;', muxiFS);
% разделяем строку с описанием файловой системы на отдельные поддиректории
subdirs = split(muxiFS); 
% создаём поддиректории, если они не существуют (если нет дескрипторов типа folder (7) с именем поддиректории)
for i=2:numel(subdirs)
	subdir = cell2mat(subdirs(i));
	if exist(subdir(1:end-1),'dir') ~= 7
		% subdir(1:end-1) % вывод имени поддиректории для отладки
		mkdir(subdir(1:end-1));
   	end
end
path(opath, muxiFS); % new path
clear opath;



global Colors;
  Colors.Void = [220, 220, 220]/255;
  Colors.PointIDs = [220, 220, 220]/255;
  Colors.Points = [25, 100, 150]/255;
  Colors.Picked = [180, 0, 135]/255;
  Colors.Cathode = [242, 20, 140]/255;
  Colors.Mesh = [140 140 130]/255;

global Cart;
  Cart = []; % Корзинка для точек

global Cathode; 
  Cathode = []; % Катод как структура
  Cathode.type = 'flat';
  Cathode.Z = [1 1];
  Cathode.R = [0 1.1];
  Cathode.SD = 0.075;

global ConStruct;
  ConStruct = []; % Контур как множество точек -- массив структур contour structure

% Определяем координаты точек контура
ZR(:, 1) = [1., 1., 1.32, 1.32, 1.62, 1.62, 5.27, 5.27, 45, 45];
ZR(:, 2) = [1.E-8, 7, 7, 1.2, 1.2, 7, 7, 0.9, 0.9, 0];
ZRpts = numel(ZR(:, 1)); % Количество точек в контуре

% Инициализируем объект-контур
for i = 1:ZRpts
	p.id = i;
	
    p.Voltage = 0;
    p.Phi = 0;
    
	p.prev = p.id - 1;
	if p.prev < 1
		p.prev = ZRpts;
	end
	
	p.next = p.id + 1;
	if p.next > ZRpts
		p.next = 1;
	end
	
	p.Z = ZR(i, 1);
	
	p.R = ZR(i, 2);
	% if p.R > 0
	% 	p.isArc = 0;
	% elseif p.R < 0
	% 	p.isArc = 1;
	% end
	
	ConStruct = [ConStruct p];
end

%% =====================================
% Это только для тестирования отображения многозначных чисел
% ConStruct(4).id = 999;
%% =====================================

%% Определяем глобальную переменную графического контекста
% ---------------------------------------
global GA; % Глобальные оси координат

%% Определяем границы рабочего вида
% ---------------------------------------
ZMIN = min([ConStruct.Z])-0.5;
ZMAX = max([ConStruct.Z])/4;
RMIN = min([ConStruct.R]);
RMAX = max([ConStruct.R])+0.5;
% ---------------------------------------


%% Задание сетки в EOS2
% ---------------------------------------
global MeshState;
  MeshState = false;
global Mesh;
  Mesh.zonesZ = [0 6 45];
  Mesh.stepsZ = [151 100];
  Mesh.zonesR = [0 4 7];
  Mesh.stepsR = [151 100];

initFigure(ZMIN, ZMAX, RMIN, RMAX);

%% Журналирование
delete 'temp/*' % очистка временных файлов

global ModelStateCounter;
  ModelStateCounter = 0; % инициализация счётчика состояний модели

setCheckpoint(); % создаём чекпойнт
refreshView(); % обновляем вид
