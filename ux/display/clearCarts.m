% Очистить корзину
function clearCarts()
	global SCART;
	global PCART;
	SCART = [];
	PCART = [];
	refreshView(); % Обновляем вид
end
