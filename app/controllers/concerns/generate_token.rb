require 'twilio-ruby'

module GenerateToken
  extend ActiveSupport::Concern

  def generate_token
    #TODO: Pass identity to the function
    identity = "User"
    video_grant = Twilio::JWT::AccessToken::VideoGrant.new
    video_grant.room = "Cool Room"


    token = Twilio::JWT::AccessToken.new(
      Rails.application.secrets.twilio_account_sid,
      Rails.application.secrets.twilio_api_key,
      Rails.application.secrets.twilio_api_secret,
      [video_grant],
      identity: identity
      )
    token.to_jwt
  end
end
