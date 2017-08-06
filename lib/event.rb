class Event

  attr_accessor :name, :all_day, :start_time, :end_time, :location

  def initialize(name, start_time:nil, end_time:nil, **location)
    @name = name
    @all_day = false
    @start_time = Time.parse(start_time) if start_time
    @end_time = Time.parse(end_time) if end_time
    @location = {} || location[:name]
  end

  def name
    @name
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

  def all_day
    @all_day
  end


end
