global COLORS;
  COLORS.Void = [220, 220, 220]/255;
  COLORS.PointIDs = [220, 220, 220]/255;
  COLORS.POINTS = [25, 100, 150]/255;
  COLORS.SIDES = [0.00, 0.45, 0.74];
  COLORS.Picked = [180, 0, 135]/255;
  COLORS.Cathode = [242, 20, 140]/255;
  COLORS.Mesh = [140 140 130]/255;

global PCART;
  PCART = []; % Корзинка для точек
  
global SCART;
  SCART = []; % Корзинка для сегментов (сторон)

global POINTS;
  POINTS = []; % Теперь ConStruct будет называться POINTS

global SIDES;
  SIDES = []; % Явная инициализация Сторон
  

%% Определяем глобальную переменную графического контекста
% ---------------------------------------
global GA; % Глобальные оси координат

