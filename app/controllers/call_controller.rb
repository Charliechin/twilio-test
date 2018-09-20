class CallController < ApplicationController
 skip_before_action :verify_authenticity_token
# before_action :authenticate_user!

def connect
  render xml: twilio_reponse
end

private

def twilio_reponse
  twilio_number = Rails.application.secrets.twilio_number
  response = Twilio::TwiML::VoiceResponse.new do | r |
    dial = Twilio::TwiML::Dial.new caller_id: twilio_number
    if params.include?(:phoneNumber)
      r.say(message: "This is working, connecting: ", voice:"alice")
      dial.number("44" + params[:phoneNumber])
    else
      #if there are no phone numbers, call the app
      dial.client('user');
      r.say(message: "Calling Rails app", voice:"alice")
    end

    r.append(dial)
  end
      return response.to_s
end

end
