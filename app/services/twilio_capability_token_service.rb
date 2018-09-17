class TwilioCapabilityTokenService
  #  TwilioSmsService.new("your message here").call
  attr_reader :role

  def initialize(role)
    @role = role
  end

  def call
    capability = Twilio::JWT::ClientCapability.new(Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token)
    outgoing_scope = Twilio::JWT::ClientCapability::OutgoingClientScope.new(Rails.application.secrets.twilio_api_sid, @role)
    capability.add_scope outgoing_scope

    incoming_scope = Twilio::JWT::ClientCapability::IncomingClientScope.new(role)
    capability.add_scope incoming_scope
    capability.to_s
  end
end
