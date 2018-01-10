### Restaurant Finder ###

#Launch this Ruby file from the command line to get started

APP_ROOT  = File.dirname(__FILE__)

#require "#{APP_ROOT}/lib/guide"
#require File.join(APP_ROOT, "lib", "guide.rb")
#require File.join(APP_ROOT, "lib", "guide")

$:.unshift( File.join(APP_ROOT, "lib") )
require "guide"

puts "Please select a location area:"
location = gets.chomp

guide = Guide.new(location)
guide.launch!
