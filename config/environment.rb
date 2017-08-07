require 'bundler/setup'
require 'active_support'
require 'active_support/core_ext'

Bundler.require(:default, :development)


require 'chronic'
require 'pry'
require 'time'


require_relative "../lib/models/calendar"
require_relative "../lib/models/event"
require_relative "../lib/runners/script"
require_relative "../lib/runners/create_event"
require_relative "../lib/runners/update_event"
require_relative "../lib/runners/delete_event"
