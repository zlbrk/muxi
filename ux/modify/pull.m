% Основной инструмент прямого редактирования контура 
function pull(off_mm)
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
		tV = getTangentialVector(SCART)
		pV = getNormal(SCART)*off_mm

		

		fprintf('Side #%d pulled by %g mm!\n', SCART, off_mm);
	end
end


function alpha = getAngle(SCART, off_mm)
	
end






	
