class HomeController < ApplicationController
  include GenerateToken
  before_action :create_token

  def index
    binding.pry
  end

  private

  def create_token
   @token = generate_token
  end
end
