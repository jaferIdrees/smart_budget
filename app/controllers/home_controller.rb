# inside app/controllers/home_controller.rb
class HomeController < ApplicationController
  skip_before_action :authenticate_user!
end
