function restoreCheckpoint()
global ConStruct
global Colors

filename = 'temp/checkpoint.mat';
% TODO
% - Проверка на наличие файла в директории saves
% - Вывод подсказки, если файл не найден
% - Задача со звёздочкой: вывод подсказки, если функция вызвана без аргументов, 
%   Подсказка: нужно использовать varargin (в хелпе есть классный пример).

load(filename, 'ConStruct', 'Colors');
clearCart();

fprintf('Checkpoint successfully restored \n');

end