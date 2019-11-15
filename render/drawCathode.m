function drawCathode()
	global Cathode;
	global Colors;
	hold on;
	plot([Cathode.Z], [Cathode.R], '-', 'Color', Colors.Cathode, 'LineWidth', 2);
	plot([Cathode.Z]+Cathode.SD, [Cathode.R], '-.', 'Color', Colors.Cathode, 'LineWidth', 2);
	for i =1:numel([Cathode.Z])
		p.Z = Cathode.Z(i)+Cathode.SD;
		p.R = Cathode.R(i);
		drawPoint(p, 's', Colors.Cathode, 4);
		p.Z = Cathode.Z(i);
		drawPoint(p, 's', Colors.Cathode, 4);
	end
	hold off;
end

