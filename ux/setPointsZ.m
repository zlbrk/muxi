% Установить одинаковую Z-координату для всех выбранных точек
function setPointsZ(Znew)
	global Cart;
	global ConStruct;

	if ~isempty(Cart)
		for i = Cart
			ConStruct(i).Z = Znew;
			ConStruct(i).R = ConStruct(i).R;
		end
	else
		fprintf('Cart is empty. Nothing to move!\n');
	end

	refreshView(); % Обновляем вид
end
