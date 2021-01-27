function initDummy()
global POINTS
global SIDES
global CATS

Zcat = CATS.Zc; % Определяет положение катода (вообще говоря, надо проверять)
Rmax = CATS.Rc; % Радиус катода (определяет поперечный размер эмиттера)
Rs = CATS.Rs; % Радиус сферы катода
Zmax = 2*CATS.Rc; % Нам всё равно какая длина будет у болванки

alpha2 = asind(Rmax/Rs);
dzN = Rs*cosd(alpha2); % расстояние от z2 (положение катода) до центра сферы
Zc1 = Zcat + dzN - Rs;

% Определяем координаты точек региона
ZR(:, 1) = [Zc1, Zcat, Zmax, Zmax];
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

SIDES([1]).CURV=1/Rs
SIDES([3]).CURV=0
SIDES([2]).CURV=0
SIDES([4]).CURV=0
