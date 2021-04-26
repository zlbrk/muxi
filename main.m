%% Инициализация
clear;
close all;
clc;
%Определение псевдонимов API
aliases;

% Инициализация файловой системы проекта
initFS;

% Определяем глобальные переменные
initGlobals;

% Инициализируем канву
initFigure();

% Определяем параметры катода
CATS.Zc = 2;    % Z-координата катода (Z2)
CATS.Rc = 4.3;  % Радиус катода
CATS.Rs = 9;    % Радиус сферы
CATS.nTR = 30;  % Количество траекторий
CATS.SD = 0.075;% Sampling distance

% Инициализируем Пробный регион
initDummy();

% Доопределяем катод - положение центра сферы должно быть вычислено
setCATS(CATS.Zc, CATS.Rc, CATS.Rs, CATS.nTR, CATS.SD);

% Определяем параметры зон
ZONES.Z = [0.9, 2, 4, 8];
ZONES.R = [0, 2, 4.3];
ZONES.ZN = [55, 50, 45];
ZONES.RN = [210, 220];

%% Инициализация журналирования
delete 'temp/*' % очистка временных файлов

global ModelStateCounter;
  ModelStateCounter = 0; % инициализация счётчика состояний модели

setCheckpoint(); % создаём начальный чекпойнт
refreshView(); % обновляем вид

% Подгоняем масштаб
fitView();