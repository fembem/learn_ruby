class Temperature

  def initialize(options)
    if options.has_key? :f
      #puts "Got :f => " + options[:f].to_s
      @fahrenheit = options[:f]
      @celsius = (@fahrenheit-32).to_f * (5.0 / 9)
    elsif options.has_key? :c
      #puts "Got :c => " + options[:c].to_s
      @celsius = options[:c]
      @fahrenheit = @celsius *(9.0/5) + 32
    end
  end

  def self.from_celsius(in_celsius)
    Temperature.new({:c => in_celsius})
  end

  def self.from_fahrenheit(in_fahrenheit)
    Temperature.new({:f => in_fahrenheit})
  end


  def in_fahrenheit
    @fahrenheit
  end
  def in_celsius
    @celsius
  end
end

class Celsius < Temperature
  def initialize(in_celsius)
    super({:c => in_celsius})
  end
end

class Fahrenheit < Temperature
  def initialize(in_fahrenheit)
    super({:f => in_fahrenheit})
  end
end