% Установить новое положение для выбранной точки
function setPointPosition(Znew, Rnew)
	global PCart;
	global ConStruct;

	if numel(PCart) == 1

		ConStruct(PCart).Z = Znew;
		ConStruct(PCart).R = Rnew;
		
	else
		if isempty(PCart)
			fprintf("PCart is empty. Nothing to move!\n");
		elseif numel(PCart) > 1
			fprintf("Setting position for several points at once doesn't permitted!\nConsider 'move up to' command, if needed\n");
		end
	end
	
	refreshSides(); % Обновляем структуру сегментов? Нужно ли это здесь?
	setCheckpoint(); % Создаём чекпойнт
	refreshView(); % Обновляем вид
end
