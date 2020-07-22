% Выровнять R-координаты выбранных точек по точке с определённым номером 
function alignPointsR(AlignPointId)
	global Cart;
	global ConStruct;

	if ~isempty(Cart)
		for i = Cart
			ConStruct(i).Z = ConStruct(i).Z;
			ConStruct(i).R = ConStruct(AlignPointId).R;
		end
	else
		fprintf('Cart is empty. Nothing to move!\n');
	end

	refreshView(); % Обновляем вид
end
