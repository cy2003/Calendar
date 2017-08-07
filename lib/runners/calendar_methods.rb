def create_calendar
  input = gets.strip.downcase
  while true
    if input.downcase == 'create'
      puts "Please enter a name for your Calendar"
      calendar_name = gets.strip
      @cal_name = Calendar.new(calendar_name)
      help
    elsif input.downcase == 'exit'
      exit_calendar
      exit
    else
      puts "I do not understand that command.
      I accept the following commands:
        - create : to create a new calendar
        - exit : exits this program"
      input = gets.strip
    end
  end
end

def list
  puts "#{@cal_name.name} Events"
  event_list = []
  @cal_name.events.each do |event|
    event_list << event
    puts "#{event.name}
  -- Start Time: #{event.start_time}"
    if event.end_time
      puts "  -- End Time: #{event.end_time}"
    else
      puts "  -- All Day Event"
    end
    if !event.location.empty?
      values = event.location.values_at(:name, :address, :city, :state, :zipcode).compact
      puts "  -- Location: #{values.join(', ')}" unless values.empty?
    end
    puts "---------------------------------------------------------"
  end
  if event_list.empty?
    puts "There are no events in your Calendar"
    help
  else
    help
  end 
end

def find_event_by_name
  puts "Enter event name"
  event_name = gets.strip
  event_array = []
  @cal_name.events.each do |event|
    if event.name.downcase == event_name.downcase
      event_array << event
      puts "#{event.name}
  -- Start Time: #{event.start_time}"
      if event.end_time
        puts "  -- End Time: #{event.end_time}"
      else
        puts "  -- All Day Event"
      end
      if !event.location.empty?
        values = event.location.values_at(:name, :address, :city, :state, :zipcode).compact
        puts "  -- Location: #{values.join(', ')}" unless values.empty?
      end
    end
  end
  if event_array.empty?
    puts "There are no events with that name"
    help
  else
    help
  end
end

def find_event_by_date
  puts "Enter event date
  - Format: month/day/year
  - Example: 9/1/2017"
  date = gets.strip
  date_array = []
  @cal_name.events.each do |event|
    if event.start_time.starts_with?(date)
      date_array << date
      puts "#{event.name}
  -- Start Time: #{event.start_time}"
      if event.end_time
        puts "  -- End Time: #{event.end_time}"
      else
        puts "  -- All Day Event"
      end
      if !event.location.empty?
        values = event.location.values_at(:name, :address, :city, :state, :zipcode).compact
        puts "  -- Location: #{values.join(', ')}" unless values.empty?
      end
    end
  end
  if date_array.empty?
    puts "There are no events with that date"
    help
  else
    help
  end
end

def find_todays_event
  today = Chronic.parse('today')
  todays_events = []
  @cal_name.events.each do |event|
    if Chronic.parse(event.start_time).to_date == today.to_date
      todays_events << event
      puts "#{event.name}
  -- Start Time: #{event.start_time}"
      if event.end_time
        puts "  -- End Time: #{event.end_time}"
      else
        puts "  -- All Day Event"
      end
      if !event.location.empty?
        values = event.location.values_at(:name, :address, :city, :state, :zipcode).compact
        puts "  -- Location: #{values.join(', ')}" unless values.empty?
      end
    end
  end
  if todays_events.empty?
    puts "There are no events for today"
    help
  else
    help
  end
end
