class WundergroundWorker
  include Sidekiq::Worker

  def perform
    Person.all.each do |p|
      # if person time_zone = current time
        # then send text
    end
  end

  def send_hourly_forecast(person_id)
    person = Person.find person_id
    zipcode = person.zipcode
    report = Wunderground.new(zipcode).generate_hourly_forecast if zipcode
    TwilioRemote.new(person).send_a_text(report)
  end
end
