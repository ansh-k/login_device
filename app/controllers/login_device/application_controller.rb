module LoginDevice
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    
    include Engine.routes.url_helpers
    setup do
      @routes = Engine.routes
    end
    def check_user
      Warden::Manager.after_authentication do |user,auth,opts|
        user.last_login = Time.now
      end
    end
  end
end
