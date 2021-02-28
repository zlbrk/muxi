% close all;
% clear all;
% clc;

load('NK2.mat') % Загрузили сплайн
load('W40_v35p0_Uf-140_1.mat') % Загрузили траектории

% figure(1)
% grid on
% set(gca(),'FontSize', 16);
% xlabel('Z, mm')
% ylabel('R, mm')

%% Визуализация пучка
hold on % на всякий случай
for i = 1:numel(CylTracks)
	visR=[CylTracks(i).Steps.R]*10; % cm --> mm
	visZ=[CylTracks(i).Steps.Z]*10; % cm --> mm
	plot(visZ, visR,'-m'); % визуализируем траекторию
end
hold off

%% Визуализация поля

vzpts = 2048;
vzmin=CylTracks(1).Steps(1).Z*10;
vzmax=CylTracks(1).Steps(end).Z*10;
vz=vzmin:(vzmax-vzmin)/(vzpts-1):vzmax;

visBz=fnval(csBz, vz);
hold on
plot(vz, abs(visBz)./max(visBz),'LineWidth',1.5,'Color',[0.00, 0.99, 0.5]);
% plot([13.95 13.95], [0 1], 'LineWidth',1.5,'Color',[0.75, 0.25, 0.00]) % Положение кроссовера
plot([12.75 12.75], [0 1], 'LineWidth',1.5,'Color',[0.75, 0.25, 0.00]) % Положение кроссовера
% xlim([vzmin vzmax]);
hold off

