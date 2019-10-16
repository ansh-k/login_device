Rails.application.routes.draw do
  devise_for :users
  mount LoginDevice::Engine => "/login_device"
  root to: "users#index"
end
