local plugin = {}

function plugin.onTextMessage(msg, blocks)
	
	if not msg.service then return end
	
	if blocks[1] == 'new_chat_member:bot' or blocks[1] == 'migrate_from_chat_id' then
		-- set the language
		--[[locale.language = db:get(string.format('lang:%d', msg.from.id)) or 'en'
		if not config.available_languages[locale.language] then
			locale.language = 'en'
		end]]

		if misc.is_blocked_global(msg.from.id) then
			api.sendMessage(msg.chat.id, _("_VoÊ (user ID: %d) está na lista negra kkk_"):format(msg.from.id), true)
			api.leaveChat(msg.chat.id)
			return
		end
		if config.bot_settings.admin_mode and not roles.is_superadmin(msg.from.id) then
			api.sendMessage(msg.chat.id, _("_O modo Admin está ativado: somente o administrador do bot pode me adicionar a um novo grupo_"), true)
			api.leaveChat(msg.chat.id)
			return
		end

		-- save language
		--[[if locale.language then
			db:set(string.format('lang:%d', msg.chat.id), locale.language)
		end]]
		misc.initGroup(msg.chat.id)

		-- send manuals
		local text
		if blocks[1] == 'new_chat_member:bot' then
			text = _("Olá a todos!\n"
				.. "Meu nome é %s, e eu sou um bot feito para ajudar os administradores a dar ban :).\n")
				:format(bot.first_name:escape())
		else
			text = _("Este grupo foi atualizado. Você é ótimo! Agora eu posso funcionar corretamente :)\n")
		end
		--[[if not roles.is_admin_cached(msg.chat.id, bot.id) then
			if roles.is_owner_cached(msg.chat.id, msg.from.id) then
				text = text .. _("Hmm… apparently I'm not an administrator. "
					.. "I can be more useful if you make me an admin. "
					.. "See [here](https://telegram.me/GroupButler_ch/104) how to do it.\n")
			else
				text = text .. _("Hmm… apparently I'm not an administrator. "
					.. "I can be more useful if I'm an admin. Ask a creator to make me an admin. "
					.. "If he doesn't know how, there is a good [guide](https://telegram.me/GroupButler_ch/104).\n")
			end
		end]]
		--[[
		text = text .. _("I can do a lot of cool things. To discover about them, "
				-- TODO: old link, update it
			.. "watch this [video-tutorial](https://youtu.be/uqNumbcUyzs).")
		]]
		api.sendMessage(msg.chat.id, text, true)
	end
	if blocks[1] == 'left_chat_member:bot' then
				
		local realm_id = db:get('chat:'..msg.chat.id..':realm')
		if realm_id then
			if db:hget('realm:'..realm_id..':subgroups') then
				api.sendMessage(realm_id, _("I've been removed from %s [<code>%d</code>], one of your subgroups"):format(msg.chat.title:escape_html(), msg.chat.id), 'html')
			end
		end
		
		misc.remGroup(msg.chat.id)
	end
end

plugin.triggers = {
	onTextMessage = {
		'^###(new_chat_member:bot)',
		'^###(migrate_from_chat_id)',
		'^###(left_chat_member:bot)',
	}
}

return plugin
