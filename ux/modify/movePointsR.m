% Переместить выбранные точки относительно их текущего положения по R
function movePointsR(dr)
	global PCART;
	global POINTS;

	if ~isempty(PCART)
		for i = PCART
			POINTS(i).Z = POINTS(i).Z;
			POINTS(i).R = POINTS(i).R + dr;
		end
	else
		fprintf('PCART is empty. Nothing to move!\n');
	end
	
	refreshSides(); % Обновляем структуру сегментов? Нужно ли это здесь?
	setCheckpoint(); % Создаём чекпойнт
	clearPCart();
	refreshView(); % Обновляем вид
end
