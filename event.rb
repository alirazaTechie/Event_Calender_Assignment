require 'date'

class Event
   attr_accessor :date, :hour, :minute, :title
   
   def initialize(date, hour, minute, title)
    @date = date
    @hour = hour
    @minute = minute
    @title = title
   end
   
end
