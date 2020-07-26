function redoLastCommand()
global ModelStateCounter;

% Check available states
states=dir(['temp' '/state*.mat']);
statesNumber=numel(states);

if ModelStateCounter < statesNumber
	restoreCheckpoint(ModelStateCounter+1); % восстанавливаем модель из чекпойнта
	fprintf("Last command redone!\n"); % поздравляем пользователя с победой!
else
	fprintf("Final state reached. Nothing to redo!\n"); % предупреждаем, что дальше уже ничего нет
end

end
