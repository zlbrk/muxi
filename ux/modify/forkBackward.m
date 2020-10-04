function forkBackward(off_mm)
% форк выбранной точки по направлению 
% к предыдущей

	global PCART;
	global POINTS;

	if numel(PCART)> 1
		fprintf('Only one point should be selected!\n');
		return
	end

% Если выбирается последняя точка контура
numPoints = numel([POINTS.id]);

	if PCART == 1
		fprintf('First point selected! Try another point in range: [2 %d]\n',numPoints);
		return
	end

	PointId = PCART;
	% Определяем вектор сдвига
	[dz, dr] = dZdR(PointId, off_mm);

	% Дублируем выбранную точку
	makeDuplicate(PointId);
	
	
	% Выбирать дубликат не требуется, поскольку он уже выбран.

	% Перемещаем дубликат на заданное расстояние
	movePointsZR(dz, dr);
	refreshSides(); % Обновляем структуру сегментов
	% setCheckpoint(); % Создаём чекпойнт
	refreshView(); % Обновляем вид

end

function makeDuplicate(PointId)
	global POINTS;

	% Определяем голову и хвост относительно выбранной точки
	Head = POINTS(1:PointId-1);
	Tail = POINTS(PointId:end);

	% Сдвигаем точки хвоста на один шаг вперёд
	for i = 1:numel(Tail)
		Tail(i).id = Tail(i).id + 1;
	end

	NPoint = POINTS(PointId); % Новая точка-дубликат
	NPoint.id = PointId;
	NPoint.prev = NPoint.id - 1;
	NPoint.next = NPoint.id + 1;

	% Добавляем новую точку-дубликат в контур
	POINTS = [Head NPoint Tail];

end

function [dz, dr] = dZdR(PointId, off_mm)
	global POINTS;
	DZ = POINTS(PointId-1).Z - POINTS(PointId).Z;
	DR = POINTS(PointId-1).R - POINTS(PointId).R;
	vec_DZDR = [DZ DR];
	abs_DZDR = sqrt(vec_DZDR*vec_DZDR');
	ratio = off_mm/abs_DZDR;
	vec_dzdr = vec_DZDR*ratio;
	dz = vec_dzdr(1);
	dr = vec_dzdr(2);
	fprintf('Point have been moved backward by %g mm\n', off_mm);		

end