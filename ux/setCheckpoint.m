function setCheckpoint()
global ConStruct;
global ModelStateCounter;

ModelStateCounter = ModelStateCounter+1; % увеличиваем счётчик состояний

filename = sprintf('temp/state_%d', ModelStateCounter); % определяем имя нового состояния

save(filename, 'ConStruct', 'ModelStateCounter'); % сохраняем чекпойнт

fprintf('Checkpoint #%d successfully created!\n', ModelStateCounter); % сообщаем об успешном завершении операции

end