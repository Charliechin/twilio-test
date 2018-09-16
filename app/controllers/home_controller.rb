class HomeController < ApplicationController
  def index
  end

  def verify
  end

  def resend
  end

  def show_verify
    return redirect_to new_user_session_path unless session[:user_id]
  end


  def verify
    @user = current_user

    # Use Authy to send the verification token
    token = Authy::API.verify(id: @user.authy_id, token: params[:token])

    if token.ok?
      # Mark the user as verified for get /user/:id
      @user.update(verified: true)

      # Send an SMS to the user 'success'
      send_message("You did it! Signup complete :)")

      redirect_to home_verify_path
    else
      flash.now[:danger] = "Incorrect code, please try again"
      render :show_verify
    end
  end

  def send_message(message)
    @user = current_user
    twilio_number = Rails.application.secrets.twilio_number
    account_sid = Rails.application.secrets.twilio_account_sid
    @client = Twilio::REST::Client.new account_sid, Rails.application.secrets.twilio_auth_token
    message = @client.api.accounts(account_sid).messages.create(
      :from => twilio_number,
      :to => @user.country_code+@user.phone_number,
      :body => message
    )
  end


end
