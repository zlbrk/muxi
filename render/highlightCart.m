function highlightCart()
	global Cart;
	global ConStruct;
	global Colors;
	if ~isempty(Cart)
		for i = Cart
			drawPoint(ConStruct(i), 's', Colors.Picked, 16); % подсвечиваем выбранные точки
		end
	else
		fprintf('Cart is empty. Nothing to highlight!\n');
	end
end
