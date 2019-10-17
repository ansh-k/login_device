class ApplicationController < ActionController::Base
  #include LoginDevice::Controllers::ApplicationController
  #include LoginDevice\
  include LoginDevice
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  
end
