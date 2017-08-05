require 'bundler/setup'
require 'active_support'
require 'active_support/core_ext'

Bundler.require(:default, :development)


require 'chronic'
require 'pry'


require_relative "../lib/calendar"
require_relative "../lib/helper_methods"
require_relative "../lib/event"
