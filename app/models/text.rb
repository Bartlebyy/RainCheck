class Text
  attr_reader :phone_number, :text

  def initialize phone_number, text
    @phone_number = phone_number
    @text = text
  end

  def run
    if valid_zipcode?
      person.update_zip(text)
      get_hourly_forecast_data
    else
      'Please input a valid zipcode in the form 12345 or 12345-1234'
    end
  end

  private

  def person
    @person ||= Person.find_by(phone_number: phone_number) || Person.create(phone_number: phone_number)
  end

  def valid_zipcode?
    text.match /^\d{5}(-\d{4})?$/
  end

  def get_hourly_forecast_data
    Wunderground.new(text).generate_hourly_forecast
  end
end
