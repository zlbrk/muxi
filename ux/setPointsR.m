% Установить одинаковую R-координату для всех выбранных точек
function setPointsR(Rnew)
	global PCart;
	global ConStruct;

	if ~isempty(PCart)
		for i = PCart
			ConStruct(i).Z = ConStruct(i).Z;
			ConStruct(i).R = Rnew;
		end
	else
		fprintf('PCart is empty. Nothing to move!\n');
	end

	setCheckpoint(); % Создаём чекпойнт
	refreshView(); % Обновляем вид
end
