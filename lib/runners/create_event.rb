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
  - Format: month/day/year hour:minutes(am/pm)
  - Example: 9/1/2017 3:00pm
  - For All Day Event: month/day/year"
  start_time = gets.strip
  while true
    if (start_time.match(%r{\d{,2}/\d{,2}/\d{4} \d{,2}:\w{4}}) || start_time.match(%r{\d{,2}/\d{,2}/\d{4}})) == nil
      puts "The format is incorrect. Please try again
      - Format: month/day/year hour:minutes(am/pm)
      - Example: 9/1/2017 3:00pm
      - For All Day Event: month/day/year"
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
  - Format: month/day/year hour:minutes(am/pm)
  - Example: 9/1/2017 3:00pm"
  end_time = gets.strip
  while true
    if end_time.match(%r{\d{,2}/\d{,2}/\d{4} \d{,2}:\w{4}}) == nil
      puts "The format is incorrect. Please try again
      - Format: month/day/year hour:minutes(am/pm)
      - Example: 9/1/2017 3:00pm"
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
  enter_location_address
end

def enter_location_address
  puts "Enter location street address or 'save' to save event"
  location_address = gets.strip
  if location_address.downcase == 'save'
    new_event_saved
  else
    @event.location[:address] = location_address
    enter_location_city
  end
end

def enter_location_city
  puts "Enter location city or 'save' to save event"
  location_city = gets.strip
  if location_city.downcase == 'save'
    new_event_saved
  else
    @event.location[:city] = location_city
    enter_location_state
  end
end

def enter_location_state
  puts "Enter location state or 'save' to save event"
  location_state = gets.strip
  if location_state.downcase == 'save'
    new_event_saved
  else
    @event.location[:state] = location_state
    enter_location_zip
  end
end

def enter_location_zip
  puts "Enter location zipcode or 'save' to save event"
  location_zip = gets.strip
  if location_zip.downcase == 'save'
    new_event_saved
  else
    @event.location[:zip] = location_zip
    new_event_saved
  end
end

def new_event_saved
  puts "New Event Saved
  #{@event.name}
  -- Start time: #{@event.start_time}"
  if @event.end_time
    puts "  -- End time: #{@event.end_time}"
  else
    puts "  -- All Day Event"
  end
  if !@event.location.empty?
    values = @event.location.values_at(:name, :address, :city, :state, :zipcode).compact
    puts "  -- Location: #{values.join(', ')}" unless values.empty?
  else
    nil
  end
  help
end
