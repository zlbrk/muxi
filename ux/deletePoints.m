function deletePoints()
% удаление точек из контура
% надо сделать аргумент необязательным
global Cart;
global ConStruct;

if numel(Cart)< 1
	fprintf('At least one point should be selected!\n');
	return
else
	sortedCart = sort(Cart,'descend'); % Выбранные точки отсортированы в нисходящем порядке
	
	for i = sortedCart
		delPoint(i);
	end
end
clearCart();

setCheckpoint(); % Создаём чекпойнт
refreshView(); % Обновляем вид

function delPoint(id)

	Head = ConStruct(1:id-1); % Точки от начала структуры до удаляемой точки, исключая её саму.
	Tail = ConStruct(id+1:end); % Точки от удаляемой, не включая её, до конца структуры
	
	for j = 1:numel(Tail)
		Tail(j).id = Tail(j).id-1; % сдвигаем индексы хвостовых точек на один шаг назад
	end

	ConStruct = [Head Tail]; % Новая структура, не содержащая исключаемую точку.

end
end