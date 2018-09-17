require 'twilio-ruby'
class TwilioVoiceAccessTokenService
  #Returns a JWT voice token

  def initialize

  end

  def call
    # Required for any Twilio Access Token
    account_sid = Rails.application.secrets.twilio_account_sid
    api_key     = Rails.application.secrets.twilio_api_key
    api_secret  = Rails.application.secrets.twilio_api_secret
    api_sid     = Rails.application.secrets.twilio_api_sid
    # Required for Voice
    outgoing_application_sid = api_sid
    identity = 'user'

    # Create Voice grant for our token
    grant = Twilio::JWT::AccessToken::VoiceGrant.new
    grant.outgoing_application_sid = outgoing_application_sid

    # Create an Access Token
    token = Twilio::JWT::AccessToken.new(
      account_sid,
      api_key,
      api_secret,
      [grant],
      identity: identity
      )

    # Generate the token
    token.to_jwt
  end




end
