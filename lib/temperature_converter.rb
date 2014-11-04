class TemperatureConverter
  def initialize(unit,value)
    @unit = unit
    @value = value
  end


  def unit
    @unit
  end


  def value
    @value
  end

  def to_celsius
    case unit
    when :celsius
      value
    when :kelvin
      value - 273.15
    when :fahrenheit
      (value - 32.0) * (5.0/9.0)
    end
  end

  def to_fahrenheit
    case unit
    when :fahrenheit
      value
    when :celsius
      value * (9.0/5.0) + 32.0
    when :kelvin
      1.788 * (value - 273.0) + 32.0
    end
  end

  def fix
    @value - 273
  end

  def to_kelvin
    # case @unit
    # when :fahrenheit
    #   1.0
    # when :celsius
    #   @value − 273.15
    # when :kelvin
    #   @value
    # end

    if unit == :kelvin
      value
    elsif unit == :celsius
      value + 273.15
    elsif unit == :fahrenheit
      (value - 32)/1.8 + 273.15
    end

  end
end
