% Основной инструмент прямого редактирования контура 
function pullPush(off_mm)
	global SCart; % Нам понадобятся выбранные стороны
	% global PCart; % Нам понадобится корзинка с точками стороны
	global ConStruct; % И координаты точек

	if isempty(SCart)
		fprintf('SCart is empty. Nothing to push or pull!\n');
	end
	if numel(SCart)>1
		fprintf('Only one side can be pulled or pushed simultaneously!\n');
	end

	if numel(SCart)==1
		fprintf('Side #%d pulled by %g mm!\n', SCart, off_mm);
	end
	[pointsToFork, directions] = whichPointsToFork(SCart)
	sortedPointsToFork = sort(pointsToFork,'ascend');
	if numel(sortedPointsToFork)==2
		clearCarts();
		pickPoints(sortedPointsToFork(1));
		forkForward(0); % Дублируем первую точку
		clearCarts();
		pickPoints(sortedPointsToFork(2)+1);
		forkBackward(0); % Дублируем вторую точку, которая остаётся выбранной
		clearCarts();
		pickSides(sortedPointsToFork(1)+1); % Выбираем новую сторону
		PD = off_mm*directions(:,1); % Points displacement
		movePointsZR(PD(1),PD(2));
	end

	setCheckpoint(); % Создаём чекпойнт
	refreshView(); % Обновляем вид
end

%% whichNeedFork: function description
function [pointsToFork, directions] = whichPointsToFork(sNumber)
	global Sides;
	C = Sides(sNumber).id; % номер выбранной стороны
	P = Sides(sNumber).prev; % номер предыдущей стороны
	N = Sides(sNumber).next % номер следующей стороны
	
	CN = getNormal(C) % вектор нормали выбранной стороны
	PN = getNormal(P) % вектор нормали предыдущей стороны
	NN = getNormal(N) % вектор нормали следующей стороны

	PC_cross = cross([CN' 0], [PN' 0]); % prev - central normals cross product
	PC_mod = PC_cross*PC_cross'; % prev - central cross product modulus
	NC_cross = cross([CN' 0], [NN' 0]); % next - central normals cross product
	NC_mod = NC_cross*NC_cross'; % next - central cross product modulus

	if (PC_mod <= eps) && (NC_mod <= eps) % Все три сегмента лежат на одной прямой
		pointsToFork = [Sides(sNumber).SP Sides(sNumber).EP];
		directions = [CN CN];
	elseif (PC_mod <= eps) && (NC_mod > eps) % Левый сегмент лежит, а правый нет
		pointsToFork = [Sides(sNumber).SP];
		NPD = rotateVector(getTangential(N), 180); % Next point direction
		directions = [CN NPD];
	elseif (PC_mod > eps) && (NC_mod <= eps) % Правый лежит, а левый - нет
		pointsToFork = [Sides(sNumber).EP];
		PPD = getTangential(P); % Prev point direction
		directions = [PPD CN];
	end
end

function [normal] = getNormal(sNumber)
	global Sides;
	global ConStruct;
	[ntnd] = getTangential(sNumber); % normalized tangential
	[normal] = rotateVector(ntnd, 90); % normalized normal
end

%% getTangential: function description
function [ntnd] = getTangential(sNumber)
	global Sides;
	global ConStruct;
	% start point ZR
	SPZ = ConStruct(Sides(sNumber).SP).Z;
	SPR = ConStruct(Sides(sNumber).SP).R;
	% end point ZR
	EPZ = ConStruct(Sides(sNumber).EP).Z;
	EPR = ConStruct(Sides(sNumber).EP).R;
	tng = [(EPZ-SPZ) (EPR - SPR)]'; % tangential={dz, dr}
	ntnd = tng./sqrt(tng'*tng); % normalization
end

%% rotateVector: function description
function [vec1] = rotateVector(vec0, deg)
	RM = [cosd(deg) sind(deg)
				-sind(deg) cosd(deg)]; % Rotation matrix
	vec1 = RM*vec0;
end

	
