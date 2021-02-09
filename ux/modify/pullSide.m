% Основной инструмент прямого редактирования контура 
function pullSide(off_mm)
	global SCART; % Нам понадобятся выбранные стороны
	global SIDES; % Нам не только выбранные стороны
	global POINTS; % И координаты точек

	if isempty(SCART)
		fprintf('SCART is empty. Nothing to pull!\n');
		return
	end
	if numel(SCART)>1
		fprintf('Only one side can be pulled or pushed simultaneously!\n');
		return
	end
	if numel(SCART)==1
		tV_g = getTangential(SCART)
		nV_g = getNormal(SCART)
		
		%% Вычисляем направления для сопряжённых сторон (от выбранной)
		sV_g = -getTangential(SIDES(SCART).prev); % Обратили направление, ибо направление на удалённую точку не совпадает с направлением тангенциали сопряжённого сегмента
		eV_g = getTangential(SIDES(SCART).next); % А здесь направление на удалённую точку совпадает с направлением тангенциали сопряжённого сегмента

		B = [tV_g nV_g]; % Из нового в старый (Back)
		A = inv(B); % Из старого в новый!

		%% Переводим все вектора в локальный базис
		tV_l = A*tV_g
		nV_l = A*nV_g
		sV_l = A*sV_g
		eV_l = A*eV_g

		%% Вычисляем вектор pV_l
		pV_l = nV_l*off_mm

		%% Вычисляем угол между sV_l и pV_l (нормаль здесь не подойдёт, потому что всегда имеет положительное направление)
		sDot = dot(pV_l,sV_l) % debug
		sAngle = acosd(sDot/norm(pV_l))
		sdV_l(2,1) = off_mm
		sdV_l(1,1) = sdV_l(2,1)*tand(sAngle)

		eDot = dot(pV_l,eV_l) % debug
		eAngle = acosd(eDot/norm(pV_l))
		edV_l(2,1) = off_mm
		edV_l(1,1) = edV_l(2,1)*tand(eAngle)

		%% Возвращаемся в глобальный базис
		sdV_g = B*sdV_l
		edV_g = B*edV_l

		%% Перемещаем точки
		SP_num = SIDES(SCART).SP
		% movePoint(SP_num, sdV_g, POINTS) % перемещаем начальную точку
		POINTS(SP_num).Z = POINTS(SP_num).Z+sdV_g(1);
		POINTS(SP_num).R = POINTS(SP_num).R+sdV_g(2);
		EP_num = SIDES(SCART).EP
		POINTS(EP_num).Z = POINTS(EP_num).Z+edV_g(1);
		POINTS(EP_num).R = POINTS(EP_num).R+edV_g(2);

	end
		refreshView()
		fprintf('Side #%d pulled by %g mm!\n', SCART, off_mm);
end
