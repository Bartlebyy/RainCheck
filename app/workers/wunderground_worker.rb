class WundergroundWorker
  include Sidekiq::Worker

  def perform(person_id)
    person = Person.find person_id
    zipcode = person.zipcode
    report = Wunderground.new(zipcode).generate_hourly_forecast if zipcode
  end
end