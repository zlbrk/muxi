% Переместить выбранные точки относительно их текущего положения по R
function movePointsR(dr)
	global Cart;
	global ConStruct;

	if ~isempty(Cart)
		for i = Cart
			ConStruct(i).Z = ConStruct(i).Z;
			ConStruct(i).R = ConStruct(i).R + dr;
		end
	else
		fprintf('Cart is empty. Nothing to move!\n');
	end

	setCheckpoint(); % Создаём чекпойнт
	refreshView(); % Обновляем вид
end
