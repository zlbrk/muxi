% Очистить корзину
function clearCarts()
	global SCart;
	global PCart;
	SCart = [];
	PCart = [];
	refreshView(); % Обновляем вид
end
