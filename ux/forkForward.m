function forkForward(off_mm)
% форк выбранной точки по направлению 
% к следующей

	global Cart;
	global ConStruct;

	if numel(Cart)> 1
		fprintf('Only one point should be selected!\n');
		return
	end

% Если выбирается последняя точка контура
numPoints = [ConStruct.id];

	if Cart == max(numPoints)
		fprintf('Last point selected! Try another point in range: [1 %d]\n',numPoints-1);
		return
	end

	PointId = Cart;
	% Определяем вектор сдвига
	[dz, dr] = dZdR(PointId, off_mm);
	% Дублируем выбранную точку
	makeDuplicate(PointId);
	% Выбираем дубликат
	clearCart();
	pickPoints(PointId+1);
	% Перемещаем дубликат на заданное расстояние
	movePoints(dz, dr);

	setCheckpoint(); % Создаём чекпойнт
	refreshView(); % Обновляем вид

end

function makeDuplicate(PointId)
	global ConStruct;

	% Определяем голову и хвост относительно выбранной точки
	Head = ConStruct(1:PointId);
	Tail = ConStruct(PointId+1:end);

	% Сдвигаем точки хвоста на один шаг вперёд
	for i = 1:numel(Tail)
		Tail(i).id = Tail(i).id + 1;
	end

	NPoint = ConStruct(PointId); % Новая точка-дубликат
	NPoint.id = PointId + 1;
	NPoint.prev = NPoint.id - 1;
	NPoint.next = NPoint.id + 1;

	% Добавляем новую точку-дубликат в контур
	ConStruct = [Head NPoint Tail];

end

function [dz, dr] = dZdR(PointId, off_mm)
	global ConStruct;
	DZ = ConStruct(PointId+1).Z - ConStruct(PointId).Z;
	DR = ConStruct(PointId+1).R - ConStruct(PointId).R;
	vec_DZDR = [DZ DR];
	abs_DZDR = sqrt(vec_DZDR*vec_DZDR');
	ratio = off_mm/abs_DZDR;
	vec_dzdr = vec_DZDR*ratio;
	dz = vec_dzdr(1);
	dr = vec_dzdr(2);
	fprintf('Point have been moved forward by %g mm\n', off_mm);		
end