% Очистить корзину
function clearCart()
	global Cart;
	Cart = [];
	refreshView(); % Обновляем вид
end
