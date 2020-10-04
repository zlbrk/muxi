function loadModel(filename)
global POINTS
global SIDES
global ModelStateCounter

filename = ['saves/' filename];
% TODO
% - Проверка на наличие файла в директории saves
% - Вывод подсказки, если файл не найден
% - Задача со звёздочкой: вывод подсказки, если функция вызвана без аргументов, 
%   Подсказка: нужно использовать varargin (в хелпе есть классный пример).

load(filename, 'POINTS', 'SIDES');

delete 'temp/*' % очистка временных файлов
ModelStateCounter = 0; % инициализация счётчика состояний модели

setCheckpoint(); % создаём чекпойнт

clearCarts(); % умещаем модель на канве
fitView(); % умещаем модель на канве

fprintf('Your model stored in "muxi/saves/%s.mat" file\n successfully loaded \n', filename);
fprintf('Variables "POINTS" and "Colors" have been changed \n');

end