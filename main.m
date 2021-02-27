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
CATS.Zc = 2;
CATS.Rc = 4.3;
CATS.Rs = 9;
CATS.SD = 0.075;

% Инициализируем Пробный регион
initDummy();


%% Инициализация журналирования
delete 'temp/*' % очистка временных файлов

global ModelStateCounter;
  ModelStateCounter = 0; % инициализация счётчика состояний модели

setCheckpoint(); % создаём начальный чекпойнт
refreshView(); % обновляем вид

% Подгоняем масштаб
fitView();