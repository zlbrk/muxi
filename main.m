%% Èíèöèàëèçàöèÿ
clear;
close all;
clc;
%Îïðåäåëåíèå ïñåâäîíèìîâ API
aliases;

% Èíèöèàëèçàöèÿ ôàéëîâîé ñèñòåìû ïðîåêòà
initFS;

% Îïðåäåëÿåì ãëîáàëüíûå ïåðåìåííûå
initGlobals;

% Èíèöèàëèçèðóåì êàíâó
initFigure();

% Îïðåäåëÿåì ïàðàìåòðû êàòîäà
CATS.Zc = 2;
CATS.Rc = 4.3;
CATS.Rs = 9;
CATS.Zs = 10;
CATS.nTR = 30;
CATS.SD = 0.075;

% Îïðåäåëÿåì ïàðàìåòðû çîí
ZONES.Z = [0.9, 2, 4, 8];
ZONES.R = [0, 2, 4.3];
ZONES.ZN = [55, 50, 45];
ZONES.RN = [210, 220];


% Èíèöèàëèçèðóåì Ïðîáíûé ðåãèîí
initDummy();


%% Èíèöèàëèçàöèÿ æóðíàëèðîâàíèÿ
delete 'temp/*' % î÷èñòêà âðåìåííûõ ôàéëîâ

global ModelStateCounter;
  ModelStateCounter = 0; % èíèöèàëèçàöèÿ ñ÷¸ò÷èêà ñîñòîÿíèé ìîäåëè

setCheckpoint(); % ñîçäà¸ì íà÷àëüíûé ÷åêïîéíò
refreshView(); % îáíîâëÿåì âèä

% Ïîäãîíÿåì ìàñøòàá
fitView();