% Это типа набор псевдонимов функций, реализации которых раскиданы по директориям

refreshView = @() refreshView();
pp = @(Ids) pickPoints(Ids);
dp = @(Ids) dropPoints(Ids);
delp = @() deletePoints(); % команда специально длиннее, чтобы нельзя было по ошибке её ввести
an = @(num) addPointsNext(num);
cc = @() clearCart();
mv = @(dz, dr) movePoints(dz, dr);
tm = @() toggleMesh();
sv = @(V) setVoltage(V);
cf = @() createFile();


initFigure = @(ZMIN, ZMAX, RMIN, RMAX) initFigure(ZMIN, ZMAX, RMIN, RMAX);
drawVoid = @() drawVoid();
drawPoints = @() drawPoints();
drawCathode = @() drawCathode();
showPointIDs = @() showPointIDs();

% save('aliases.mat'); % на всякий случай?
% Проверка
% BRK = @() setBreakPoint();
