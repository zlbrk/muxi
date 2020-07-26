% Установить новое положение для выбранной точки
function setPointPosition(Znew, Rnew)
	global Cart;
	global ConStruct;

	if numel(Cart) == 1

		ConStruct(Cart).Z = Znew;
		ConStruct(Cart).R = Rnew;
		
	else
		if isempty(Cart)
			fprintf("Cart is empty. Nothing to move!\n");
		elseif numel(Cart) > 1
			fprintf("Setting position for several points at once doesn't permitted!\nConsider 'move up to' command, if needed\n");
		end
	end

	setCheckpoint(); % Создаём чекпойнт
	refreshView(); % Обновляем вид
end
