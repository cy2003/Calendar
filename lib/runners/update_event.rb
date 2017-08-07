def update_event
  puts "Enter name of event you would like to update"
  event_name = gets.strip
  event_array = []
  @cal_name.events.each do |event|
    if event.name.downcase == event_name.downcase
      event_array << event
      @update_event = event
      update_event_info
    end
  end
  if event_array.empty?
    puts "There is no event by that name"
    help
  else
    help
  end
end

def update_event_info
  puts "-----------------------------------------------------------"
  puts "-----------------------------------------------------------"
  puts "Please enter one of the commands
  -- name       : updates the event name
  -- start time : updates the date and time
  -- end time   : updates the end time
  -- location   : updates the location name
  -- address    : updates the location address
  -- other      : update a different event
  -- help       : go to help menu
  -- exit       : exits the calendar"
  event_info_input = gets.strip.downcase
  case event_info_input
  when "name"
    update_event_name
  when "start time"
    update_event_start_time
  when "end time"
    update_event_end_time
  when "location"
    update_location_name
  when "address"
    update_location_address
  when "other"
    update_event
  when "help"
    help
  when "exit"
    exit_calendar
    exit
  else
    puts "Command not found. Please try again"
    update_event_info
  end
end

def update_event_name
  puts "Enter new event name"
  new_event_name = gets.strip
  @update_event.name = new_event_name
  event_updated
end

def update_event_start_time
  puts "Enter new date and start time
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
      @update_event.start_time = start_time
      event_updated
      break
    end
  end
end

def update_event_end_time
  puts "Enter new date and end time
  - Format: month/day/year hour:minutes(am/pm)
  - Example: 9/1/2017 3:00pm"
  end_time = gets.strip
  while true
    if (end_time.match(%r{\d{,2}/\d{,2}/\d{4} \d{,2}:\w{4}}) || end_time.match(%r{\d{,2}/\d{,2}/\d{4}})) == nil
      puts "The format is incorrect. Please try again
      - Format: month/day/year hour:minutes(am/pm)
      - Example: 9/1/2017 3:00pm"
      end_time = gets.strip
    else
      @update_event.end_time = end_time
      event_updated
      break
    end
  end
end

def update_location_name
  puts "Enter new location name"
  new_location_name = gets.strip
  @update_event.location[:name] = new_location_name
  event_updated
end

def update_location_address
  puts "Enter new location street address"
  location_address = gets.strip
  @update_event.location[:address] = location_address
  update_location_city
end

def update_location_city
  puts "Enter new location city or 'save' to save address"
  location_city = gets.strip
  if location_city.downcase == 'save'
    event_updated
  else
    @event.location[:city] = location_city
    update_location_state
  end
end

def update_location_state
  puts "Enter new location state or 'save' to save address"
  location_state = gets.strip
  if location_state.downcase == 'save'
    event_updated
  else
    @event.location[:state] = location_state
    update_location_zip
  end
end

def update_location_zip
  puts "Enter new location zipcode or 'save' to save address"
  location_zip = gets.strip
  if location_zip.downcase == 'save'
    event_updated
  else
    @event.location[:zip] = location_zip
    new_event_saved
  end
end

def event_updated
  puts "Event Updated
  #{@update_event.name}
  -- Start time: #{@update_event.start_time}"
  if @update_event.end_time
    puts "  -- End time: #{@update_event.end_time}"
  else
    puts "  - All Day Event"
  end
  if !@update_event.location.empty?
    values = @update_event.location.values_at(:name, :address, :city, :state, :zipcode).compact
    puts "  -- Location: #{values.join(', ')}" unless values.empty?
  else
    nil
  end
  update_event_info
end
