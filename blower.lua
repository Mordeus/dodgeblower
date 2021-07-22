Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)		
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			local playerPed = GetPlayerPed(-1)
			local vehicle = GetVehiclePedIsIn(playerPed, false)
			local vehicleModel = GetEntityModel(vehicle)
			--print(vehicleModel)
			if (vehicleModel ~= 1025737310) then
				return
			end
			local door = 3 -- passenger rear			
			local accelVal = GetVehicleCurrentRpm(vehicle)
			local openVal = 0.15
			accelVal = accelVal * (1.0 - openVal) + openVal			
			SetVehicleDoorControl (vehicle, door, 5, accelVal)
		end
	end
end)