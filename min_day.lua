adr_minday = '15/2/1' --07 2byte unsigned integer (0...1439min)

now = os.date('*t') 	-- get current data as table
--year = now.year     -- 2000–2099 Year
--month = now.month   -- 1–12 Month
--day = now.day       -- 1–31 Day
hour = now.hour     	-- 23 Hour
minute = now.min    	-- 0–59 Minute
--second = now.sec    -- 0–59 Second

minday = (hour * 60) + minute
grp.update(adr_minday, minday)