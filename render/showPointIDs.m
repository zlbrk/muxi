function showPointIDs()
	global POINTS;
	global COLORS;

	for i = 1:numel(POINTS)
		if POINTS(i).id>99
			fsize = 8;
		else
			fsize = 11;
		end
		text(POINTS(i).Z, POINTS(i).R, num2str(POINTS(i).id),...
		 'Color', COLORS.PointIDs,...
		 'FontName', 'Consolas',...
		 'FontWeight', 'bold',...
		 'FontSize', fsize,...
		 'HorizontalAlignment','center');	
	end	
end

