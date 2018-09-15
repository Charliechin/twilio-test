require 'twilio-ruby'

module GenerateToken
  extend ActiveSupport::Concern


  def generate_token

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




# twilio_account_sid = "AC17f633924f819879c5f1f83877f3ef85"
# twilio_auth_token  = "2934e990f32c5271363bf8fc90bad52d"
# #video
# twilio_api_key     = "SK599de60338e1a46dee5a20323878a68e"
# twilio_api_secret  = "SJIpoit5p3uWRbBvwIwKDWSj9Y8IyCX7"



end
