function [iCFI uCFI vCFIPTS CFIPTS] = mkCFI()
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

uCFI = unique(iCFI, 'stable'); % Определяем значения потенциалов (уникальные)
ELECTRODES1 = []
% Находим индексы в iCFI
for i = 1:numel(uCFI)
	ELECTRODES1(i).idxs = find(iCFI==uCFI(i))
end

vCFIPTS = struct('Voltage', num2cell(unique(iCFI, 'stable')), 'numPTS', arrayfun(@(x) {sum(iCFI==x)/2+1}, unique(iCFI, 'stable')));

for i = 1:numel([vCFIPTS.numPTS])
CFIPTS(i).FI = vCFIPTS(i).Voltage/max(vCFIPTS.Voltage);
CFIPTS(i).numPTS = vCFIPTS(i).numPTS;
end