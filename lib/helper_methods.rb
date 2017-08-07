def exit_calendar
  puts "Good-bye"
end

def help
  puts "I accept the following commands:
    - help : displays this help message
    - add : adds an event to your Calendar
    - list : lists all your events
    - name : find event by name
    - date : find event by date
    - today : find today's event
    - update : update an event
    - delete : delete an event
    - exit : exits this program"
  input = gets.strip
  case input
  when "help"
    help
  when "add"
    create_event
  when "list"
    list
  when "name"
    find_event_by_name
  when "date"
    find_event_by_date
  else "exit"
    exit_calendar
    exit
  end
end

def welcome
  puts "Welcome to Calendar!
  I accept the following commands:
    - create : to create a new calendar
    - exit : exits this program"
end

def create_calendar
  input = gets.strip
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
  @cal_name.events.each do |event|
    puts "#{event.name}
  -- Start Time: #{event.start_time}"
    if event.end_time
      puts "  -- End Time: #{event.end_time}"
    else
      puts "  -- All Day Event"
    end
    if !event.location.empty?
      puts "  -- Location: #{event.location[:name]}, #{event.location[:address]}, #{event.location[:city]}, #{event.location[:state]}, #{event.location[:zip]}"
    end
    puts "-------------------------------------------------------------"
  end
  help
end

def find_event_by_name
  puts "Enter event name"
  event_name = gets.strip
  @cal_name.events.each do |event|
    if event.name == event_name
      puts "#{event.name}
  -- Start Time: #{event.start_time}"
      if event.end_time
        puts "  -- End Time: #{event.end_time}"
      else
        puts "  -- All Day Event"
      end
      if !event.location.empty?
        puts "  -- Location: #{event.location[:name]}, #{event.location[:address]}, #{event.location[:city]}, #{event.location[:state]}, #{event.location[:zip]}"
      end
    end
  end
  help
end

def find_event_by_date
  puts "Enter event date
  - Format: month/day/year
  - Example: 9/1/2017"
  date = gets.strip
  @cal_name.events.each do |event|
    if event.start_time.starts_with?(date)
      puts "#{event.name}
  -- Start Time: #{event.start_time}"
      if event.end_time
        puts "  -- End Time: #{event.end_time}"
      else
        puts "  -- All Day Event"
      end
      if !event.location.empty?
        puts "  -- Location: #{event.location[:name]}, #{event.location[:address]}, #{event.location[:city]}, #{event.location[:state]}, #{event.location[:zip]}"
      end
    end
  end
  help
end
#
# def enter_end_time
#   puts "Enter date and end_time
#   - Format: month/day/year hour:minutes(am/pm)
#   - Example: 9/1/2017 3:00pm"
#   end_time = gets.strip
#   while true
#     if end_time.match(%r{\d{,2}/\d{,2}/\d{4} \d{,2}:\w{4}}) == nil
#       puts "The format is incorrect. Please try again
#       - Format: month/day/year hour:minutes(am/pm)
#       - Example: 9/1/2017 3:00pm"
#       end_time = gets.strip
#     else
#       @event.end_time = end_time
#       is_location
#       break
#     end
#   end
# end
