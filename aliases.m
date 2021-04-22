% Это псевдонимы функций, необходимых в интерактивной работе

refView = @() refreshView();
fitView = @() fitView();
reCheck = @(State) restoreCheckpoint(State);
undo = @() undoLastCommand();
redo = @() redoLastCommand();

pp = @(Ids) pickPoints(Ids);
ps = @(Ids) pickSides(Ids);
dp = @(Ids) dropPoints(Ids);
ds = @(Ids) dropSides(Ids);
delp = @() deletePoints(); % команда специально длиннее, чтобы нельзя было по ошибке её ввести
an = @(num) addPointsNext(num);
ff = @(off_mm) forkForward(off_mm);
fb = @(off_mm) forkBackward(off_mm);
sm = @(filename) saveModel(filename);
lm = @(filename) loadModel(filename);
% pull = @(off_mm) pullSide(off_mm); % pull side outward contuor negative off pulls side inward.

cpp = @() clearPCart(); % Clear all picked points
cps = @() clearSCart(); % Clear all picked sides and points
cc = @() clearCarts(); % Clear all picked sides

spp = @(Znew, Rnew) setPointZR(Znew, Rnew);
mvr = @(dr) movePointsZR(0,dr);
mvz = @(dz) movePointsZR(dz,0);

apz = @(AlignPointId) alignPointsZ(AlignPointId);
apr = @(AlignPointId) alignPointsR(AlignPointId);
spz = @(Znew) setPointsZ(Znew);
spr = @(Rnew) setPointsR(Rnew);

sc = @(Zc, Rc, Rs, nTR, SD) setCATS(Zc, Rc, Rs, nTR, SD);
slb = @(lname) setLabel(lname);
plb = @(lname) pickLabel(lname);
llb = @() listLabels();
%% Функции CAE
% tm = @() toggleMesh();
sBC = @(bcType, bcValue) setBC(bcType, bcValue); % установить ГУ
lBC = @() listBC(); % вывести ГУ в виде таблицы 
cf = @() createFile(); % Создать файл INR.TX для EOS

%% Низкоуровневые функции 
% initFigure = @() initFigure();
% drawVoid = @() drawVoid();
% drawPoints = @() drawPoints();
% drawCathode = @() drawCathode();
% showPointIDs = @() showPointIDs();
%test fork

