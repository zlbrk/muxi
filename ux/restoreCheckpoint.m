% Загружаем конкретное состояние модели
function restoreCheckpoint(State)
global ConStruct
global ModelStateCounter

filename = sprintf('temp/state_%d', State);

load(filename, 'ConStruct', 'ModelStateCounter');

clearCart();

refreshView();

fprintf('Checkpoint successfully restored!\n');

end