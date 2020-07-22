% Установить одинаковую R-координату для всех выбранных точек
function setPointsR(Rnew)
	global Cart;
	global ConStruct;

	if ~isempty(Cart)
		for i = Cart
			ConStruct(i).Z = ConStruct(i).Z;
			ConStruct(i).R = Rnew;
		end
	else
		fprintf('Cart is empty. Nothing to move!\n');
	end

	refreshView(); % Обновляем вид
end
