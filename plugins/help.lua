local plugin = {}

local function get_helped_string(key)
	if key == 'start' then
		return _([[
Olá %s 👋🏼, prazer em conhece-lo!
Eu sou o SetBan, bot de administração usando o API oficial Group Butler.

*Eu posso fazer um monte de coisas legais*, aqui está uma lista:
• Eu posso *kickar ou banir* usuários
• Você pode me usar para definir as regras do grupo
• Eu tenho um sistema *anti-flood* flexível
• Eu posso *receber novos usuários* com uma mensagem personalizável, ou se você quiser com um gif ou um sticker
• Eu posso *avisar usuários*, e bani-los quando eles atingem o número máximo de avisos
• Eu também posso avisar, kickar ou banir usuários quando eles postam uma mídia específica
…e mais, abaixo você pode encontrar o botão "Todos comandos" para obter toda a lista!!

Eu trabalho melhor se você me adicionar aos administradores do grupo (caso contrário, não vou poder kickar ou banir)!
]])
	elseif key == 'realm' then
		return _([[*Comandos do rei*
_Reino = grupo de administração, de onde você pode gerenciar mais subgrupos sem enviar comandos_

`/setrealm` (*apenas para o proprietário do grupo*): use o grupo como um reino. Não pode ter mais de 60 membros e deve ser um supergrupo *privado*..
Siga as instruções que o bot lhe dará para associar um grupo (subgrupo) a um reino.
`/subgroups`: obtenha a lista dos subgrupos administrados pelo reino. Não pode ter mais de 6 por enquanto..
`/remove`: escolha um subgrupo para remover dos subgrupos do reino.
`/send [message]`: transmitir uma mensagem para um ou mais subgrupos.
`/setrules [rules]`: aplique as regras a um (ou mais) de seus grupos.
`/pin [message]`: edite a última mensagem gerada com `/pin` em um ou mais grupos.
`/adminlist`: Obtenha a lista de administradores de um dos seus subgrupos.
`/realm`: Obtenha algumas informações sobre o seu reino.
`/add`: pegue a mensagem para copiar-colar em um grupo para adicioná-lo aos subgrupos do reino.
`/ban [por nome de usuário | por ID | por mensagem encaminhada]`: banir o usuário de todos os seus subgrupos.
*Por mensagem enviada*: encaminhe uma mensagem do usuário e responda com `/ban`.
`/config`: gerencie as configurações de um de seus subgrupos.
`/delrealm` (*apenas para admins*): o grupo não será mais usado como um reino.

*Comandos para usar em um subgrupo*
`/unpair` (*apenas para admins*): remova a associação entre o grupo e seu reino.

*Importante*: Os reinos devem ser grupos onde seus membros administram um ou mais grupos associados. Então, em um reino, você não poderá usar comandos regulares, como `/warn`, `/welcome` e assim por diante.
Os únicos comandos que funcionarão são aqueles que são descritos acima.
Além disso, cada membro do reino pode tomar ações em grupos onde ele não é administrador. Então, tome cuidado com quem convidar em um reino :)]])
	elseif key == 'basics' then
		return _([[
Este bot funciona apenas em supergrupos.

Para funcionar corretamente, [precisa ser administrador em seu grupo](https://telegram.me/GroupButler_ch/104), então pode chutar ou banir pessoas se necessário.
Somente o proprietário do grupo pode promovê-lo :)

Você pode usar `/, ! ou #` para acionar um comando.

Lembre-se: você precisa usar comandos *no grupo*, a menos que eles sejam especificamente projetados para bate-papos privados (veja a guia "privado").]])
	elseif key == 'main_menu' then
		return _("Neste menu você encontrará todos os comandos disponíveis")
	elseif key == 'private' then
		return _([[
*Comandos que funcionam em privado*:

• `/mysettings`: mostre um teclado que permite que você altere suas configurações pessoais, como escolher se receber as regras em particular quando você se juntar a um grupo ou se recebere reports feito com o comando `@admin`
• `/echo [text]` : o bot enviará o texto de volta, formatado com markdown
• `/about` : Mostre algumas informações úteis sobre o bot
• `/groups` : mostrar a lista dos grupos de discussão
• `/id`: pegue a sua ID
• `/start` : mostrar a mensagem inicial
• `/help` : mostre esta mensagem
]])
	elseif key == 'users_group' then
		return _([[
*Comandos disponíveis para cada usuário em um grupo*:

• `/dashboard` : Veja todas as informações sobre o grupo
• `/rules` : mostre as regras do grupo
• `/adminlist` : mostre os moderadores do grupo
• `/help` : receba a mensagem de ajuda.
*Nota*: `/dashboard` e `/adminlist` responde sempre em privado. Se o bot não conseguir alcançar um usuário, ele pedirá no grupo a esse usuário que seja iniciado, mas apenas se o _silent mode_ estiver desligado.
Com `/rules`, o bot sempre responde no grupo para administradores, mas com usuários normais a mensagem é enviada no grupo ou em particular de acordo com as configurações do grupo.

• `@admin` (por resposta): relatar uma mensagem aos administradores do grupo (o bot irá encaminhá-lo em prvate). Esta habilidade poderia ser desligada nas configurações do grupo. Pode ser adicionada uma descrição do relatório.
Os administradores precisam dar o seu consenso para receber relatórios dos usuários, com o comando `/mysettings`
• `/kickme` : Melhor comando
]])
	elseif key == 'info' then-----------------------------------------
		return _([[
*Admins: informações sobre o grupo*

• `/setrules [regras do grupo]`: definir o novo regulamento para o grupo (o antigo será substituído).
• `/setrules -`: apague as regras atuais.

*Nota*: Markdown é suportado. Se o texto enviado quebrar o markdown, o bot notificará que algo está errado.
Para um uso correto do markdown, verifique [esta postagem](https://telegram.me/GroupButler_ch/46) no canal

• `/setlink [link|-]`: defina o link de grupo, para que possa ser re-chamado por outros administradores ou desmarque-o.
Se você vai usá-lo em um supergrupo público, não precisa anexar o link do grupo. Basta enviar `/setlink`
• `/link`: obter o link de grupo, se já configurado.
• `/msglink`: obtenha o link para uma mensagem. Funciona apenas em supergrupos públicos

*Nota*: o bot pode reconhecer links de grupo válidos. Se um link não for válido, você não receberá uma resposta
]])
	elseif key == 'banhammer' then-----------------------------------------
		return _([[
*Poderes Banhammer*
Um conjunto de comandos que permitem aos administradores kickar e banir pessoas de um grupo e obter algumas informações sobre um usuário.
Pessoas kickadas podem se voltar, as pessoas banidas não podem. Os usuários proibidos são adicionados à lista negra do grupo.

• `/kick`: kickar um usuário do grupo.
• `/ban`: banir um usuário do grupo.
• `/tempban [horas|nd nh]` = banir um usuário por uma quantidade específica de horas (máximo: uma semana). Por enquanto, apenas por resposta. Forma curta: `/tempban 1d 7h`
• `/unban`: desban um usuário do grupo.
• `/user`: mostra quantas vezes o usuário foi banido *em todos os grupos*, e os avisos recebidos.
• `/status [@usuário|id]`: mostrar o status atual do usuário `(membro|kickado/fora do chat|banido|admin/creator|nunca nem vi)`.
Um bot não pode recuperar o status de um usuário se esse usuário nunca o tenha iniciado antes (neste caso, o status nunca visto é retornado)

*Antiflood*
O "antiflood" é um sistema que remove automaticamente pessoas que enviam muitas mensagens consecutivas em um grupo.
Se ativado, o sistema antiflood vai chutar/proibir flooders.

• `/config` comando, depois botão `antiflood`: gerencie as configurações de flood em particular, com um teclado em linha. Você pode alterar a sensibilidade, a ação (kick/ban) para executar e até mesmo definir algumas exceções.
]])
	elseif key == 'report' then--------------------------------------
		return _([[
*Configurações de Relatórios*
`@admin` é um comando útil para permitir que os usuários relatem algumas mensagens aos administradores do grupo.
Uma mensagem relatada será encaminhada para os administradores disponíveis.

• `/config` comando, depois botão `menu`: aqui você pode encontrar um, "Report". Se ativado, os usuários poderão usar o comando `@admin`.
Somente os administradores que aceitaram receber relatórios (com o comando `/mysettings`) serão notificados
• `/mysettings` (em privado): daqui, você pode escolher se receber relatórios ou não

*Observação*: os administradores não podem usar o comando `@admin`, e os usuários não podem denunciar administradores com ele.]])
	elseif key == 'welcome' then-------------------------------------
		return _([[
*Configurações de boas-vindas/adeus*

• `/config`, then `menu` tab: receive in private the menu keyboard. You will find an option to enable/disable welcome/goodbye messages.
*Note*: goodbye messages don't work in large groups. This is a Telegram limitation that can't be avoided.

*Custom welcome message*:
• `/welcome Welcome $name, enjoy the group!`
Write after `/welcome` your welcome message. `/goodbye` works in the same way.

You can use some placeholders to include the name/username/id of the new member of the group
Placeholders:
`$username`: _will be replaced with the username_
`$name`: _will be replaced with the name_
`$id`: _will be replaced with the id_
`$title`: _will be replaced with the group title_
`$surname`: _will be replaced by the user's last name_
`$rules`: _will be replaced by a link to the rules of the group. Please read_ [here](https://telegram.me/GroupButler_beta/26) _how to use it, or you will get an error for sure_
*Note*: `$name`, `$surname`, and `$title` may not work properly within markdown markup.

*GIF/sticker as welcome message*
You can use a particular gif/sticker as welcome message. To set it, reply to the gif/sticker you want to set as welcome message with `/welcome`. Same goes for `/goodbye`
]])
	elseif key == 'extra' then-------------------------------------------------
		return _([[
*Extra commands*
#extra commands are a smart way to save your own custom commands.

• `/extra [#trigger] [reply]`: set a reply to be sent when someone writes the trigger.
_Example_ : with "`/extra #hello Good morning!`", the bot will reply "Good morning!" each time someone writes #hello.
You can reply to a media (_photo, file, vocal, video, gif, audio_) with `/extra #yourtrigger` to save the #extra and receive that media each time you use # command
• `/extra list`: get the list of your custom commands.
• `/extra del [#trigger]`: delete the trigger and its message.

*Note:* the markdown is supported. If the text sent breaks the markdown, the bot will notify that something is wrong.
For a correct use of the markdown, check [this post](https://telegram.me/GroupButler_ch/46) in the channel.
Now supports placeholders. Check the "welcome" tab for the list of the available placeholders
]])
	elseif key == 'warns' then-----------------------------------------
		return _([[
*Warns*
Warn are made to keep the count of the admonitions received by an user. Once an user has been warned for the defined number of times, he is kicked/banned by the bot.
There are two different type of warns:
- _normal warns_, given by an admin with the `/warn` command
- _automatic warns_ (read: media warns and spam warns), given by the bot when someone sends a media that is not allowed in the chat, or spams other channels or telegram.me links.

• `/warn [by reply]`: warn a user
• `/nowarns [by reply]`: reset the warns received by an user (both normal and automatic warns).
• `/warnmax [number]`: set the max number of the warns before the kick/ban.
• `/warnmax media [number]`: set the max number of the warns before kick/ban when an unallowed media is sent.

How to see how many warns a user has received (or to reset them): `/user` command.
How to change the max. number of warnings allowed: `/config` command, then `menu` button.
How to change the max. number of warnings allowed for medias: `/config` command, then `media` button.
How to change the max. number of warnings allowed for spam: `/config` command, then `antispam` button.
]])
	elseif key == 'pin' then------------------------------------------------------
		return _([[
*Pinning messages*
The "48 hours limit" to edit your own messages doesn't apply to bots.
This command was born from the necessity of editing the pinned message without sending it again, maybe just to change few things.
So with `/pin` you can generate a message to pin, and edit it how many times you want.

• `/pin [text]`: the bot will send you back the text you used as argument, with markdown. You can pin the message and use `/pin [text]` again to edit it
• `/pin`: the bot will find the latest message generate by `/pin`, if it still exists

*Note*: `/pin` supports markdown, but only `$rules` and `$title` placeholders
]])
	elseif key == 'lang' then----------------------------------------------
		-- TRANSLATORS: leave your contact information for reports mistakes in translation
		return _([[
*Group language*"
• `/lang`: choose the group language (can be changed in private too).

*Note*: translators are volunteers, so I can't ensure the correctness of all the translations. And I can't force them to translate the new strings after each update (not translated strings are in english).

Anyway, translations are open to everyone. If you want to translate the bot, see an [information](https://github.com/RememberTheAir/GroupButler#translators) on GitHub.
You can use `/strings` command to get the `.po` file of your language, and translate it

*Special characters*

• `/config` command, then `menu` button: you will receive in private the menu keyboard.
Here you will find two particular options: _Arab and RTL_.

*Arab*: when Arab it's not allowed (🚫), everyone who will write an arab character will be kicked from the group.
*Rtl*: it stands for 'Righ To Left' character, and it's the responsible of the weird service messages that are written in the opposite sense.
When Rtl is not allowed (🚫), everyone that writes this character (or that has it in his name) will be kicked.
]])
	elseif key == 'config' then
		return _([[
*General group settings*

`/config` or  `/settings`: manage the group settings in private from an inline keyboard.
The inline keyboard has three sub-menus:

*Menu*: manage the most important group settings
*Antiflood*: turn on or off the antiflood, set its sensitivity and choose some media to ignore, if you want
*Media*: choose which media to forbid in your group, and set the number of times that an user will be warned before being kicked/banned
*Antispam*: choose which kind of spam you want to forbid (example: telegram.me links, forwarded messages from channels)
]])
	end
end

local function dk_admins()
	local keyboard = {}
	keyboard.inline_keyboard = {}
	local list = {
		{
	    	[_("Banhammer")] = 'banhammer',
	    	[_("Group info")] = 'info'
	    },
	    {
	    	[_("Report system")] = 'report',
	    	[_("Pin")] = 'pin'
	    },
	    {
	    	[_("Languages")] = 'lang', --+ char
	    	[_("Group configuration")] = 'config'
	    },
	    {
	    	[_("Extra commands")] = 'extra',
	    	[_("Warns")] = 'warns'
	    },
	    {
	    	[_("Welcome settings")] = 'welcome',
	    }
	    
    }
    local line = {}
    for i, line in pairs(list) do
    	local kb_line = {}
    	for label, cb_data in pairs(line) do
        	table.insert(kb_line, {text = '× '..label, callback_data = 'help:admins:'..cb_data})
        end
        table.insert(keyboard.inline_keyboard, kb_line)
    end
    
	return keyboard
end

local function do_keyboard_private()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    	    {text = _("📢 Bot channel"), url = 'https://telegram.me/'..config.channel:gsub('@', '')},
    		{text = _("🌍 Select your language"), callback_data = 'selectlang'},
	    },
	    {
	        {text = _("📕 All the commands"), callback_data = 'help:back'}
        }
    }
    return keyboard
end

local function dk_main()
	local keyboard = {inline_keyboard={}}
	keyboard.inline_keyboard = {
		{{text = _('Basics'), callback_data = 'help:basics'}},
		{{text = _('Admin commands'), callback_data = 'help:admins:banhammer'}},
		{{text = _('Normal users commands'), callback_data = 'help:users'}},
		{{text = _('Commands in private'), callback_data = 'help:private'}},
		{{text = _('Realm commands'), callback_data = 'help:realm'}},
	}
	
	return keyboard
end

local function do_keyboard(keyboard_type)
	local callbacks = {
		['main'] = dk_main(),
		['admins'] = dk_admins()
	}
	
	local keyboard = callbacks[keyboard_type] or {inline_keyboard = {}}
	
	if keyboard_type ~= 'main' then
		table.insert(keyboard.inline_keyboard, {{text = _('Back'), callback_data = 'help:back'}})
	end
	
	return keyboard
end

function plugin.onTextMessage(msg, blocks)
	if blocks[1] == 'start' then
        if msg.chat.type == 'private' then
            local message = get_helped_string('start'):format(msg.from.first_name:escape())
            local keyboard = do_keyboard_private()
            api.sendMessage(msg.from.id, message, true, keyboard)
        end
    end
    if blocks[1] == 'help' then
        local keyboard = do_keyboard('main')
        local text = get_helped_string('main_menu')
    	local res = api.sendMessage(msg.from.id, text, true, keyboard)
    	if not res and msg.chat.type ~= 'private' and db:hget('chat:'..msg.chat.id..':settings', 'Silent') ~= 'on' then
    	    api.sendMessage(msg.chat.id, _('[Start me](%s) _to get the list of commands_'):format(misc.deeplink_constructor('', 'help')), true)
    	end
    end
end

function plugin.onCallbackQuery(msg, blocks)
    local query = blocks[1]
    local text, keyboard_type, answerCallbackQuery_text
    
    if query == 'back' then
    	keyboard_type = 'main'
    	text = get_helped_string('main_menu')
    	answerCallbackQuery_text = _('Main menu')
    elseif query == 'basics' then
        text = get_helped_string('basics')
        answerCallbackQuery_text = _('Basic usage')
    elseif query == 'users' then
        text = get_helped_string('users_group')
        answerCallbackQuery_text = _('Commands for users (group)')
    elseif query == 'private' then
    	text = get_helped_string('private')
    	answerCallbackQuery_text = _('Available commands in private')
    elseif query == 'realm' then
    	text = get_helped_string('realm')
    	answerCallbackQuery_text = _('Available commands in a realm')
    else --query == 'admins'
    	keyboard_type = 'admins'
    	text = get_helped_string(blocks[2])
    	answerCallbackQuery_text = _('Available commands for admins')
    end
    
    if not text then
    	api.answerCallbackQuery(msg.cb_id, _("Deprecated message, send /help again"), true)
    else
    	local keyboard = do_keyboard(keyboard_type)
    	local res, code = api.editMessageText(msg.chat.id, msg.message_id, text, true, keyboard)
    	if not res and code and code == 111 then
    	    api.answerCallbackQuery(msg.cb_id, _("❗️ Already there"))
		else
			api.answerCallbackQuery(msg.cb_id, answerCallbackQuery_text)
		end
	end
end

plugin.triggers = {
	onTextMessage = {
		config.cmd..'(start)$',
		config.cmd..'(help)$',
		'^/start :(help)$'
	},
	onCallbackQuery = {
		'^###cb:help:(admins):(%a+)$',
		'^###cb:help:(.*)$'
	}
}

return plugin
