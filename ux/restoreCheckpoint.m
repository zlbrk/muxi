% Загружаем конкретное состояние модели
function restoreCheckpoint(State)
global POINTS;
global SIDES;
global ModelStateCounter;

filename = sprintf('temp/state_%d', State);

load(filename, 'POINTS', 'SIDES', 'ModelStateCounter');

clearCarts();

refreshView();

fprintf('Checkpoint successfully restored!\n');

end