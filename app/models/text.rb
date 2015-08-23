class Text
  attr_reader :phone_number, :text

  def self.[] params
    new(params[:From], params[:Body])
  end

  def initialize phone_number, text
    @phone_number, @text = phone_number, text
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
    Wunderground[text].generate_hourly_forecast
  end
end