function undoLastCommand()
global ModelStateCounter;

if ModelStateCounter>1
	restoreCheckpoint(ModelStateCounter-1); % восстанавливаем модель из чекпойнта
	fprintf("Last command undone!\n"); % поздравляем пользователя с победой!
else
	fprintf("Initial state reached. Nothing to undo!\n"); % предупреждаем, что дальше уже ничего нет
end

end
