require 'pry'

class TwilioCapability
  def self.generate(role)
    # To find TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN visit
    # https://www.twilio.com/user/account
    account_sid     = Rails.application.secrets.twilio_account_sid
    auth_token      = Rails.application.secrets.twilio_auth_token
    application_sid = Rails.application.secrets.twilio_api_sid
    capability = Twilio::JWT::ClientCapability.new(account_sid, auth_token)
    outgoing_scope = Twilio::JWT::ClientCapability::OutgoingClientScope.new(application_sid, role)
    capability.add_scope outgoing_scope

    incoming_scope = Twilio::JWT::ClientCapability::IncomingClientScope.new(role)
    capability.add_scope incoming_scope


    p capability.to_s
    capability.to_s
  end

  def self.generate_video(identity)
    # Required for Video
    @identity = identity
    # Create Voice grant for our token
    grant = Twilio::JWT::AccessToken::VideoGrant.new
    # Create an Access Token
    video_token = Twilio::JWT::AccessToken.new(
      Rails.application.secrets.twilio_account_sid,
      Rails.application.secrets.twilio_api_key,
      Rails.application.secrets.twilio_api_secret,
      [grant],
      identity: @identity
      )

    # Generate the token
    # uncomment and check sending the token as string
    p video_token
    video_token.to_s
  end
end

