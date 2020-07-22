function undoLastCommand()

	diary off; % выключаем журналирование
	type 'temp/cmd.log'
	%% Считываем и журнал в переменную commands
	infile = 'temp/cmd.log';
	infid = fopen('temp/cmd.log','rt');

	commands = {}; % коммнадны будут храниться здесь построчно
	lines = 0; % на всякий случай счётчик строк
	tline = fgetl(infid);
	while ischar(tline)
		commands = {commands; tline};
		lines = lines+1;
		tline = fgetl(infid);
	end
	fclose('all');
	commands % debug

	delete temp/cmd.log % удаляем старый журнал

	diary temp/cmd.log % создаём новый журнал с тем же именем

	restoreCheckpoint(); % восстанавливаем модель из чекпойнта
	for i = 1:numel(commands)-2
		evalc(string(commands(i))); % выполняем все команды из старого журнала за исключением двух последних 
	end


fprintf("Last command undone!\n"); % поздравляем пользователя с победой!

end
