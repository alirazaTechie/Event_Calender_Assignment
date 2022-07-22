require_relative 'event_list'

eve = EventList.new

# random event List
date = "1/22/2022"
hour = "12"
minute = "36"
title = "First"
eve.create_new_event(Date.strptime(date, "%m/%d/%Y"), hour, minute, title)       

date = "1/23/2022"
hour = "12"
minute = "36"
title = "Second"
eve.create_new_event(Date.strptime(date, "%m/%d/%Y"), hour, minute, title)

date = "1/23/2022"
hour = "6"
minute = "46"
title = "Third"
eve.create_new_event(Date.strptime(date, "%m/%d/%Y"), hour, minute, title)

date = "8/24/2022"
hour = "12"
minute = "36"
title = "Fourth"
eve.create_new_event(Date.strptime(date, "%m/%d/%Y"), hour, minute, title)

date = "1/24/2024"
hour = "12"
minute = "36"
title = "Fifth"
eve.create_new_event(Date.strptime(date, "%m/%d/%Y"), hour, minute, title)

date = "5/24/2024"
hour = "2"
minute = "36"
title = "Sixth"
eve.create_new_event(Date.strptime(date, "%m/%d/%Y"), hour, minute, title)
puts "You have following events"
loop do
    puts "\n"
    eve.view_all_events
    puts "\n****************************************************************************************************************************************************************"
    puts "Enter 1 to View all Events on a given Date"
    puts "Enter 2 to View all Events in a Day/Week/Month"
    puts "Enter 3 to Add Events on a given Date and Time"
    puts "Enter 4 to Remove Events from a given Date and Time"
    puts "Enter 5 to Remove All Events from a given Day"
    puts "Enter 6 to Update Event on a given Date and Time"
    input = gets.chomp
    if input == 1.to_s
        puts "Enter Date in  mm/dd/yyyy"
        date = gets.chomp
        puts "You have following events on given date " + date
        eve.view_all_events_on_given_date(date)
        puts "#########################################################"
    
    elsif input == 2.to_s
        puts "Enter Date in  mm/dd/yyyy"
        date = gets.chomp
        puts "Press 1 for Day"
        puts "Press 2 for Week"
        puts "Press 3 for Month"
        user_input = gets.chomp
        if user_input == 1.to_s
            eve.view_all_events_on_given_date(date)
        elsif user_input == 2.to_s
            eve.view_all_events_on_given_week(date)
        elsif user_input == 3.to_s
            eve.view_all_events_on_given_month(date)
        end
        puts "#########################################################"

    elsif input == 3.to_s
        puts "Enter Date in  mm/dd/yyyy"
        date = gets.chomp
        puts "Enter hour in range of 0 to 23"
        hour = gets.chomp
        puts "Enter minutes in range of 0 to 59"
        minute = gets.chomp
        puts "Enter Event Title"
        title = gets.chomp
        eve.create_new_event(Date.strptime(date, "%m/%d/%Y"), hour, minute, title)
        puts "#########################################################"
    
    elsif input == 4.to_s
        puts "Enter Date in  mm/dd/yyyy"
        date = gets.chomp
        puts "Enter hour in range of 0 to 23"
        hour = gets.chomp
        puts "Enter minutes in range of 0 to 59"
        minute = gets.chomp
        puts "Events have been removed on given date " + date + " and time " + hour + ":" + minute
        eve.remove_all_events_on_given_date_and_time(date, hour, minute)
        puts "#########################################################"
    
    elsif input == 5.to_s    
        puts "Enter Date in  mm/dd/yyyy"
        date = gets.chomp
        puts "Events have been removed on given date " + date
        eve.remove_all_events_on_given_date(date)
        puts "#########################################################"
    
    elsif input == 6.to_s
        puts "Enter Date in  mm/dd/yyyy"
        date = gets.chomp
        puts "Enter hour in range of 0 to 23"
        hour = gets.chomp
        puts "Enter minutes in range of 0 to 59"
        minute = gets.chomp
        #eve.upate_event_on_given_date_and_time(date, hour, minute)     
        eve.view_all_events_on_given_date_and_time(date, hour, minute)
        puts "Enter the field you want to update i.e title 'abc', date 'm/dd/yyy', hour 'in range of 0 to 23', minute 'in range of 0 to 59'"
        symbol = gets.chomp
        puts "Enter the "+ symbol+ " value in correct format"
        value = gets.chomp
        eve.upate_event_on_given_date_and_time(date, hour, minute, symbol, value)
        puts "#########################################################"
    end 
end