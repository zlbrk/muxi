% Установить одинаковую Z-координату для всех выбранных точек
function setPointsZ(Znew)
	global PCart;
	global ConStruct;

	if ~isempty(PCart)
		for i = PCart
			ConStruct(i).Z = Znew;
			ConStruct(i).R = ConStruct(i).R;
		end
	else
		fprintf('PCart is empty. Nothing to move!\n');
	end

	setCheckpoint(); % Создаём чекпойнт
	refreshView(); % Обновляем вид
end
