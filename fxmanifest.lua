--[[
           ______________________________________
  ________|                 Esx_Me               |_______
  \       |        Developed by JoNyZeRa98       |      /
   \      |         Discord: jonyzera#2168       |     /
   /      |______________________________________|     \
  /__________)                                (_________\
  
                 Discord: jonyzera#2168
           GitHub: https://github.com/JoNyZeRa98

]]--

fx_version 'adamant'
games { 'gta5' }


author 'JoNyZeRa98'

github 'https://github.com/JoNyZeRa98'

discord 'jonyzera#2168'

-- Config
server_script 'config.lua'

-- Client Script
client_script 'jony_cl.lua'

-- Server Script
server_script 'jony_sv.lua'

files {
	"assets/jony.html",
	"assets/jony.js",
	"version.json"
}

ui_page {
	'assets/jony.html',
}
