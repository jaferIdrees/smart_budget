# inside app/controllers/home_controller.rb
class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    redirect_to groups_path if signed_in?
  end
end
