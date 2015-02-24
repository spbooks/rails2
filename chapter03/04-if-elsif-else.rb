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

# Create one instance of StretchLimo. Experiment with creating
# more instances, to see how each condition evaluates.
larry = StretchLimo.new

# Example if-elsif-else construct.
if Car.count.zero?
  puts "No cars have been produced yet."
elsif Car.count >= 10
  puts "Production capacity has been reached."
else
  puts "New cars can still be produced."
end