require 'pry'

class Calendar


  attr_accessor :name


  def initialize(name)
    @name = name
    @events = []
  end

  def name
    @name
  end

  def events
    @events
  end

  def add_event(event)
    @events << event
    event.calendar = self 
  end


end
