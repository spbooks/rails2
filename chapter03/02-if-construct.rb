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

# Example if construct
if Car.count.zero?
  puts "No cars have been produced yet."
end
