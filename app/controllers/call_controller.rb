class CallController < ApplicationController
 skip_before_action :verify_authenticity_token
# before_action :authenticate_user!

  def connect
    render xml: twilio_reponse
  end

  private

  def twilio_reponse
    twilio_number = Rails.application.secrets.twilio_number
    res = Twilio::TwiML::VoiceResponse.new do |response|
    dial = Twilio::TwiML::Dial.new caller_id: twilio_number
      if params.include?(:phone_number)
        dial.number params[:phone_number]
      else
        # call some other number
        dial.number("447549273987")
      end
      response.append(dial)
    end
    return res.to_s
  end

end
