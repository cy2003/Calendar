def help
  puts "---------------------------------------------------------"
  puts "---------------------------------------------------------"
  puts "I accept the following commands:
    - help   : displays this help message
    - add    : adds an event to your Calendar
    - list   : lists all your events
    - name   : find event by name
    - date   : find event by date
    - today  : find today's events
    - update : update an event
    - delete : delete an event
    - exit   : exits this program"
  input = gets.strip.downcase
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
  when "today"
    find_todays_event
  when "update"
    update_event
  when "delete"
    delete_event
  when "exit"
    exit_calendar
    exit
  else
    puts "Command not found. Please try again"
    help
  end
end
