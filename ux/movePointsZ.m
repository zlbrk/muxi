% Переместить выбранные точки относительно их текущего положения по R
function movePointsZ(dz)
	global Cart;
	global ConStruct;

	if ~isempty(Cart)
		for i = Cart
			ConStruct(i).Z = ConStruct(i).Z + dz;
			ConStruct(i).R = ConStruct(i).R;
		end
	else
		fprintf('Cart is empty. Nothing to move!\n');
	end

	setCheckpoint(); % Создаём чекпойнт
	refreshView(); % Обновляем вид
end
