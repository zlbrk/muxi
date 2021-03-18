function iCFI = mkCFI()
global BC;
global SIDES;

iCFI = []
% Формируем матрицу ячеек, связывающую стороны и значения
cellBC = listBC();

% Обходим все стороны
for i = 1:numel(SIDES)

	fprintf('Side #%d\n',i); % отладочная информация
	string('bcValue: ') + string(cellBC(i,3))
	if isa(cell2mat(cellBC(i,3)),'double')
		bcValue =  cell2mat(cellBC(i,3));
		iCFI = [iCFI bcValue bcValue];
	else
		iCFI = [iCFI inf];
	end

end
iidxs = find(iCFI==Inf); % индексы лишних вхождений
iCFI(iidxs) = [] % дропаем лишние элементы

% TODO
% unique(iCFI)
% find(iCFI==100)
% iCFI(ans(end)) = []
% iCFI(ans(1)) = []


end

function [sId, bcType, bcValue, sLb] = checkSide(s)
global LABELS;
global BC;
	sId = s.id;
	for i = 1:numel(LABELS)
		if ismember(sId, LABELS(i).sides)
			sLb = LABELS(i).id;
			break
		else
			sLb = 'nil';
		end
	end

	for i=1:numel(BC)
		if ismember(sId, BC(i).sides)
			bcType = BC(i).bcType;
			bcValue = BC(i).bcValue;
			break
		else
			bcType = 'nil';
			bcValue = 'nil';
		end
	end

	sSpec = {sId, bcType, bcValue, sLb}; % side specificacion

end