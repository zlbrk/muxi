function highlightPCart()
	global PCart;
	global ConStruct;
	global Colors;
	if ~isempty(PCart)
		for i = PCart
			drawPoint(ConStruct(i), 's', Colors.Picked, 16); % подсвечиваем выбранные точки
		end
	else
		fprintf('PCart is empty. Nothing to highlight!\n');
	end
end
