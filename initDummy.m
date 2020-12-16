function initDummy(Zmax, Rmax)
global POINTS
global SIDES

% Определяем координаты точек региона
ZR(:, 1) = [0.0, 0.0, Zmax, Zmax];
ZR(:, 2) = [0.0, Rmax, Rmax, 0.0];
ZRpts = numel(ZR(:, 1)); % Количество точек в контуре (оно же количество сегментов)

% Инициализируем Регион
for i = 1:ZRpts
	% Инициализация точек
	p.id = i; % номер точки
	
	p.prev = p.id - 1;
	if p.prev < 1
		p.prev = ZRpts;
	end
	
	p.next = p.id + 1;
	if p.next > ZRpts
		p.next = 1;
	end
	
	p.Z = ZR(i, 1);
	p.R = ZR(i, 2);
	
	POINTS = [POINTS p];
	
	% Инициализация сегментов
	s.id = i; % номер сегмента
	s.SP = i; % начальная точка сегмента (Start point)
	s.EP = i+1; % конечная точка сегмента (End point)
	s.CURV = 0; % изначально все сегменты - отрезки прямых (кривизна равна нулю)
	if s.EP > ZRpts
		s.EP = 1; % замыкаем контур
	end
	s.prev = s.id - 1;
	if s.prev < 1
		s.prev = ZRpts;
	end
	s.next = s.id + 1;
	if s.next > ZRpts
		s.next = 1;
	end
	SIDES = [SIDES s];
	
end

SIDES([1]).CURV=1/9
SIDES([3]).CURV=1/9
SIDES([2]).CURV=-1/15
SIDES([4]).CURV=-1/15
