class Car
  WHEELS = 4                # class constant
  @@number_of_cars = 0      # class variable
    
  def initialize
    @@number_of_cars = @@number_of_cars + 1
  end
  
  def self.count
    @@number_of_cars
  end
  
  def mileage=(x)           # instance variable writer
    @mileage = x            
  end
  
  def mileage               # instance variable reader
    @mileage
  end
end

class StretchLimo < Car
  WHEELS = 6                # class constant
  @@televisions = 1         # class variable
  
  def turn_on_television    
    # Invoke code for switching on on-board TV here
  end
end

class PontiacFirebird < Car
end

class VolksWagen < Car
end


# Create instances of these classes to work with
kitt = PontiacFirebird.new
kitt.mileage = 5667

batmobile = PontiacFirebird.new
batmobile.mileage = 4623

herbie = VolksWagen.new
herbie.mileage = 33014

larry = StretchLimo.new
larry.mileage = 20140

# Example unless-else construct
unless kitt.is_a?(StretchLimo)
  puts "This car only has room for two people."
else
  puts "This car is licensed to carry up to 10 passengers."
end