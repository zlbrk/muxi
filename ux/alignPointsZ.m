% Выровнять Z-координаты выбранных точек по точке с определённым номером 
function alignPointsZ(AlignPointId)
	global PCart;
	global ConStruct;

	if ~isempty(PCart)
		for i = PCart
			ConStruct(i).Z = ConStruct(AlignPointId).Z;
			ConStruct(i).R = ConStruct(i).R;
		end
	else
		fprintf('PCart is empty. Nothing to move!\n');
	end

	setCheckpoint(); % Создаём чекпойнт
	refreshView(); % Обновляем вид
end
