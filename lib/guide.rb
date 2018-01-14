require 'restaurant'

class Guide

  def initialize path=nil
    # locate the restaurant text file at path
    Restaurant.filepath = path
    if Restaurant.file_exists?
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
    #   what do you want to do? (list, find, add, quit)
    #   do that action
    # repeat until user quits
    conclusion
  end

  def introduction
    puts "\n\n <<< 欢迎来到 Restaurant Finder>>>\n\n"
    # puts "今天中午该吃什么呢？"
  end

  def conclusion
    puts "\n\n<<<不论去哪吃 少吃一点哦 健康第一!!!!>>>\n\n"
  end
end
