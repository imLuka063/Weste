fx_version 'cerulean'
game 'gta5'


client_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'client/cl_script.lua'
}

server_script {
    '@es_extended/locale.lua',
    'config.lua',
    'server/sv_script.lua'
}

dependencies {
	'es_extended',
	'an_progBar'   --  https://github.com/aymannajim/an_progBar
}