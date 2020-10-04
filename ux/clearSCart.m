% Очистить корзину
function clearSCart()
	global SCART;
	global PCART;
	SCART = [];
	PCART = [];
	refreshView(); % Обновляем вид
end
