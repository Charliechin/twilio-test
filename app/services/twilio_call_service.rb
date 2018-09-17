class TwilioCallService
  attr_reader :contact_number

  def initialize(contact_number)
    @contact_number = contact_number
  end

  def call
    client = Twilio::REST::Client.new
    client.calls.create({
      url: 'http://demo.twilio.com/docs/voice.xml',
      to: @contact_number,
      from: Rails.application.secrets.twilio_number
    })
  end
end
