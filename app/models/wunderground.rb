class Wunderground
  require 'open-uri'
  require 'json'

  attr_reader :zipcode

  def self.[] zipcode
    new(zipcode)
  end

  def initialize zipcode
    @zipcode = zipcode
  end

  def generate_hourly_forecast
    report(hourly_data)
  end

  def hourly_data
    open("http://api.wunderground.com/api/#{ ENV['WUNDERGROUND_KEY'] }/hourly/q/#{ zipcode }.json") do |f|
      json_string = f.read
      hourly_forecast = JSON.parse(json_string)['hourly_forecast']
    end
  end

  def report hourly_forecast, num_of_hours = 12
    final_report = [""]

    (0...num_of_hours).map do |n| 
      data = hourly_forecast[n]
      hour = data["FCTTIME"]["hour"]
      meridian_hour = convert_to_meridian(hour.to_i).rjust(2, '0')
      temp = data["temp"]["english"] + "°"
      rain = (data["pop"] + "%")
      condition = data["icon"]

      final_report << "#{ meridian_hour }: #{ temp } #{ rain } #{ condition }"
    end
    final_report.join("\n")
  end

  def convert_to_meridian military_hour
    if military_hour == 0
      "12"
    elsif military_hour <= 12
      military_hour.to_s 
    else
      (military_hour - 12).to_s
    end
  end

end