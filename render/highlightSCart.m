function highlightSCart()
	global SCart;
	global Sides;
	global Colors;
	if ~isempty(SCart)
		for i = SCart
			drawSide(Sides(i), Colors.Picked, 2); % подсвечиваем выбранные сегменты
		end
	else
		fprintf('SCart is empty. Nothing to highlight!\n');
	end
end
