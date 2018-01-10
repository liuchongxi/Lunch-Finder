class Guide

  def initialize path=nil
    # locate the restaurant text file at path
    # or create a new file
    # exit if create fails
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
