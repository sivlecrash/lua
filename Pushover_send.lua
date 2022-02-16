adr_title 					= '32/7/253' --Pushover title 250byte string
adr_message 				= '32/7/254' --Pushover message 250byte string
adr_pushover_send 	        = '32/7/255' --Pushover (1-send 0-send)

require("user.pushover")

--Set title for message
--Nastavit název zprávy
title = grp.getvalue(adr_title)

--Set message to be send (current time and date will be added automaticly)
--Nastavit zprávu k odeslání (aktuální èas a datum budou pøidány automaticky)
message = grp.getvalue(adr_message)

--Set sound to be played on device
--pushover(default), bike, bugle, cashregister, classical, cosmic, falling, gamelan, incoming, intermission, magic, mechanical, pianobar, siren, spacealarm, tugboat, alien, climb, persistent, echo, updown, none
--Nastavit zvuk, který se má pøehrávat na zaøízení
sound = 'none'

--[[ Set priority (-2 = no notification only badge and message in app, -1 = notification without sound or vibration, 0 = default, 1 = bypass user quiet hours (set in App not iOS), 2 = bypass user quiet hours (set in App not iOS) + acknowledge required
--Nastavte prioritu 
		 -2 = žádné upozornìní, pouze odznak a zpráva v aplikaci,
		 -1 = upozornìní bez zvuku nebo vibrací,
			0 = výchozí,
			1 = vynechání hodin neèinnosti uživatele (nastaveno v aplikaci, nikoli iOS), 
			2 = vynechání hodin neèinnosti uživatele (nastaveno v aplikaci, nikoli v systému iOS) + je vyžadováno potvrzení ]]--
priority = 1

--Seconds to retry when not acknowledged, minimum = 30 (only used with priority 2)
--Sekundy pro opakování, když není potvrzeno, minimum = 30 (používá se pouze s prioritou 2)
retry = 30 

--Seconds to expire retry when not acknowledged, maximum = 86400 (24 hrs, only used with priority 2)
--Sekundy do vypršení platnosti opakování, když není potvrzeno, maximum = 86400 (24 hodin, používá se pouze s prioritou 2)
expire = 3600 

--Activate Pushover with parameters above
--Aktivujte Pushover s parametry výše
pushover(title, message, sound, priority, retry, expire)