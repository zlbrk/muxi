% Основной инструмент прямого редактирования контура 
function pullPush(off_mm)
	global SCart; % Нам понадобятся выбранные стороны
	global ConStruct; % И координаты точек

	if isempty(SCart)
		fprintf('SCart is empty. Nothing to push or pull!\n');
	end
	if numel(SCart)>1
		fprintf('Only one side can be pulled or pushed simultaneously!\n');
	end

	fprintf('Side #%d pulled by %g mm!\n', SCart, off_mm);
	setCheckpoint(); % Создаём чекпойнт
	refreshView(); % Обновляем вид
end
