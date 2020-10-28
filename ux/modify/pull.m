% Основной инструмент прямого редактирования контура 
function pull(off_mm)
	global SCART; % Нам понадобятся выбранные стороны
	global SIDES; % Нам не только выбранные стороны
	global POINTS; % И координаты точек

	if isempty(SCART)
		fprintf('SCART is empty. Nothing to push or pull!\n');
	end
	if numel(SCART)>1
		fprintf('Only one side can be pulled or pushed simultaneously!\n');
	end
	if numel(SCART)==1
		fprintf('Side #%d pulled by %g mm!\n', SCART, off_mm);
	end
	[pointsToFork, directions] = whichPointsToFork(SCART);
	sortedPointsToFork = sort(pointsToFork,'ascend');
	if numel(sortedPointsToFork)==2
		clearCarts();
		pickPoints(sortedPointsToFork(1));
		forkForward(0); % Дублируем первую точку
		clearCarts();
		pickPoints(sortedPointsToFork(2)+1);
		forkBackward(0); % Дублируем вторую точку, которая остаётся выбранной
		clearCarts();
		pickSIDES(sortedPointsToFork(1)+1); % Выбираем новую сторону
		PD = off_mm*directions(:,1); % Points displacement
		movePointsZR(PD(1),PD(2));
	end

	if pointsToFork == SIDES(SCART).SP
		% Контравариантный случай (левый нижний угол)
		clearCarts();
		pickPoints(sortedPointsToFork(1));
		forkForward(0); % Дублируем начальную точку сегмента
		SPD = off_mm*directions(:,1); % Starting Point Displacement
		movePointsZR(SPD(1),SPD(2)); % Перемещаем форкнутую точку по нормали
		
		clearCarts();
		pickPoints(sortedPointsToFork(1)+2); % Выбираем угловую точку (теперь через одну после начальной)
		EPD = off_mm*directions(:,2); % Ending Point Displacement
		movePointsZR(EPD(1),EPD(2)); % Перемещаем угловую точку против тангенциали
	
	elseif pointsToFork == SIDES(SCART).EP
		% Ковариантный случай (правый нижний угол)
		clearCarts();
		pickPoints(sortedPointsToFork(1));
		forkBackward(0); % Дублируем конечную точку сегмента
		SPD = off_mm*directions(:,2); % Starting Point Displacement
		movePointsZR(SPD(1),SPD(2)); % Угловую точку по тангенциали
		
		clearCarts();
		pickPoints(sortedPointsToFork(1)-1); % Выбираем угловую точку (предыдущая от конечной, форкнутой вперёд)
		EPD = off_mm*directions(:,1); % Starting Point Displacement
		movePointsZR(EPD(1),EPD(2)); % Перемещаем угловую точку против тангенциали
	end

	if isempty(pointsToFork)
		% Корыто (правый нижний угол)
		dropPoints(SIDES(SCART).EP); % Сбрасываем выбор конечной точки
		SPD = off_mm*directions(:,1); % Starting Point Displacement
		movePointsZR(SPD(1),SPD(2)); % Перемещаем первую точку по тангенциали

		dropPoints(SIDES(SCART).SP); % Сбрасываем выбор начальной точки
		pickPoints(SIDES(SCART).EP); % Выбор конечной точки
		EPD = off_mm*directions(:,2); % Ending Point Displacement
		movePointsZR(SPD(1),SPD(2)); % Перемещаем первую точку по тангенциали
		disp('Корыто')
	end

	% setCheckpoint(); % Создаём чекпойнт
	refreshView(); % Обновляем вид
end

%% whichNeedFork: function description
function [pointsToFork, directions] = whichPointsToFork(sNumber)
	global SIDES;
	C = SIDES(sNumber).id; % номер выбранной стороны
	P = SIDES(sNumber).prev; % номер предыдущей стороны
	N = SIDES(sNumber).next; % номер следующей стороны
	
	CN = getNormal(C); % вектор нормали выбранной стороны
	PN = getNormal(P); % вектор нормали предыдущей стороны
	NN = getNormal(N); % вектор нормали следующей стороны

	PC_cross = cross([CN' 0], [PN' 0]); % prev - central normals cross product
	PC_mod = PC_cross*PC_cross'; % prev - central cross product modulus
	NC_cross = cross([CN' 0], [NN' 0]); % next - central normals cross product
	NC_mod = NC_cross*NC_cross'; % next - central cross product modulus

	if (PC_mod <= eps) && (NC_mod <= eps) % Все три сегмента лежат на одной прямой
		pointsToFork = [SIDES(sNumber).SP SIDES(sNumber).EP];
		directions = [CN CN];
	elseif (PC_mod <= eps) && (NC_mod > eps) % Левый сегмент лежит, а правый нет
		pointsToFork = [SIDES(sNumber).SP];
		NPD = rotateVector(getTangential(N), 180); % Next point direction
		directions = [CN NPD];
	elseif (PC_mod > eps) && (NC_mod <= eps) % Правый лежит, а левый - нет
		pointsToFork = [SIDES(sNumber).EP];
		PPD = getTangential(P); % Prev point direction
		directions = [PPD CN];
	elseif (PC_mod > eps) && (NC_mod > eps)
		% Корыто
		pointsToFork = [];
		PPD = getTangential(P) % Prev point direction
		NPD = getTangential(N) % Next point direction
		directions = [PPD NPD]; % Грязный хак :(
	end
end

function [normal] = getNormal(sNumber)
	global SIDES;
	global POINTS;
	[ntnd] = getTangential(sNumber); % normalized tangential
	[normal] = rotateVector(ntnd, 90); % normalized normal
end

%% getTangential: function description
function [ntnd] = getTangential(sNumber)
	global SIDES;
	global POINTS;
	% start point ZR
	SPZ = POINTS(SIDES(sNumber).SP).Z;
	SPR = POINTS(SIDES(sNumber).SP).R;
	% end point ZR
	EPZ = POINTS(SIDES(sNumber).EP).Z;
	EPR = POINTS(SIDES(sNumber).EP).R;
	tng = [(EPZ-SPZ) (EPR - SPR)]'; % tangential={dz, dr}
	ntnd = tng./sqrt(tng'*tng); % normalization
end

%% rotateVector: function description
function [vec1] = rotateVector(vec0, deg)
	RM = [cosd(deg) sind(deg)
				-sind(deg) cosd(deg)]; % Rotation matrix
	vec1 = RM*vec0;
end

	
