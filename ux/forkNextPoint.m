function forkNextPoint(off_mm)
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
	makeDuplicate(PointId);
	refreshView(); % Обновляем вид

	% >>BRK
	st = dbstack; 
	funcName = st.name;
	eval(sprintf('save %s',funcName));
	eval(sprintf('movefile %s.mat ./debug', funcName));
	return
	
	moveDuplicate(off_mm);

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