require 'spec_helper'

describe TemperatureConverter do
  describe 'initialization' do
    it "stores the type and value" do
      converter = TemperatureConverter.new(:fahrenheit, 68)
      expect(converter.type).to be == :fahrenheit
      expect(converter.value).to be == 68

      converter = TemperatureConverter.new(:celsius, 20)
      expect(converter.type ).to be == :celsius
      expect(converter.value).to be == 20

      converter = TemperatureConverter.new(:kelvin, 270)
      expect(converter.type ).to be == :kelvin
      expect(converter.value).to be == 270
    end
  end

  xdescribe '#to_celcius' do
    context "when already celsius" do
      it "returns the original value" do
        converter = TemperatureConverter.new(:celsius, 20)
        expect(converter.to_celcius).to be == 20
      end
    end

    context "when type is kelvin" do
      it "returns 273.15 less than the value" do
        converter = TemperatureConverter.new(:kelvin, 250)
        expect(converter.to_celcius).to be == -23.15
      end
    end

    context 'when type is fahrenheit' do
      it "returns a conversion based on the formula: (5/9)*(value - 32) ... (look it up if unclear)" do
        converter = TemperatureConverter.new(:fahrenheit, 100)
        expect(converter.to_celcius).to be_within(0.1).of(37.8)
      end
    end
  end

  xdescribe '#to_fahrenheit' do
    context 'when already in farenheit' do
      it "returns the original value" do
        converter = TemperatureConverter.new(:fahrenheit, 100)
        expect(converter.to_fahrenheit).to be == 100
      end
    end

    context 'when type is celcius' do
      it "returns the value based on the formula: (9/5)*(value) + 32" do
        converter = TemperatureConverter.new(:celsius, 50)
        expect(converter.to_fahrenheit).to be == 122
      end
    end

    context 'when type is kelvin' do
      it "return a value to be 273.15 more than the celcius conversion" do
        converter = TemperatureConverter.new(:kelvin, 50)
        expect(converter.to_fahrenheit).to be == 323.15
      end
    end
  end

  xdescribe '#to_kelvin' do
    context 'when already in kelvin' do
      it "returns the original value" do
        converter = TemperatureConverter.new(:kelvin, 400)
        expect(converter.to_kelvin).to be == 400
      end
    end

    context 'when type is celcius' do
      it "adds 273.15 to the value" do
        converter = TemperatureConverter.new(:celcius, 10)
        expect(converter.to_kelvin).to be == 283.15
      end
    end

    context 'when type is fahrenheit' do
      it "does some fancy stuff to get to the right number" do
        converter = TemperatureConverter.new(:farenheit, 100)
        expect(converter.to_kelvin).to be_within(0.1).of(310.95)
      end
    end
  end
end
