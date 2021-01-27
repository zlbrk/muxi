function refreshSIDES()
% Перестраивает стороны, после изменения топологии контура 
	global POINTS;
	global SIDES;
	global CATS;

	SIDES = [];
	% Переопределяем катод
	s.id = 1; % номер сегмента
	s.SP = 1; % начальная точка сегмента (Start point)
	s.EP = 2; % конечная точка сегмента (End point)
	s.CURV = 1/CATS.Rs; % Кривизна катода из радиуса сферы
	s.next = 2; % номер следующего сегмента
	s.prev = numel(POINTS); % номер предыдущего сегмента

	for i = 2:numel(POINTS)
		% Инициализация сегментов
		s.id = i; % номер сегмента
		s.SP = i; % начальная точка сегмента (Start point)
		s.EP = i+1; % конечная точка сегмента (End point)
		if s.EP > numel(POINTS)
			s.EP = 1; % замыкаем контур
		end
		s.CURV = 0; % все сегменты кроме катода - прямолинейные
		s.prev = s.id - 1;
		if s.prev < 1
			s.prev = numel(POINTS);
		end
		s.next = s.id + 1;
		if s.next > numel(POINTS)
			s.next = 1;
		end
		SIDES = [SIDES s];
	end
fprintf('SIDES refreshed!\n'); % сообщаем об успешном завершении операции
