function setVoltage(V)
    global ConStruct;
    global PCart;
    
    for i = PCart;
        ConStruct(i).Voltage = V;
    end

    U0 = max([ConStruct.Voltage]); % Берём максимальное значение напряжения из доступных
    setPhi(U0);
    clearPCart();
   end

function setPhi(U0)
    global ConStruct;

    for i = 1:numel(ConStruct)
        ConStruct(i).Phi = ConStruct(i).Voltage/U0;
    end
end