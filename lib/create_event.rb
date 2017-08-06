def create_event
  create_event_name
  enter_start_time
end

def create_event_name
  puts "Enter a name for your new event"
  ev_name = gets.strip
  @event = Event.new(ev_name)
  @cal_name.add_event(@event)
end

def enter_start_time
  puts "Enter date and start time
  - Format is year-month-day hour:minutes
  - Example : enter 2017-10-01 15:30 for October 1, 2017 3:30pm
  - For All Day Event: enter year-month-day"
  start_time = gets.strip
  while true
    if (start_time.match(/\d{4}-\d{2}-\d{2} \d{2}:\d{2}/) || start_time.match(/\d{4}-\d{2}-\d{2}/)) == nil
      puts "The format is incorrect. Please try again
      - Format is year-month-day hour:minutes
      - Example : October 1, 2017 3:30pm enter 2017-10-01 15:30
      - For All Day Event: enter year-month-day"
      start_time = gets.strip
    else
      @event.start_time = start_time
      is_end_time
      break
    end
  end
end

def is_end_time
  puts "Is there an end time?
  - Enter 'yes' or 'no'"
  is_end_time_input = gets.strip
  while true
    if is_end_time_input == "yes"
      enter_end_time
      break
    elsif is_end_time_input == "no"
      @event.all_day = true
      is_location
      break
    else
      puts "Format is incorrect. Is there an end time?
      - Enter 'yes' or 'no'"
      is_end_time_input = gets.strip
    end
  end
end

def enter_end_time
  puts "Enter date and end_time
  - Format is year-month-day hour:minutes
  - Example : October 1, 2017 3:30pm enter 2017-10-01 15:30"
  end_time = gets.strip
  while true
    if end_time.match(/\d{4}-\d{2}-\d{2} \d{2}:\d{2}/) == nil
      puts "The format is incorrect. Please try again
      - Format is year-month-day hour:minutes
      - Example : October 1, 2017 3:30pm enter 2017-10-01 15:30"
      end_time = gets.strip
    else
      @event.end_time = end_time
      is_location
      break
    end
  end
end

def is_location
  puts "Is there a location?
  - Enter 'yes' or 'no'"
  location_input = gets.strip
  while true
    if location_input == "yes"
      enter_location_name
      break
    elsif location_input == "no"
      new_event_saved
      break
    else
      puts "Format is incorrect. Is there a location?
      - Enter 'yes' or 'no'"
      location_input = gets.strip
    end
  end
end

def enter_location_name
  puts "Enter location name"
  location_name = gets.strip
  @event.location[:name] = location_name
  is_address
end

def is_address
  puts "Is there an address?
  - Enter 'yes' or 'no'"
  address_input = gets.strip
  while true
    if address_input == "yes"
      enter_location_address
      break
    elsif address_input == "no"
      new_event_saved
      break
    else
      puts "Format is incorrect. Is there an address?
      - Enter 'yes' or 'no'"
      address_input = gets.strip
    end
  end
end

def enter_location_address
  puts "Enter location street address"
  location_address = gets.strip
  @event.location[:address] = location_address
  enter_location_city
end

def enter_location_city
  puts "Enter location city"
  location_city = gets.strip
  @event.location[:city] = location_city
  enter_location_state
end

def enter_location_state
  puts "Enter location state"
  location_state = gets.strip
  @event.location[:state] = location_state
  enter_location_zip
end

def enter_location_zip
  puts "Enter location zipcode"
  location_zip = gets.strip
  @event.location[:zip] = location_zip
  new_event_saved
end

def new_event_saved
  puts "New Event Saved
  #{@event.name}
  - start time: #{@event.start_time}"
  if @event.end_time
    puts "- end time: #{@event.end_time}"
  else
    puts "  - All Day Event"
  end
  if !@event.location.empty?
    puts"  - location: #{@event.location[:name]}, #{@event.location[:address]}, #{@event.location[:city]}, #{@event.location[:state]}, #{@event.location[:zip]}"
  else
    nil
  end
  help
end
