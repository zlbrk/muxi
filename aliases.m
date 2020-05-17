% Это типа набор псевдонимов функций, реализации которых раскиданы по директориям

refreshView = @() refreshView();
bc = @() showBC();
pp = @(Ids) pickPoints(Ids);
dp = @(Ids) dropPoints(Ids);
cc = @() clearCart();
mv = @(dz, dr) movePoints(dz, dr);
tm = @() toggleMesh();
sv = @(V) setVoltage(V);

% initFigure = @(ZMIN, ZMAX, RMIN, RMAX) initFigure(ZMIN, ZMAX, RMIN, RMAX);
% drawVoid = @() drawVoid();
% drawPoints = @() drawPoints();
% drawCathode = @() drawCathode();
% showPointIDs = @() showPointIDs();

% save('aliases.mat'); % на всякий случай?