%% Аллигатор
clear;
close all;
clc;

global Colors;
  Colors.Void = [220, 220, 220]/255;
  Colors.PointIDs = [220, 220, 220]/255;
  Colors.Points = [25, 100, 150]/255;
  Colors.Picked = [240, 20, 240]/255;
  Colors.Cathode = [242, 20, 140]/255;

global Cart;
  Cart = []; % Корзинка для точек

global Cathode; 
  Cathode = []; % Катод как структура
  Cathode.type = 'flat';
  Cathode.Z = [1 1];
  Cathode.R = [0 1.1];

global ConStruct;
  ConStruct = []; % Контур как множество точек -- массив структур contour structure

% Определяем координаты точек контура
ZR(:, 1) = [1., 1., 1.32, 1.32, 1.62, 1.62, 5.27, 5.27, 45, 45];
ZR(:, 2) = [1.E-8, 7, 7, 1.2, 1.2, 7, 7, 0.9, 0.9, 0];
ZRpts = numel(ZR(:, 1)); % Количество точек в контуре

% Инициализируем объект-контур
for i = 1:ZRpts
	p.id = i;
	
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
	if p.R > 0
		p.isArc = 0;
	elseif p.R < 0
		p.isArc = 1;
	end
	
	ConStruct = [ConStruct p];
end

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
% зоныR    0.,8.0
% шагиR    187
% зоныZ    0.,3.,6.3,18.,34.
% шагиZ    19,76,127,76



% Сетка по R
bndsR = [0, 4, 7];
zonesR = diff(bndsR);
stepsR = [150, 100];
dr1 = zonesR(1)/stepsR(1);
dr2 = zonesR(2)/stepsR(2);
rr = [bndsR(1):dr1:bndsR(2), bndsR(2):dr2:bndsR(3)];
rmin = min(rr);
rmax = max(rr);

% Сетка по Z
bndsZ = [0.7, 6, 45];
zonesZ = diff(bndsZ);
stepsZ = [150, 100];
dz1 = zonesZ(1)/stepsZ(1);
dz2 = zonesZ(2)/stepsZ(2);
zz = [bndsZ(1):dz1:bndsZ(2), bndsZ(2):dz2:bndsZ(3)];


%% Рисуем наш контур
% --------------------------------------------------
% drawVoid();

%% Рисуем наши точки
% --------------------------------------------------
% drawPoints();

%% Рисуем наш катод
% --------------------------------------------------
% drawCathode();


% drawMesh(zz, rr);

initFigure(ZMIN, ZMAX, RMIN, RMAX);
% pause
drawVoid();
% pause
drawPoints();
% pause
drawCathode();
% pause
showPointIDs();


%% API
% ==================================================
pickPoints = @(Ids) pickPoints_(Ids);
dropPoints = @(Ids) dropPoints_(Ids);
clearCart = @() clearCart_();
% refreshView = @() refreshView_();
movePoints = @(dz, dr) movePoints_(dz, dr);

%% Полезные функции
% ==================================================

function initFigure(ZMIN, ZMAX, RMIN, RMAX)
	global GA;
	figure
	GA = gca();
	grid on
	xlim([ZMIN ZMAX]);
	ylim([RMIN RMAX]);
	xlabel('Z, mm');
	ylabel('R, mm');
	set(gca(),'FontSize', 16);
	daspect([1 1 1]);
end

function drawVoid()
	global ConStruct;
	global Colors;
	hold on
	fill([ConStruct.Z], [ConStruct.R], Colors.Void);
	hold off;
end

function drawCathode()
	global Cathode;
	global Colors;
	hold on;
	plot([Cathode.Z], [Cathode.R], 'Color', Colors.Cathode, 'LineWidth', 2);
	for i =1:numel([Cathode.Z])
		p.Z = Cathode.Z(i);
		p.R = Cathode.R(i);
		drawPoint(p, 'o', Colors.Cathode, 6);
	end
	hold off;
end

function drawMesh(zz, rr)
	rmin = min(rr);
	rmax = max(rr);
	zmin = min(zz);
	zmax = max(zz);

	hold on; % Замораживаем текущие оси координат
	for i = 1:numel(rr)
		plot([zmin zmax], [rr(i) rr(i)], 'Color', [0.5 0.5 0.5]);
	end
	
	for i = 1:numel(zz)
		plot([zz(i) zz(i)], [rmin rmax], 'Color', [0.5 0.5 0.5]);
	end
	hold off; % Замораживаем текущие оси координат
end


function drawPoint(p, markerType, markerColor, markerSize)
	hold on; % Замораживаем текущие оси координат
	plot(p.Z, p.R, markerType,...
	'LineWidth',1.0,...
	'MarkerEdgeColor', markerColor, ...
	'MarkerFaceColor', markerColor, ...
	'MarkerSize', markerSize);
	hold off; % Замораживаем текущие оси координат
end

% добавление точек в корзину
function pickPoints_(PointIds)
	global Cart;
	global ConStruct;

	for i = PointIds
		if ~ismember(i, [ConStruct.id])
			fprintf('Point #%d does not exist!\n',i);
			continue
		end
		if ~ismember(i, Cart)
			Cart = [Cart i];
		else
			fprintf('Point #%d is already in the Cart!\n', i);
		end
	end

	refreshView_(); % Обновляем вид
end

% удаление точек из корзины
function dropPoints_(PointIds)
	global Cart;
	global ConStruct;

	for i = PointIds
		if ~ismember(i, [ConStruct.id])
			fprintf('Point #%d does not exist!\n',i);
			continue
		end
		if ~ismember(i, Cart)
			fprintf('Point #%d is not in the Cart!\n', i);
		end
		id = find(Cart==i);
		Cart(id)=[];
	end
	
	refreshView_(); % Обновляем вид
end

% Перерисовка рабочего вида
function refreshView_()
	global GA;	
	cla(); % очищаем оси
	drawVoid(); % рисуем контур
	drawPoints(); % рисуем все точки
	highlightCart(); % подсвечиваем выбранные точки

	drawCathode();

	showPointIDs(); % Выводим номера точек
	
	xlim(GA.XLim);
	ylim(GA.YLim);
	daspect(GA.DataAspectRatio);
end

function drawPoints()
	global ConStruct;
	global Colors;

	for i = 1:numel(ConStruct)
		drawPoint(ConStruct(i), 's', Colors.Points, 14);
		% fprintf('Point %d is dwawn\n', i);
	end	
end

function showPointIDs()
	global ConStruct;
	global Colors;

	for i = 1:numel(ConStruct)
		text(ConStruct(i).Z, ConStruct(i).R, num2str(ConStruct(i).id),...
		 'Color', Colors.PointIDs,...
		 'FontName', 'Consolas',...
		 'FontWeight', 'bold',...
		 'FontSize', 11,...
		 'HorizontalAlignment','center');	
	end	
end

function highlightCart()
	global Cart;
	global ConStruct;
	global Colors;
	if ~isempty(Cart)
		for i = Cart
			drawPoint(ConStruct(i), 's', Colors.Picked, 14); % подсвечиваем выбранные точки
		end
	else
		fprintf('Cart is empty. Nothing to highlight!\n');
	end
end

% очистка корзины
function clearCart_()
	global Cart;
	Cart = [];
	refreshView_(); % Обновляем вид
end

% переместить выбранные точки
function movePoints_(dz, dr)
	global Cart;
	global ConStruct;

	if ~isempty(Cart)
		for i = Cart
			ConStruct(i).Z = ConStruct(i).Z + dz;
			ConStruct(i).R = ConStruct(i).R + dr;
		end
	else
		fprintf('Cart is empty. Nothing to move!\n');
	end

	refreshView_(); % Обновляем вид
end
