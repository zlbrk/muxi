function toggleMesh()
	global Mesh MeshState;
	global Colors;
	
	if MeshState
		refreshView();
		MeshState = false;
	else
	  rmin = min(Mesh.zonesR);
	  rmax = max(Mesh.zonesR);
	  zmin = min(Mesh.zonesZ);
	  zmax = max(Mesh.zonesZ);

	  spansR = diff(Mesh.zonesR);
	  stepsR = Mesh.stepsR;
	  rr = [];
	  for i = 1:numel(spansR)
	  	dr(i) = spansR(i)/stepsR(i);
	  	rr = [rr Mesh.zonesR(i):dr(i):Mesh.zonesR(i+1)];
	  end
  
	  spansZ = diff(Mesh.zonesZ);
	  stepsZ = Mesh.stepsZ;
	  zz = [];
	  for i = 1:numel(spansZ)
	  	dr(i) = spansZ(i)/stepsZ(i);
	  	zz = [zz Mesh.zonesZ(i):dr(i):Mesh.zonesZ(i+1)];
	  end
  
	  hold on; % Замораживаем текущие оси координат
	  for i = 1:numel(rr)
	  	plot([zmin zmax], [rr(i) rr(i)], 'Color', Colors.Mesh);
	  end
	  
	  for i = 1:numel(zz)
	  	plot([zz(i) zz(i)], [rmin rmax], 'Color', Colors.Mesh);
	  end
	  hold off; % Замораживаем текущие оси координат

	  MeshState = true;
	end
end

