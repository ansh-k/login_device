class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :check_user
  # Warden::Manager.after_authentication do |user,auth,opts|
  #     byebug
  #     user.last_login = Time.now
  #   end
  
end
