require 'restaurant'

class Guide

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
    # action loop
    result = nil
    until result == :quit do
      #   what do you want to do? (list, find, add, quit)
      print "> "
      user_response = gets.chomp
      #   do that action
      result = do_action(user_response)
    end
    conclusion
  end

  def do_action action
    case action
    when "list"
      puts "listing..."
    when "find"
      puts "finding..."
    when "add"
      puts "Adding..."
    when "quit"
      return :quit
    else
      puts "\nI dont't understand that command.\n"
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
