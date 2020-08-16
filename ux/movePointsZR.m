% Переместить выбранные точки относительно их текущего положения по R
function movePointsZR(dz, dr)
	global PCart;
	global ConStruct;

	if ~isempty(PCart)
		for i = PCart
			ConStruct(i).Z = ConStruct(i).Z + dz;
			ConStruct(i).R = ConStruct(i).R + dr;
		end
	else
		fprintf('PCart is empty. Nothing to move!\n');
	end

	setCheckpoint(); % Создаём чекпойнт
	refreshView(); % Обновляем вид
end
