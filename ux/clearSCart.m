% Очистить корзину
function clearSCart()
	global SCart;
	global PCart;
	SCart = [];
	PCart = [];
	refreshView(); % Обновляем вид
end
