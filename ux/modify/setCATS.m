% переопределить параметры катода
function setCATS(Zc, Rc, Rs, SD)
	global CATS
	global POINTS
	global SIDES

	CATS.Zc = Zc;
	CATS.Rc = Rc;
	CATS.Rs = Rs;
	CATS.SD = SD;

% Обновляем кривизну первого сегмента контура
SIDES(1).CURV = 1/CATS.Rs;

% Обновляем положение первой точки 
% Зависит от радиуса катода и радиуса сферы
dzN = sqrt((Rs^2) - (Rc^2)); % сдвиг центра сферы от положения катода
POINTS(1).Z = Zc + dzN - Rs; % координата первой точки дуги

% Обновляем положение второй точки 
% зависит от положения катода и его радиуса

POINTS(2).Z = Zc;
POINTS(2).R = Rc;

refreshView(); % Обновляем вид