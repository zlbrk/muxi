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

% Инициализируем Пробный регион
if exist('saves/Triangle.mat')==2
	lm('Triangle');
else
	initDummy(5, 3);
end

%% Инициализация журналирования
delete 'temp/*' % очистка временных файлов

global ModelStateCounter;
  ModelStateCounter = 0; % инициализация счётчика состояний модели

setCheckpoint(); % создаём начальный чекпойнт
refreshView(); % обновляем вид

% Подгоняем масштаб
fitView();