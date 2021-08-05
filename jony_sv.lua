RegisterCommand('me', function(source, args, rawCommand)
	if source == 0 or source == "Console" then return end

	args = table.concat(args, ' ')
	TriggerClientEvent('esx_me:client:triggerJonyEsxMe', -1, source, args, "me")
end, false)



-- Esx_me by JoNyZeRa98 check version of the script
Citizen.CreateThread( function()
		SetConvarServerInfo("Esx_me", "V"..Config.checkversion)
		local vRaw = LoadResourceFile(GetCurrentResourceName(), 'version.json')
		if vRaw and Config.checkversion then
			local v = json.decode(vRaw)
			PerformHttpRequest(
				'https://raw.githubusercontent.com/JoNyZeRa98/esx_me/main/version.json',
				function(code, res, headers)
					if code == 200 then
						local rv = json.decode(res)
						if rv.version ~= v.version then
							print(
								([[^1
-------------------------------------------------------
JoNyZeRa98 Esx_Me
UPDATE: %s AVAILABLE
CHANGELOG: %s
GITHUB: https://github.com/JoNyZeRa98
SHOP: https://jonyzeradevelopment.tebex.io/
-------------------------------------------------------
^0]]):format(
									rv.version,
									rv.changelog
								)
							)
						end
					else
						print('Esx_me could not check your script version')
					end
				end,
				'GET'
			)
		end
	end
)