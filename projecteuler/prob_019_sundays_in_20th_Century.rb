#!/usr/bin/env ruby
# Solution to problem number 19 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=19

no_of_first_day_of_month_sundays = 0

for year in (1901..2000)
  for month in (1..12)                
    time = Time.local(year,month,1)
    no_of_first_day_of_month_sundays += 1 if "#{time.strftime("%A")}" == "Sunday"  
  end
end

puts "There are #{no_of_first_day_of_month_sundays} first of month Sundays in 20th Century"                