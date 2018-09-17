class TwilioSmsService
#  TwilioSmsService.new("your message here").call
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def call
    client = Twilio::REST::Client.new
    client.messages.create({
      from: Rails.application.secrets.twilio_number,
      to: "+447549273987",
      body: message
    })
  end
end
