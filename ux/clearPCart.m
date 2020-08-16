% Очистить корзину
function clearPCart()
	global PCart; 
	PCart = [];
	refreshView(); % Обновляем вид
end
