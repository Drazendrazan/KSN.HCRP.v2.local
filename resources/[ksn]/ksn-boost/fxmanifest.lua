fx_version "cerulean"
game "gta5"

name "ksn-boost"
version "0.1"
description "Bringing NOS to your FiveM city with refuel via inventory item, static refuel and a NOS truck"
author "Ksnarf https://github.com/ksnarf"
url "https://github.com/ksnarf/ksn-boost"

-- ui_page 'html/index.html'


client_scripts {
    'client/main.lua',
    'client/nos.lua'
}

server_script 'server/main.lua'

files {
    'html/*',
}

lua54 'yes'
 
