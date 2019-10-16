module LoginDevice
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    
    include Engine.routes.url_helpers
    setup do
      @routes = Engine.routes
    end
    def check_user
      puts 'on engine file'
      Warden::Manager.after_authentication do |user,auth,opts|
        user.last_login = Time.now
        puts "on engine file #{user.email}"
      end
    end
  end
end
