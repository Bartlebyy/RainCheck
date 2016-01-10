class TwilioRemote
  def initialize(person)
    @person = person
  end

  def send_a_text(message)
    client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: @person.phone_number,
      body: message
    )
  end

  private

  def client
    @client ||= Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end
end
