require 'ssl.https'
 
local pushover_url = 'https://api.pushover.net/1/messages.json'
local token = 'hfldhflkjdhfdhfl�dhfdjhfdjhfjd' -- "Applications - API Token/Key z pushover.net" -- V� aplika�n� token, alespo� 1 aplikace mus� b�t vytvo�ena na pushover.net, abyste z�skali aplika�n� token
local user = 'jhakjldfhlkjdhfkldjhflkdjhfjkhj' -- "Your User Key z pushover.net"' -- V� u�ivatelsk� token, na�t�te z nastaven� v aplikaci pushover pro Android nebo ios
 
function pushover(title, message, sound, priority, retry, expire)
     if priority < -2 then priority = -2 end
     if priority > 2 then priority = 2 end      
     if retry < 30 then retry = 30 end
     if retry > 86400 then retry = 86400 end
     if expire < retry then expire = retry end
     if expire > 86400 then expire = 86400 end
     if priority == 2 then prioritystring = ''.. priority .. '&retry=' .. retry .. '&expire=' .. expire ..'' else prioritystring = priority end     
     now = os.date('*t')
     timestamp = string.format('%02d', now.day) .. '-' .. string.format('%02d', now.month) .. '-' .. now.year .. ' ' ..  string.format('%02d', now.hour) .. ':' .. string.format('%02d', now.min) .. ':' .. string.format('%02d', now.sec)
     local data_str = 'user=' .. user .. '&message=' .. message .. ' ' .. timestamp .. '&token=' .. token .. '&title=' .. title  .. '&sound=' .. sound .. '&priority=' .. prioritystring .. ''
     local res, code, headers, status = ssl.https.request(pushover_url, data_str)
end