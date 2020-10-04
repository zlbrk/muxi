% Загружаем конкретное состояние модели
function restoreCheckpoint(State)
global POINTS
global ModelStateCounter

filename = sprintf('temp/state_%d', State);

load(filename, 'POINTS', 'ModelStateCounter');

clearPCart();

refreshView();

fprintf('Checkpoint successfully restored!\n');

end