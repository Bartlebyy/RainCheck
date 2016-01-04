class Text
  attr_reader :phone_number, :text

  def initialize phone_number, text
    @phone_number = phone_number
    @text = text
  end

  def run
    if valid_zipcode?
      weather_data
    else
      "Please input a valid zipcode in the form 12345 or 12345-1234"
    end
  end

  def valid_zipcode?
    text.match /^\d{5}(-\d{4})?$/
  end

  def weather_data
    Wunderground.new(text).generate_hourly_forecast
  end
end