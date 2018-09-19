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

    if params[:phoneNumber] != "7549273987"
      r.say(message: "Sorry dude, This Call won't work because this is a demo account.", voice:"alice")
    else
      r.say(message: "This is working", voice:"alice")
    end

    dial = Twilio::TwiML::Dial.new caller_id: twilio_number
    dial.number("44" + params[:phoneNumber])
    r.append(dial)
  end
      return response.to_s
end

end
