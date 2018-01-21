require 'restaurant'

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
      puts "listing..."
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

  def add
    puts "\nAdd a restaurant\n\n".upcase
    restaurant = Restaurant.new
    print "Restaurant name: "
    restaurant.name = gets.chomp.strip
    print "Restaurant cuisine type: "
    restaurant.cuisine = gets.chomp.strip
    print "Restaurant average price: "
    restaurant.price = gets.chomp.strip

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
end
