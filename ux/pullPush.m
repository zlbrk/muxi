% Основной инструмент прямого редактирования контура 
function pullPush(off_mm)
	global SCart; % Нам понадобятся выбранные стороны
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
	pointsToFork = whichPointsToFork(SCart);

	setCheckpoint(); % Создаём чекпойнт
	refreshView(); % Обновляем вид
end

%% whichNeedFork: function description
function [pointsToFork] = whichPointsToFork(sNumber)
	global Sides;
	C = Sides(sNumber).id; % номер выбранной стороны
	P = Sides(sNumber).prev; % номер предыдущей стороны
	N = Sides(sNumber).next % номер следующей стороны
	
	CN = getNormal(C) % вектор нормали выбранной стороны
	PN = getNormal(P) % вектор нормали предыдущей стороны
	NN = getNormal(N) % вектор нормали следующей стороны

	PC_cross = cross([CN 0], [PN 0]); % prev - central normals cross product
	PC_mod = PC_cross*PC_cross'; % prev - central cross product modulus
	NC_cross = cross([CN 0], [NN 0]); % next - central normals cross product
	NC_mod = NC_cross*NC_cross'; % next - central cross product modulus
	pointsToFork = [];
end

function [normal] = getNormal(sNumber)
	global Sides;
	global ConStruct;
	% start point ZR
	SPZ = ConStruct(Sides(sNumber).SP).Z;
	SPR = ConStruct(Sides(sNumber).SP).R;
	% end point ZR
	EPZ = ConStruct(Sides(sNumber).EP).Z;
	EPR = ConStruct(Sides(sNumber).EP).R;
	tng = [(EPZ-SPZ) (EPR - SPR)]; % tangential={dz, dr}
	ntng = tng./sqrt(tng*tng'); % normalization
	RM = [cosd(90) sind(90)
				-sind(90) cosd(90)]; % Rotation matrix
	normal = RM*ntng';

end