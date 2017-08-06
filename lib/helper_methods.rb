def exit_calendar
  puts "Good-bye"
end

def help
  puts "I accept the following commands:
    - help : displays this help message
    - add : adds an event to your Calendar
    - display : lists all your events
    - name : find event by name
    - date : find event by date
    - today : find today's event
    - update : update an event
    - delete : delete an event
    - exit : exits this program"
end

def welcome
  puts "Welcome to Calendar!
  I accept the following commands:
    - create : to create a new calendar
    - exit : exits this program"
end

def create_calendar
  input = gets.strip

  if input.downcase == 'create'
    puts "Please enter a name for your Calendar"
    calendar_name = gets.strip
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

  @cal_name = Calendar.new(calendar_name)
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
      enter_location
      break
    elsif location_input == "no"
      break
    else
      puts "Format is incorrect. Is there a location?
      - Enter 'yes' or 'no'"
      location_input = gets.strip
    end
  end
end

def enter_location
  puts "Enter location name"
  location_name = gets.strip
  @event.location[:name] = location_name
end
