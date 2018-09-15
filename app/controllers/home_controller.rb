class HomeController < ApplicationController
  include GenerateToken
  before_action :create_token

  def index
  end

  private

  def create_token
   @token = generate_token
   puts @token
  end
end
