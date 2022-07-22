require_relative 'event'

class EventList
    attr_accessor  :list_of_events
    def initialize
        @list_of_events = []
    end
    
    def create_new_event(date, hour, minute, title)
        @list_of_events << Event.new(date, hour, minute, title)
    end
    
    def view_all_events  
        @list_of_events.each do |event|
            puts "You have " + event.title + " event on " + event.date.to_s + " at " + event.hour + ":" + event.minute
        end
    end

    def remove_all_events_on_given_date_and_time(date, hour, minute)
        @list_of_events.delete_if { |event| event.date == Date.strptime(date, "%m/%d/%Y") && event.hour == hour && event.minute == minute }
    end

    def remove_all_events_on_given_date(date)
        @list_of_events.delete_if { |event| event.date == Date.strptime(date, "%m/%d/%Y") }
    end

    def upate_event_on_given_date_and_time(date, hour, minute, symbol, value)
        
        @list_of_events.each do |event|
            if event.date == Date.strptime(date, "%m/%d/%Y") && event.hour == hour && event.minute == minute
                variable_name = "@#{symbol}".to_s
                if variable_name == "@title"
                    event.title = value
                elsif variable_name == "@date"
                    event.date = Date.strptime(value, "%m/%d/%Y")
                elsif variable_name == "@hour"
                    event.hour = value
                elsif variable_name == "@minute"
                    event.minute = value
                end    
            end
        end
    end

    def view_all_events_on_given_date_and_time(date, hour, minute)
        @list_of_events.each do |event|
            if event.date == Date.strptime(date, "%m/%d/%Y") && event.hour == hour && event.minute == minute
                puts "You have " + event.title + " event on " + event.date.to_s + " at " + event.hour + ":" + event.minute
            end
        end
    end

    def view_all_events_on_given_date(date)
        @list_of_events.each do |event|
            if event.date == Date.strptime(date, "%m/%d/%Y")
                puts "You have " + event.title + " event on " + event.date.to_s + " at " + event.hour + ":" + event.minute
            end
        end
    end

    def view_all_events_on_given_week(date)
        d = Date.strptime(date, "%m/%d/%Y")
     
        puts "\nFollowing are events on given week "
        @list_of_events.each do |event|
           if event.date.strftime('%-V') ==  d.strftime('%-V') && event.date.year == d.year
                puts "You have " + event.title + " event on " + event.date.to_s + " at " + event.hour + ":" + event.minute
           end
        end
    end

    def view_all_events_on_given_month(date)
        d = Date.strptime(date, "%m/%d/%Y")
        
        puts "\nFollowing are events on given month"
        @list_of_events.each do |event|
           if event.date.mon ==  d.mon && event.date.year == d.year
                puts "You have " + event.title + " event on " + event.date.to_s + " at " + event.hour + ":" + event.minute
           end
        end
    end

end
