def delete_event
  puts "Enter name of event you would like to delete"
  event_name = gets.strip
  @cal_name.events.each do |event|
    if event.name == event_name
      @cal_name.events.delete(event)
      puts "Your event has been deleted"
      help
    end
  end
  if event.name != event_name
    puts "There is no event by that name"
    help
  end
end
