require 'restaurant'
require 'support/string_extend'

class Guide

  class Config
    @@actions = ['list', 'find', 'add', 'quit']

    def self.actions
      @@actions
    end

  end

  def initialize area = nil
    # locate the restaurant text file at path
    Restaurant.filepath = area
    if Restaurant.file_useable?
      puts "Found restaurant file"
    # or create a new file
    elsif Restaurant.create_file
      puts "Created restaurant file."
    # exit if create fails
    else
      puts "File create/locate fail"
      puts "Exiting.\n\n"
      exit!
    end
  end

  def launch!
    introduction
    result = nil
    until result == :quit do
      action = get_action
      result = do_action action
    end
    conclusion
  end

  def get_action
    action = nil
    until Guide::Config.actions.include? action
      puts "Some actions are: " + Guide::Config.actions.join(", ") if action
      print "> "
      user_response = gets.chomp
      action = user_response.downcase.strip
    end
    action
  end

  def do_action action
    case action
    when "list"
      list
    when "find"
      puts "finding..."
    when "add"
      add
    when "quit"
      return :quit
    else
      puts "\nI dont't understand that command.\n"
    end
  end

  def list
    output_action_header "Listing restaurant"
    restaurants = Restaurant.saved_restaurants
    output_restaurant_table restaurants
  end

  def add
    output_action_header "Add a restaurant"
    restaurant = Restaurant.build_using_questions
    if restaurant.save
      puts "\nRestaurant Added\n\n"
    else
      puts "\nSave Error: Restaurant not added\n\n"
    end
  end

  def introduction
    puts "\n\n <<< 欢迎来到 Restaurant Finder>>>\n\n"
    # puts "今天中午该吃什么呢？"
  end

  def conclusion
    puts "\n\n<<<不论去哪吃 少吃一点哦 健康第一!!!!>>>\n\n"
    # 
  end

  private

  def output_action_header text
    puts "\n#{text.upcase.center(60)}\n\n"
  end

  def output_restaurant_table restaurants = []
    print " " + "Name".ljust(30)
    print " " + "Cuisine".ljust(20)
    print " " + "Price".ljust(6) + "\n"
    puts "-" * 60
    restaurants.each do |restaurant|
      line = " " << restaurant.name.titleize.ljust(30)
      line << " " + restaurant.cuisine.titleize.ljust(20)
      line << " " + restaurant.formatted_price.rjust(6)
      puts line
    end
    puts "No restaurants found" if restaurants.empty?
    puts "-" * 60
  end
end
