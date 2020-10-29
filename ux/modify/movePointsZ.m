% Переместить выбранные точки относительно их текущего положения по R
function movePointsZ(dz)
	global PCART;
	global POINTS;

	if ~isempty(PCART)
		for i = PCART
			POINTS(i).Z = POINTS(i).Z + dz;
			POINTS(i).R = POINTS(i).R;
		end
	else
		fprintf('PCART is empty. Nothing to move!\n');
	end
	
	refreshSides(); % Обновляем структуру сегментов? Нужно ли это здесь?
	setCheckpoint(); % Создаём чекпойнт
	clearPCart();
	refreshView(); % Обновляем вид
end
