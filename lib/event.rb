class Event

  attr_accessor :name, :calendar

  def initialize(name, all_day=false, start_time, end_time, **location)
    @name = name
    @all_day = all_day
    @start_time = Time.parse(start_time)
    @end_time = Time.parse(end_time)
    @location = location
  end

  def name
    @name
  end

  def calendar
    @calendar
  end

  def start_time
    @start_time
  end

  def end_time
    @end_time
  end

  def location
    @location
  end 

end
