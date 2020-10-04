% Очистить корзину
function clearPCart()
	global PCART; 
	PCART = [];
	refreshView(); % Обновляем вид
end
