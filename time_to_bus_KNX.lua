now = os.date('*t')-- get current data as table
wday = now.wday == 1 and 7 or now.wday - 1 -- system week day starts from sunday, convert it to knx format
time = { -- time table
day = wday,
hour = now.hour,
minute = now.min,
second = now.sec,
}
date = { -- date table
day = now.day,
month = now.month,
year = now.year,
}
grp.write('15/1/1', time, dt.time) -- write to bus
grp.write('15/1/2', date, dt.date) -- write to bus