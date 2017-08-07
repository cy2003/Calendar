def delete_event
  puts "Enter name of event you would like to delete"
  event_name = gets.strip
  event_array = []
  @cal_name.events.each do |event|
    if event.name.downcase == event_name.downcase
      event_array << event
      @cal_name.events.delete(event)
      puts "#{event.name} has been deleted"
      help
    end
  end
  if event_array.empty?
    puts "There is no event by that name"
    help
  else
    help
  end
end
