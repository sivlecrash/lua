adr_state 			= '1/0/1'				-- (1-closed)
adr_time_on         = '32/1/1'             --10 3byte time/day
adr_date_on         = '32/1/2'             --11 3byte date
adr_time_off        = '32/1/3'             --10 3byte time/day
adr_date_off        = '32/1/4'             --11 3byte date

state = grp.getvalue(adr_state)

if (state == false) then
  --"start time record"
  now = os.date('*t')								-- get current data as table
  wday = now.wday == 1 and 7 or now.wday - 1
  time = { 											-- time table
  day = wday,
  hour = now.hour,
  minute = now.min,
  second = now.sec,
  }
  date = { 											-- date table
  day = now.day,
  month = now.month,
  year = now.year,
  }
  grp.write(adr_time_on, time, dt.time) 			-- write to
  grp.write(adr_date_on, date, dt.date)
else
  --"end time record"
  now = os.date('*t') 								-- get current data as table
  wday = now.wday == 1 and 7 or now.wday - 1 	    -- system week day starts from sunday, convert it to knx format
  time = { 											-- time table
  day = wday,
  hour = now.hour,
  minute = now.min,
  second = now.sec,
  }
  date = { 											-- date table
  day = now.day,
  month = now.month,
  year = now.year,
  }
  grp.write(adr_time_off, time, dt.time) 			-- write to
  grp.write(adr_date_off, date, dt.date)
end