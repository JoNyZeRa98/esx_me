-- Credits and version of Esx_me by JoNyZeRa98
print("^0======================================================================^7")
print("^0[^4Author^0] ^7:^1 JoNyZeRa Esx_Me v1.0^7")
print("^0[^4Github^0] ^7:^1 https://github.com/JoNyZeRa98^7")
print("^0[^3Server^0] ^7:^0 ^0MyServerName^7") -- Change this to your server name
print("^0======================================================================^7")

local pedDisplaying = {}
local displayTime = 6000

Citizen.CreateThread(function()
    local strin = ""

	while true do
		local currentTime, html = GetGameTimer(), ""
		for k, v in pairs(pedDisplaying) do
            
			local player = GetPlayerFromServerId(k)
			if NetworkIsPlayerActive(player) then
			    local sourcePed, targetPed = GetPlayerPed(player), PlayerPedId()
        	    local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
        	    local pedCoords = GetPedBoneCoords(sourcePed, 0x2e28, 0.0, 0.0, 0.0)
    
                if player == source or #(sourceCoords - targetCoords) < 25 then
			        if v.type == "me" then
                    	local onScreen, xxx, yyy = GetHudScreenPositionFromWorldPosition(pedCoords.x, pedCoords.y, pedCoords.z + 1.1)
                        if not onScreen then
                    	   html = html .. "<p style=\"left: ".. xxx * 100 .."%;top: ".. yyy * 100 .."%;;text-shadow: 1px 0px 5px #000000FF, -1px 0px 0px #000000FF, 0px -1px 0px #000000FF, 0px 1px 5px #000000FF;-webkit-transform: translate(-50%, 0%);max-width: 100%;position: fixed;text-align: center;color: #FFFFFF;background: rgba(18, 18, 18, 0.5);border-radius:3px;font-family:Heebo;font-size: 20px;\"><b style=\"opacity: 1.0;color: rgba(255,255,255, 1.0)\">⠀"..v.msg.."⠀</b></p>"
                        end
        	        end
                end
        	end
        	if v.time <= currentTime then
        		pedDisplaying[k] = nil
        	end
        end

        if strin ~= html then
            SendNUIMessage({
                type = "txt", 
                html = html
            })
            strin = html
        end
        
		Wait(0)
    end
end)

RegisterNetEvent("esx_me:client:triggerJonyEsxMe")
AddEventHandler("esx_me:client:triggerJonyEsxMe", function(playerId, message, typ)
	pedDisplaying[tonumber(playerId)] = {type = typ, msg = message, time = GetGameTimer() + displayTime}
end)