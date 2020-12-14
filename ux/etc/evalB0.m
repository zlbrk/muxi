function B0_Gs = evalB0(r_mm, I_A, U_V)

	r = r_mm/1000; % мм --> м
	for i=1:numel(r)
		B0_Gs(i) = sqrt((6.9e-7)*I_A/r(i)^2/sqrt(U_V))*1E4;
	end
end