% Это типа набор псевдонимов функций, реализации которых раскиданы по директориям

refView = @() refreshView();
reCheck = @(State) restoreCheckpoint(State);
undo = @() undoLastCommand();
redo = @() redoLastCommand();

pp = @(Ids) pickPoints(Ids);
dp = @(Ids) dropPoints(Ids);
delp = @() deletePoints(); % команда специально длиннее, чтобы нельзя было по ошибке её ввести
an = @(num) addPointsNext(num);
ff = @(off_mm) forkForward(off_mm);
fb = @(off_mm) forkBackward(off_mm);
sm = @(filename) saveModel(filename);
lm = @(filename) loadModel(filename);
cpc = @() clearPCart();

spp = @(Znew, Rnew) setPointPosition(Znew, Rnew);
mvr = @(dr) movePointsR(dr);
mvz = @(dz) movePointsZ(dz);

apz = @(AlignPointId) alignPointsZ(AlignPointId);
apr = @(AlignPointId) alignPointsR(AlignPointId);
spz = @(Znew) setPointsZ(Znew);
spr = @(Rnew) setPointsR(Rnew);

%% Функции CAE
tm = @() toggleMesh();
sv = @(V) setVoltage(V);
cf = @() createFile();

%% Низкоуровневые функции 
initFigure = @(ZMIN, ZMAX, RMIN, RMAX) initFigure(ZMIN, ZMAX, RMIN, RMAX);
drawVoid = @() drawVoid();
drawPoints = @() drawPoints();
drawCathode = @() drawCathode();
showPointIDs = @() showPointIDs();

