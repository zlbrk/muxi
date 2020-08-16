% Выровнять R-координаты выбранных точек по точке с определённым номером 
function alignPointsR(AlignPointId)
	global PCart;
	global ConStruct;

	if ~isempty(PCart)
		for i = PCart
			ConStruct(i).Z = ConStruct(i).Z;
			ConStruct(i).R = ConStruct(AlignPointId).R;
		end
	else
		fprintf('PCart is empty. Nothing to move!\n');
	end

	setCheckpoint(); % Создаём чекпойнт
	refreshView(); % Обновляем вид
end
