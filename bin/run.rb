require_relative '../config/environment'
require 'chronic'


welcome
create_calendar
create_event_name
all_day_event


# def practice(name:'name', all_day: false, start_time:'start_time', end_time:'end_time',location:'location')
#   @name = name
#   @all_day = all_day
#   @start_time = start_time
#   @end_time = end_time
#   @location = location
#   puts "#{@name}, #{@all_day}, #{Time.parse(@start_time)}, #{@location}"
# end
#
# practice(start_time:"2017-10-01 01:00", location:{"name"=>"hello","city"=>"NY"}, name:"party")
