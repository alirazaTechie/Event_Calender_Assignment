require_relative '../event_list'

describe EventList do

    context "When testing the EventList Class" do
        
        it "should create a new Event" do
            @eve = EventList.new
            date = "1/22/2022"
            hour = "12"
            minute = "36"
            title = "First"
            
            @eve.create_new_event(Date.strptime(date, "%m/%d/%Y"), hour, minute, title)
        
            expect(@eve.list_of_events).to contain_exactly(
                an_object_having_attributes(title: "First")
            )  
        end

        it "should remove Event on given date" do
            @eve = EventList.new
            date = "1/22/2022"
            hour = "12"
            minute = "36"
            title = "First"
            
            @eve.create_new_event(Date.strptime(date, "%m/%d/%Y"), hour, minute, title)  
            @eve.remove_all_events_on_given_date(date)
            
            expect(@eve.list_of_events).to_not contain_exactly(
                an_object_having_attributes(title: "First")
            )
        end

        it "should Update Event on given date" do
            @eve = EventList.new
            date = "1/22/2022"
            hour = "12"
            minute = "36"
            title = "First"
            symbol = "title"
            value = "First Updated"

            @eve.create_new_event(Date.strptime(date, "%m/%d/%Y"), hour, minute, title)
            @eve.upate_event_on_given_date_and_time(date, hour, minute, symbol, value)
            
            expect(@eve.list_of_events).to_not contain_exactly(
                an_object_having_attributes(title: "First")
            )
            expect(@eve.list_of_events).to contain_exactly(
                an_object_having_attributes(title: "First Updated")
            )
            
        end
    end
end