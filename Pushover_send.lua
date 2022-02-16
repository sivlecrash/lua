adr_title 					= '32/7/253' --Pushover title 250byte string
adr_message 				= '32/7/254' --Pushover message 250byte string
adr_pushover_send 	        = '32/7/255' --Pushover (1-send 0-send)

require("user.pushover")

--Set title for message
--Nastavit n�zev zpr�vy
title = grp.getvalue(adr_title)

--Set message to be send (current time and date will be added automaticly)
--Nastavit zpr�vu k odesl�n� (aktu�ln� �as a datum budou p�id�ny automaticky)
message = grp.getvalue(adr_message)

--Set sound to be played on device
--pushover(default), bike, bugle, cashregister, classical, cosmic, falling, gamelan, incoming, intermission, magic, mechanical, pianobar, siren, spacealarm, tugboat, alien, climb, persistent, echo, updown, none
--Nastavit zvuk, kter� se m� p�ehr�vat na za��zen�
sound = 'none'

--[[ Set priority (-2 = no notification only badge and message in app, -1 = notification without sound or vibration, 0 = default, 1 = bypass user quiet hours (set in App not iOS), 2 = bypass user quiet hours (set in App not iOS) + acknowledge required
--Nastavte prioritu 
		 -2 = ��dn� upozorn�n�, pouze odznak a zpr�va v aplikaci,
		 -1 = upozorn�n� bez zvuku nebo vibrac�,
			0 = v�choz�,
			1 = vynech�n� hodin ne�innosti u�ivatele (nastaveno v aplikaci, nikoli iOS), 
			2 = vynech�n� hodin ne�innosti u�ivatele (nastaveno v aplikaci, nikoli v syst�mu iOS) + je vy�adov�no potvrzen� ]]--
priority = 1

--Seconds to retry when not acknowledged, minimum = 30 (only used with priority 2)
--Sekundy pro opakov�n�, kdy� nen� potvrzeno, minimum = 30 (pou��v� se pouze s prioritou 2)
retry = 30 

--Seconds to expire retry when not acknowledged, maximum = 86400 (24 hrs, only used with priority 2)
--Sekundy do vypr�en� platnosti opakov�n�, kdy� nen� potvrzeno, maximum = 86400 (24 hodin, pou��v� se pouze s prioritou 2)
expire = 3600 

--Activate Pushover with parameters above
--Aktivujte Pushover s parametry v��e
pushover(title, message, sound, priority, retry, expire)