class Restaurant

  @@filepath = nil

  def self.filepath= area = nil
    @@filepath = File.join(APP_ROOT, "Area", area)
  end

  attr_accessor :name, :cuisine, :price

  def self.file_exists?
    # class should know if the restaurant file exists
    @@filepath && File.exist?(@@filepath) ? true : false
  end

  def self.file_useable?
    return false unless @@filepath
    return false unless File.exist? @@filepath
    return false unless File.readable? @@filepath
    return false unless File.writable? @@filepath
    return true
  end

  def self.create_file
    # create the restaurant file
    File.open(@@filepath, 'w') unless file_exists?
    return file_useable?
  end

  def self.saved_restaurants
  # read the restaurant file
  # return instances of restaurant
  end

  def save
    return false unless Restaurant.file_useable?
    File.open(@@filepath, "a") do |file|
      file.puts "#{[@name, @cuisine, @price].join("\t")}\n"
    end
    return true
  end
end