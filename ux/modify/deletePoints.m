function deletePoints()
% удаление точек из контура
% надо сделать аргумент необязательным
global PCART;
global POINTS;

if numel(PCART)< 1
	fprintf('At least one point should be selected!\n');
	return
else
	sortedPCART = sort(PCART,'descend'); % Выбранные точки отсортированы в нисходящем порядке
	
	for i = sortedPCART
		delPoint(i);
	end
end

refreshSides(); % Обновляем структуру сегментов
setCheckpoint(); % Создаём чекпойнт
clearCarts(); % Очищаем корзинки
refreshView(); % Обновляем вид

function delPoint(id)

	Head = POINTS(1:id-1); % Точки от начала структуры до удаляемой точки, исключая её саму.
	Tail = POINTS(id+1:end); % Точки от удаляемой, не включая её, до конца структуры
	
	for j = 1:numel(Tail)
		Tail(j).id = Tail(j).id-1; % сдвигаем индексы хвостовых точек на один шаг назад
	end

	POINTS = [Head Tail]; % Новая структура, не содержащая исключаемую точку.

end
end