local plugin = {}

function plugin.cron()
	local all = db:hgetall('tempbanned')
	if next(all) then
		for unban_time,info in pairs(all) do
			if os.time() > tonumber(unban_time) then
				local chat_id, user_id = info:match('(-%d+):(%d+)')
				api.unbanUser(chat_id, user_id)
				db:hdel('tempbanned', unban_time)
				db:srem('chat:'..chat_id..':tempbanned', user_id) --hash needed to check if an user is already tempbanned or not
			end
		end
	end
end

local function check_valid_time(temp)
	temp = tonumber(temp)
	if temp == 0 then
		return false, 1
	elseif temp > 168 then --1 week
		return false, 2
	else
		return temp
	end
end

local function get_hours_from_string(input)
	if input:match('^%d+$') then
		return tonumber(input)
	else
		local days = input:match('(%d)%s?d')
		if not days then days = 0 end
		local hours = input:match('(%d%d?)%s?h')
		if not hours then hours = 0 end
		if not days and not hours then
			return input:match('(%d+)')
		else
			return ((tonumber(days))*24)+(tonumber(hours))
		end
	end
end

local function get_time_reply(hours)
	local time_string = ''
	local time_table = {}
	time_table.days = math.floor(hours/24)
	time_table.hours = hours - (time_table.days*24)
	if time_table.days ~= 0 then
		time_string = time_table.days..'d'
	end
	if time_table.hours ~= 0 then
		time_string = time_string..' '..time_table.hours..'h'
	end
	return time_string, time_table
end

function plugin.onTextMessage(msg, blocks)
	if msg.chat.type ~= 'private' then
		if roles.is_admin_cached(msg) then
		    
		    local user_id, error_translation_key = misc.get_user_id(msg, blocks)
		    
		    if not user_id then
		    	api.sendReply(msg, _(error_translation_key), true) return
		    end
		    if msg.reply and msg.reply.from.id == bot.id then return end
		 	
		 	local res
		 	local chat_id = msg.chat.id
		 	local admin, kicked = misc.getnames_complete(msg, blocks)
		 	
		 	if blocks[1] == 'tempban' then
				if not msg.reply then
					api.sendReply(msg, _("Responder a alguém"))
					return
				end
				local user_id = msg.reply.from.id
				local hours = get_hours_from_string(blocks[2])
				if not hours then return end
				local temp, code = check_valid_time(hours)
				if not temp then
					if code == 1 then
						api.sendReply(msg, _("Para isso, você pode usar /ban diretamente"))
					else
						api.sendReply(msg, _("O prazo é de uma semana (168 horas)"))
					end
					return
				end
				local val = msg.chat.id..':'..user_id
				local unban_time = os.time() + (temp * 60 * 60)
				
				--try to kick
				local res, motivation = api.banUser(chat_id, user_id)
		    	if not res then
		    		if not motivation then
		    			motivation = _("Não posso kickar esse usuário..\n"
								.. "Ou eu não sou um administrador, ou o usuário alvo é um deus!!")
		    		end
		    		api.sendReply(msg, motivation, true)
		    	else
		    		misc.saveBan(user_id, 'tempban') --save the ban
		    		db:hset('tempbanned', unban_time, val) --set the hash
					local time_reply = get_time_reply(temp)
					local is_already_tempbanned = db:sismember('chat:'..chat_id..':tempbanned', user_id) --hash needed to check if an user is already tempbanned or not
					local text
					if is_already_tempbanned then
						text = _("O tempo de ban foi atualizado para %s. Ban exp: %s\n*Admin:* %s"):format(kicked, time_reply, admin)
					else
						text = _("User %s banido. Ban expira: %s\n*Admin:* %s"):format(kicked, time_reply, admin)
						db:sadd('chat:'..chat_id..':tempbanned', user_id) --hash needed to check if an user is already tempbanned or not
					end
					api.sendMessage(chat_id, text, true)
				end
			end
		 	if blocks[1] == 'kick' then
		    	local res, motivation = api.kickUser(chat_id, user_id)
		    	if not res then
		    		if not motivation then
		    			motivation = _("Eu não posso kickar esse usuário.\n"
								.. "Ou eu não sou um administrador, ou o usuário alvo é *!")
		    		end
		    		api.sendReply(msg, motivation, true)
		    	else
		    		misc.saveBan(user_id, 'kick')
		    		api.sendMessage(msg.chat.id, _("%s kickado %s!"):format(admin, kicked), true)
		    	end
	    	end
	   		if blocks[1] == 'ban' then
	   			local res, motivation = api.banUser(chat_id, user_id)
		    	if not res then
		    		if not motivation then
		    			motivation = _("Eu não posso kickar esse usuário.\n"
								.. "Ou eu não sou um administrador, ou o usuário alvo é foda!")
		    		end
		    		api.sendReply(msg, motivation, true)
		    	else
		    		--save the ban
		    		misc.saveBan(user_id, 'ban')
		    		--misc.logEvent('ban', msg, blocks, 'cnhdc cbhdhcbhcd bcdhcdbc')
		    		api.sendMessage(msg.chat.id, _("%s banned hahah %s!"):format(admin, kicked), true)
		    	end
    		end
   			if blocks[1] == 'unban' then
   				api.unbanUser(chat_id, user_id)
   				local text = _("User %s desbanido pelo %s!"):format(kicked, admin)
   				api.sendReply(msg, text, true)
   			end
		else
			if blocks[1] == 'kickme' then
				api.kickUser(msg.chat.id, msg.from.id)
			end
		end
	end
end

plugin.triggers = {
	onTextMessage = {
		config.cmd..'(kickme)',
		config.cmd..'(kick) (.+)',
		config.cmd..'(kick)$',
		config.cmd..'(ban) (.+)',
		config.cmd..'(ban)$',
		config.cmd..'(tempban) (.+)',
		config.cmd..'(unban) (.+)',
		config.cmd..'(unban)$',
	}
}

return plugin
