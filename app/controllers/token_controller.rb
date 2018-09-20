class TokenController < ApplicationController
  #before_action :authenticate_user!

  skip_before_action :verify_authenticity_token

  def generate
    token = ::TwilioCapability.generate("user")
    render json: { token: token }
  end

  def generate_video
    identity = params[:identity]
    token = ::TwilioCapability.generate_video(params[:identity])
    render json: {token: token, identity: identity}
  end

end
