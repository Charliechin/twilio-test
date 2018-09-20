class VideoCallController < ApplicationController
  def index
    @identity = current_user.email
  end
end
