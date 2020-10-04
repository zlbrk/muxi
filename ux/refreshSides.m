function refreshSIDES()
% Перестраивает стороны, после изменения топологии контура 
	global POINTS;
	global SIDES;

	SIDES = [];
	for i = 1:numel(POINTS)
		% Инициализация сегментов
		s.id = i; % номер сегмента
		s.SP = i; % начальная точка сегмента (Start point)
		s.EP = i+1; % конечная точка сегмента (End point)
		if s.EP > numel(POINTS)
			s.EP = 1; % замыкаем контур
		end
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
