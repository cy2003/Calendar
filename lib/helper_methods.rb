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

def create_event

  puts "Enter a name for your new event"

  ev_name = gets.strip

  puts "All day event?
  - Enter true for yes
  - Enter false for no"

  all_day = gets.strip
  if all_day.downcase == "true" || all_day.downcase == "false"
    puts "Enter date and start time
    - Format is year-month-day hour:minutes
    - Example : for October 1, 2017 3:30pm enter 2017-10-01 15:30"
    start_time = gets.strip
  elsif all_day.downcase == 'exit'
    exit_calendar
    exit
  else
    puts "I do not understand that command.
    I accept the following commands:
      - true : for yes
      - false : for no
      - exit : to exit the program"
    all_day = gets.strip
  end

  until all_day.downcase == "true" || all_day.downcase == "false" || all_day.downcase == "exit"
    puts "I do not understand that command.
    I accept the following commands:
      - true : for yes
      - false : for no
      - exit : to exit the program"
    all_day = gets.strip
  end

  puts "Enter date and start time
  - Format is year-month-day hour:minutes
  - Example : for October 1, 2017 3:30pm enter 2017-10-01 15:30"

  start_time = gets.strip

  if start_time.match(/\d{4}-\d{2}-\d{2} \d{2}:\d{2}/) == nil
    puts "The format is incorrect. Please try again
    - Format is year-month-day hour:minutes
    - Example : for October 1, 2017 3:30pm enter 2017-10-01 15:30"
    start_time = gets.strip
  else
    puts "Enter date and end_time
    - Format is year-month-day hour:minutes
    - Example : for October 1, 2017 3:30pm enter 2017-10-01 15:30"
    end_time = gets.strip
  end

  until start_time.match(/\d{4}-\d{2}-\d{2} \d{2}:\d{2}/) != nil
    puts "The format is incorrect. Please try again
    - Format is year-month-day hour:minutes
    - Example : for October 1, 2017 3:30pm enter 2017-10-01 15:30"
    start_time = gets.strip
  end

  puts "Enter date and end_time
  - Format is year-month-day hour:minutes
  - Example : for October 1, 2017 3:30pm enter 2017-10-01 15:30"
  end_time = gets.strip

  if end_time.match(/\d{4}-\d{2}-\d{2} \d{2}:\d{2}/) == nil
    puts "The format is incorrect. Please try again
    - Format is year-month-day hour:minutes
    - Example : for October 1, 2017 3:30pm enter 2017-10-01 15:30"
    end_time = gets.strip
  else
    puts "Enter location name"
    location_name = gets.strip
  end

  until end_time.match(/\d{4}-\d{2}-\d{2} \d{2}:\d{2}/) != nil
    puts "The format is incorrect. Please try again
    - Format is year-month-day hour:minutes
    - Example : for October 1, 2017 3:30pm enter 2017-10-01 15:30"
    end_time = gets.strip
  end

  puts "Enter location name"

  location_name = gets.strip
  location = {}
  location[:name] = location_name

  puts "Enter location address"

  address = gets.strip
  location[:address] = address

  puts "Enter location city"
  city = gets.strip
  location[:city] = city

  puts "Enter location state"
  state = gets.strip
  location[:state] = state

  puts "Enter location zipcode"
  zipcode = gets.strip
  location[:zipcode] = zipcode

  @event1 = Event.new(ev_name, all_day, start_time, end_time, location)
  @cal_name.add_event(@event1)
  binding.pry
  puts @cal_name.events[0].location[:name]

end
