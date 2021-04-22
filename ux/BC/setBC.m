function setBC(bcType, bcValue)
global SCART;
global SIDES;
global BC;

% сначала проверим, что тип ГУ это единица или двойка.
% bcType
% bcValue
if ~ismember(bcType, [1 2])
	fprintf('BC type can only take values 1 or 2!\n');
	return
end

% потом проверим, что значение имеет тип double
if ~isa(bcValue,'double')
	fprintf('BC type and BC value must be of type double both!\n');
	return
end

for i = 1:numel(SIDES)
	
	[sSpec{i,1}, sSpec{i,2}, sSpec{i,3}, sSpec{i,4}] = checkSide(SIDES(i)); % make side specification to list
	if ((sSpec{i,2} == 'nil') | (sSpec{i,3} == 'nil')) & ismember(i, SCART)
		bc.sides = SIDES(i).id;
		bc.bcType = bcType;
		bc.bcValue = bcValue;
		i
		BC = [BC bc]
	else
		for j = 1:numel(BC)
			if ismember(i, BC(j).sides) & ismember(i, SCART)
				fprintf('**BC is already Assigned to the side %d!\nbcType and bcValue will be rewritten**\n', i);
				BC(j).bcType = bcType;
				BC(j).bcValue = bcValue;
			end
		end
	end
end

fprintf('%s\n', 'Hello from setBC YNDX!');
clearCarts();
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