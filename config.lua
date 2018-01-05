return {
	bot_api_key = "363459057:AAHM-twmowDE-1Xdsa55K5SINsEityLmkZ", --API TOKEN!
	cmd = '^[/!#]',
	db = 2, --default redis db: 0
	superadmins = {147902292, 292286925, 440468473}, -- ID DOS SUPER ADMINS
	log = {
		chat = -1001057801239, --Your log chat, where your bot must be added!
		admin = 147902292, --O ID DO admin.
		stats = nil
	},
	human_readable_version = '4.2.0',
	bot_settings = {
		cache_time = {
			adminlist = 18000, --5 hours (18000s) Admin Cache time, in seconds.
		},
		multipurpose_mode = false, --If this is enabled, the bot will activate the plugins from plugins/multipurpose
		notify_bug = true, --Notify if a bug occurs!
		log_api_errors = true, --Log errors, which happening whilst interacting with the bot api.
		stream_commands = true,
		admin_mode = false,
		debug_connections = false,
		realm_max_members = 60,
		realm_max_subgroups = 6
	},
	channel = '@DisorderSEC', --channel username with the '@'
	source_code = 'https://github.com/DisorderSec/SetBan_bot',
	help_groups = {
		['Internatonal (English)'] = 'https://telegram.me/joinchat/EKBQLj7Zf6lE2K_Pk0Epcg', --group link, not (at)username! If you have your own support group, modify here!
		['Italian'] = 'https://telegram.me/joinchat/ITAgroupbutler',
		['Persian'] = 'https://telegram.me/joinchat/CTDUTkCOsEt4DZT-SUQdBQ',
		['Russian'] = 'https://telegram.me/rubutler',
		['Spanish'] = 'https://telegram.me/ESgroupbutler'
	},--
	plugins = {
		'onmessage.lua', --THIS MUST BE THE FIRST: IF AN USER IS SPAMMING/IS BLOCKED, THE BOT WON'T GO THROUGH PLUGINS
		'antispam.lua', --SAME OF onmessage.lua
		'realms.lua',
		'configure.lua',
		'menu.lua',
		'dashboard.lua',
		'banhammer.lua',
		'users.lua',
		'help.lua',
		'rules.lua',
		'service.lua',
		'links.lua',
		'warn.lua',
		'setlang.lua',
		'floodmanager.lua',
		'welcome.lua',
		'pin.lua',
		'mediasettings.lua',
		'private.lua',
		'admin.lua',
		--'test.lua',
		--'logchannel.lua',
		'report.lua',
		'private_settings.lua',
		'extra.lua', --must be the last plugin in the list.
	},
	multipurpose_plugins = {},
	available_languages = {
		['en'] = 'English 🇬🇧',
		['it'] = 'Italiano 🇮🇹',
		['es'] = 'Español 🇪🇸',
		['pt_BR'] = 'Português 🇧🇷',
		['ru'] = 'Русский 🇷🇺',
		['de'] = 'Deutsch 🇩🇪',
		['sv'] = 'Svensk 🇸🇪',
		['ar'] = 'العربية 🇸🇩',
		['fr'] = 'Français 🇫🇷',
		['zh'] = '中文 🇨🇳',
		['fa'] = 'فارسی 🇮🇷',
		['id'] = 'Bahasa Indonesia 🇮🇩'
		-- more languages will come
	},
	allow_fuzzy_translations = false,
	chat_settings = { --default chat_settings for groups.
		['settings'] = {
			['Welcome'] = 'off',
			['Goodbye'] = 'off',
			['Extra'] = 'on',
			['Flood'] = 'off',
			['Silent'] = 'off',
			['Rules'] = 'off',
			['Reports'] = 'off',
			['Welbut'] = 'off'
		},
		['antispam'] = {
			['links'] = 'alwd',
			['forwards'] = 'alwd',
			['warns'] = 2,
			['action'] = 'ban'
		},
		['flood'] = {
			['MaxFlood'] = 5,
			['ActionFlood'] = 'kick'
		},
		['char'] = {
			['Arab'] = 'allowed', --'kick'/'ban'
			['Rtl'] = 'allowed'
		},
		['floodexceptions'] = {
			['text'] = 'no',
			['photo'] = 'no', -- image
			['forward'] = 'no',
			['video'] = 'no',
			['sticker'] = 'no',
			['gif'] = 'no',
		},
		['warnsettings'] = {
			['type'] = 'ban',
			['mediatype'] = 'ban',
			['max'] = 3,
			['mediamax'] = 2
		},
		['welcome'] = {
			['type'] = 'no',
			['content'] = 'no'
		},
		['goodbye'] = {
			['type'] = 'custom',
		},
		['media'] = {
			['photo'] = 'ok', --'notok' | image
			['audio'] = 'ok',
			['video'] = 'ok',
			['sticker'] = 'ok',
			['gif'] = 'ok',
			['voice'] = 'ok',
			['contact'] = 'ok',
			['document'] = 'ok', -- file
			['link'] = 'ok',
			['game'] = 'ok',
			['location'] = 'ok'
		},
		['tolog'] = {
			['ban'] = 'yes',
			['kick'] = 'yes',
			['warn'] = 'yes',
			['join'] = 'yes',
			['mediawarn'] = 'yes',
			['flood'] = 'yes',
		},
	},
	private_settings = {
		rules_on_join = 'on',
		reports = 'off'
	},
	chat_custom_texts = {'extra', 'info', 'links', 'warns', 'mediawarn', 'spamwarns'},
	bot_keys = {
		d3 = {'bot:general', 'bot:usernames', 'bot:chat:latsmsg'},
		d2 = {'bot:groupsid', 'bot:groupsid:removed', 'tempbanned', 'bot:blocked', 'remolden_chats'} --remolden_chats: chat removed with $remold command
	},
	api_errors = {
		[101] = 'Não há direitos suficientes para kickar/ban o membro', --SUPERGROUP: bot is not admin
		[102] = 'USER_ADMIN_INVALID', --SUPERGROUP: trying to kick an admin
		[103] = 'O método está disponível somente para bate-papos do supergrupo', --NORMAL: trying to unban
		[104] = 'Somente o criador do grupo pode expulsar os administradores do grupo ', --NORMAL: trying to kick an admin
		[105] = 'Deu ruim: precisa ser invitador do usuário para chutá-lo do grupo', --NORMAL: bot is not an admin or everyone is an admin
		[106] = 'USUÁRIO_NÃO_PARTICIPANTE', --NORMAL: trying to kick an user that is not in the group
		[107] = 'CHAT_ADMIN_REQUERIDO', --NORMAL: bot is not an admin or everyone is an admin
		[108] = 'não há administradores no chat privado', --something asked in a private chat with the api methods 2.1
		[109] = 'Host de URL errado', --hyperlink not valid
		[110] = 'PEER_ID_INVALID', --user never started the bot
		[111] = 'a mensagem não é modificavél', --the edit message method hasn't modified the message
		[112] = 'Não é possível analisar o texto da mensagem: Não é possível encontrar o fim da entidade começando no deslocamento do byte %d+', --the markdown is wrong and breaks the delivery
		[113] = 'O grupo agora é um supergrupo', --group updated to supergroup
		[114] = 'A mensagem não pode ser encaminhada', --unknown
		[115] = 'O texto da mensagem está vazio', --empty message
		[116] = 'mensagem não encontrada', --message id invalid, I guess
		[117] = 'chat não encontrado', --I don't know
		[118] = 'A mensagem é grande pra porr*', --over 4096 char
		[119] = 'Nunca nem vi', --unknown user_id
		[120] = 'Não é possível analisar o objeto JSON de marcação de teclado de resposta', --keyboard table invalid
		[121] = 'O campo \\\"inline_keyboard\\\" do InlineKeyboardMarkup deve ser uma matriz de matrizes', --inline keyboard is not an array of array
		[122] = 'Não pode analisar o botão do teclado incorporado: InlineKeyboardButton deve ser um objeto',
		[123] = 'Deu ruim: objeto esperado como marcação de resposta', --empty inline keyboard table
		[124] = 'QUERY_ID_INVALID', --callback query id invalid
		[125] = 'CHANNEL_PRIVATE', --I don't know
		[126] = 'MESSAGE_TOO_LONG', --text of an inline callback answer is too long
		[127] = 'ID de usuário incorreto', --invalid user_id
		[128] = 'Tempo limite muito grande [%d%.]+', --something about spam an inline keyboards
		[129] = 'BUTTON_DATA_INVALID', --callback_data string invalid
		[130] = 'Tipo de arquivo para enviar falta de correspondência', --trying to send a media with the wrong method
		[131] = 'MESSAGE_ID_INVALID', --I don't know
		[132] = 'Não é possível analisar o botão do teclado em linha:: Não encontrei o campo "text"', --the text of a button could be nil
		[133] = 'Não podemos analisar o botão do teclado interno: Campo "text" deve ser string',
		[134] = 'USER_ID_INVALID',
		[135] = 'CHAT_INVALID',
		[136] = 'USER_DEACTIVATED', --deleted account, probably
		[137] = 'Não podemos analisar o botão do teclado incorporado: os botões de texto não são permitidos no teclado em linha',
		[138] = 'A mensagem não foi encaminhada',
		[139] = 'Não pude analisar o botão do teclado incorporado: o campo \\\"text\\\" deve ser do tipo String', --"text" field in a button object is not a string
		[140] = 'Canal Inválido', --/shrug
		[141] = 'Protocolo da URL não suportado', --username in an inline link [word](@username) (only?)
		[142] = 'O URL está vazio', --inline link without link [word]()
		[403] = 'Bot foi bloqueado pelo usuário', --user blocked the bot
		[429] = 'Muitos pedidos: tente novamente', --the bot is hitting api limits
		[430] = 'Tempo limite muito grande', --too many callback_data requests
	}
}
