--"lua datediff"
adr_time_on         = '32/1/1'             --10 3byte time/day
adr_date_on         = '32/1/2'             --11 3byte date
adr_time_off        = '32/1/3'             --10 3byte time/day
adr_date_off        = '32/1/4'             --11 3byte date
adr_time_difference = '32/1/5'              --14 4byte floating point ["s."]

time_on     = grp.getvalue(adr_time_on)
date_on     = grp.getvalue(adr_date_on)
time_off    = grp.getvalue(adr_time_off)
date_off    = grp.getvalue(adr_date_off)

time1 = grp.getvalue(adr_time_on) 					-- table: ["day"] ["minute"] ["second"] ["hour"] ["min"] ["sec"]
date1 = grp.getvalue(adr_date_on) 					-- table: ["day"] ["year"] ["month"]
time2 = grp.getvalue(adr_time_off) 					-- table: ["day"] ["minute"] ["second"] ["hour"] ["min"] ["sec"]
date2 = grp.getvalue(adr_date_off) 					-- table: ["day"] ["year"] ["month"]

second1 = os.time{min=time1.minute, hour=time1.hour, day=date1.day, month=date1.month, year=date1.year} --conversion to seconds (Not to be used with dates before 1970.)
second2 = os.time{min=time2.minute, hour=time2.hour, day=date2.day, month=date2.month, year=date2.year} --conversion to seconds (Not to be used with dates before 1970.)
second1 = second1 + time1.second
second2 = second2 + time2.second
second = second2 - second1									-- time difference

grp.write(adr_time_difference, second) 			-- write to