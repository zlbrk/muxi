% Выровнять Z-координаты выбранных точек по точке с определённым номером 
function alignPointsZ(AlignPointId)
	global Cart;
	global ConStruct;

	if ~isempty(Cart)
		for i = Cart
			ConStruct(i).Z = ConStruct(AlignPointId).Z;
			ConStruct(i).R = ConStruct(i).R;
		end
	else
		fprintf('Cart is empty. Nothing to move!\n');
	end

	setCheckpoint(); % Создаём чекпойнт
	refreshView(); % Обновляем вид
end
