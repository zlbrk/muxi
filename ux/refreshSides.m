function refreshSides()
% Перестраивает стороны, после изменения топологии контура 
	global ConStruct;
	global Sides;

	Sides = [];
	for i = 1:numel(ConStruct)
		% Инициализация сегментов
		s.id = i; % номер сегмента
		s.SP = i; % начальная точка сегмента (Start point)
		s.EP = i+1; % конечная точка сегмента (End point)
		if s.EP > numel(ConStruct)
			s.EP = 1; % замыкаем контур
		end
		s.prev = s.id - 1;
		if s.prev < 1
			s.prev = numel(ConStruct);
		end
		s.next = s.id + 1;
		if s.next > numel(ConStruct)
			s.next = 1;
		end
		Sides = [Sides s];
	end
fprintf('Sides refreshed!\n'); % сообщаем об успешном завершении операции
