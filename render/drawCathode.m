function drawCathode()
	global Cathode;
	global Colors;
	hold on;
	plot([Cathode.Z], [Cathode.R], '-', 'Color', Colors.Cathode, 'LineWidth', 2.5);
	visPts=5;
	visR=Cathode.R(1):(Cathode.R(end)-Cathode.R(1))/(visPts-1):Cathode.R(end);
	if Cathode.Z(1)==Cathode.Z(end)
		visZ=ones(visPts,1)*Cathode.Z(1);
	else
		visZ=Cathode.Z(1):(Cathode.Z(end)-Cathode.Z(1))/(visPts-1):Cathode.Z(end);
	end

	for i =1:numel(visR)
		p.Z = visZ(i);
		p.R = visR(i);
		drawPoint(p, '>', Colors.Cathode, 7);
	end
	hold off;
end

