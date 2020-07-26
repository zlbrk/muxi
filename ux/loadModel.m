function loadModel(filename)
global ConStruct

filename = ['saves/' filename];
% TODO
% - Проверка на наличие файла в директории saves
% - Вывод подсказки, если файл не найден
% - Задача со звёздочкой: вывод подсказки, если функция вызвана без аргументов, 
%   Подсказка: нужно использовать varargin (в хелпе есть классный пример).

load(filename, 'ConStruct');
clearCart();

fprintf('Your model stored in "muxi/saves/%s.mat" file\n successfully loaded \n', filename);
fprintf('Variables "ConStruct" and "Colors" have been changed \n');

end