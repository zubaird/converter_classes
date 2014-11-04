require 'spec_helper'

describe TemperatureConverter do
  describe 'initialization' do
    it "stores the type and value" do
      converter = TemperatureConverter.new(:fahrenheit, 68)
      expect(converter.unit).to be == :fahrenheit
      expect(converter.value).to be == 68

      converter = TemperatureConverter.new(:celsius, 20)
      expect(converter.unit).to be == :celsius
      expect(converter.value).to be == 20

      converter = TemperatureConverter.new(:kelvin, 270)
      expect(converter.unit).to be == :kelvin
      expect(converter.value).to be == 270
    end
  end

  describe '#to_celsius' do
    it "returns the original temperature when given celsius" do
      converter = TemperatureConverter.new(:celsius, 20)

      expect(converter.to_celsius).to be == 20
    end

    it "returns the temperature in celsius when given kelvin" do
      # The formula to convert kelvin to celsius is:
      # celsius_temperature = kelvin_temperature -  273.15
      converter = TemperatureConverter.new(:kelvin, 250)

      expect(converter.to_celsius).to be_within(0.1).of(-23.15)
    end

    it "returns the temperature in celsius when given fahrenheit" do
      # The formula to convert fahrenheit to celsius is:
      # celsius_temperature = (fahrenheit_temperature - 32.0) * (5.0/9.0)
      converter = TemperatureConverter.new(:fahrenheit, 100)

      expect(converter.to_celsius).to be_within(0.1).of(37.8)
    end
  end

  describe '#to_fahrenheit' do
    it "returns the original temperature when given fahrenheit" do
      converter = TemperatureConverter.new(:fahrenheit, 100)

      expect(converter.to_fahrenheit).to be == 100
    end

    it "returns the temperature in fahrenheit when given celsius" do
      # The formula to convert celsius to fahrenheit is:
      # fahrenheit_temperature = celsius_temperature * (9.0/5.0) + 32.0
      converter = TemperatureConverter.new(:celsius, 50)

      expect(converter.to_fahrenheit).to be == 122
    end

    it "return the temperature in fahrenheit when given kelvin" do
      # What do you think the formula is?
      converter = TemperatureConverter.new(:kelvin, 300)

      expect(converter.to_fahrenheit).to be_within(0.1).of(80.33)
    end
  end

  describe '#to_kelvin' do
    it "returns the original temperature when given fahrenheit" do
      converter = TemperatureConverter.new(:kelvin, 400)

      expect(converter.to_kelvin).to be == 400
    end

    it "returns the temperature in kelvin when given celsius" do
      converter = TemperatureConverter.new(:celsius, 10)

      expect(converter.to_kelvin).to be == 283.15
    end


    it "returns the temperature in kelvin when given fahrenheit" do
      converter = TemperatureConverter.new(:fahrenheit, 100)

      expect(converter.to_kelvin).to be_within(0.1).of(310.95)
    end
  end
end
