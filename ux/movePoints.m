% Переместить выбранные точки
function movePoints_(dz, dr)
	global Cart;
	global ConStruct;

	if ~isempty(Cart)
		for i = Cart
			ConStruct(i).Z = ConStruct(i).Z + dz;
			ConStruct(i).R = ConStruct(i).R + dr;
		end
	else
		fprintf('Cart is empty. Nothing to move!\n');
	end

	refreshView(); % Обновляем вид
end
