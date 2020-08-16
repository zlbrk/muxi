% Очистить корзину
function clearSCart()
	global SCart; 
	SCart = [];
	refreshView(); % Обновляем вид
end
